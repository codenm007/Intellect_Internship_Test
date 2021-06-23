require("dotenv").config();
const express = require("express");
const app = new express();
const parser = require("body-parser");
const cors = require('cors');
const helmet = require("helmet");

app.use(helmet());
app.use(cors());
app.use(
  parser.urlencoded({
    extended: false,
  })
);

app.use(parser.json());

app.get("/", (req, res) => {
    res.json({
    resp_code : 200,
    resp_message : "Hi from Nilanjan, don't worry server is up and running !",
    });
  });
  

app.all("*", (req, res) => {
  res.status(200).json({
   resp_code : 204,
   resp_message : "Not a valid endpoint ! , Galat site visit hogaya ji XD"
   });
});

const PORT = process.env.PORT || 3000;

app.listen(PORT , ()=>
console.log(`Server is listening on port ${PORT}`)
);
