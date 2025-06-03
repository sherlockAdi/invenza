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


module.exports = {

};