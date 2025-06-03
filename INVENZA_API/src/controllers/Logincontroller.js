const { getConnection, sql } = require('../config/database');
const { encrypt, decrypt } = require('../middleware/crypto');
const { bcypt } = require('bcryptjs');

const login = async (req, res) => {
    try {
        const { username, password } = req.body;


        if (!username || !password) {
            return res.status(400).json({
                success: false,
                message: 'Username and password are required'
            });
        }
        const decryptedusername = decrypt(username); // Decrypt the username if needed
        const decryptedpassword = decrypt(password); // Decrypt the password if needed

        const hasedPassword = await bcypt.hash(decryptedpassword, 10); // Hash the password     


        const pool = await getConnection();

        const result = await pool.request()
            .input('username', sql.NVarChar, decryptedusername)
            .input('password', sql.NVarChar, decryptedpassword)
            .query(`
                SELECT * FROM Users WHERE Username = @username AND Password = @password;
            `);

        if (result.recordset.length > 0) {
            res.json({
                success: true,
                message: 'Login successful',
                user: result.recordset[0]
            });
        } else {
            res.status(401).json({
                success: false,
                message: 'Invalid username or password'
            });
        }
    } catch (error) {
        console.error('Error in login:', error);
        res.status(500).json({
            success: false,
            message: 'Server error',
            error: error.message
        });
    }
}

const register = async (req, res) => {
    try {
        const { username, password } = req.body;

        if (!username || !password) {
            return res.status(400).json({
                success: false,
                message: 'Username and password are required'
            });
        }

        const decryptedusername = decrypt(username); // Decrypt the username if needed
        const decryptedpassword = decrypt(password); // Decrypt the password if needed

        const hashedPassword = await bcypt.hash(decryptedpassword, 10); // Hash the password

        const pool = await getConnection();

        const result = await pool.request()
            .input('username', sql.NVarChar, decryptedusername)
            .input('password', sql.NVarChar, hashedPassword)
            .query(`
                CREATE TABLE U01_USER
(
    USER_ID INT PRIMARY KEY IDENTITY,
    USERNAME NVARCHAR(50) UNIQUE NOT NULL,
    PASSWORD_HASH NVARCHAR(255) NOT NULL,
    ROLE_ID INT FOREIGN KEY REFERENCES U01_ROLE(ROLE_ID),
    EMAIL NVARCHAR(100),
    PHONE NVARCHAR(20),
    IS_ACTIVE BIT DEFAULT 1,
    CREATED_AT DATETIME DEFAULT GETDATE()
);
                INSERT INTO Users (Username, Password) VALUES (@username, @password);
            `);

        res.json({
            success: true,
            message: 'User registered successfully'
        });
    } catch (error) {
        console.error('Error in register:', error);
        res.status(500).json({
            success: false,
            message: 'Server error',
            error: error.message
        });
    }
};


module.exports = {

};