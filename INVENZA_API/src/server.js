require('dotenv').config();
const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const rateLimit = require('express-rate-limit');
const http = require('http');


const swaggerUi = require("swagger-ui-express");



const jwt = require('jsonwebtoken');
const app = express();




app.use(helmet());
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// const limiter = rateLimit({
//   windowMs: 15 * 60 * 1000, 
//   max: 100
// });
// app.use(limiter);

app.get('/hello', (req, res) => {
  res.send("hello")
}
)



const path = require("path");

const swaggerFilePath = process.env.NODE_ENV === "production"
  ? path.join(__dirname, "./swagger-output.json")
  : path.join(__dirname, "./swagger-output.json");

const swaggerFile = require(swaggerFilePath);

app.use("/app", swaggerUi.serve, swaggerUi.setup(swaggerFile));
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({
    success: false,
    message: 'Something went wrong!',
    error: process.env.NODE_ENV === 'development' ? err.message : undefined
  });
});



const PORT = process.env.PORT || 8934;


app.listen(PORT, () => {
  console.log(`Server is running on port http://localhost:${PORT}`);
});



