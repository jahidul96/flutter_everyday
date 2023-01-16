const express = require("express");
const mongoose = require("mongoose");
const dbConnection = require("./db");
require("dotenv").config();

// routes imports
const authRoutes = require("./routes/authRoutes");

// app initializetion
const app = express();

// middlewares
app.use(express.json());

// port
const PORT = 4000 || process.env.PORT;

// api routes
app.use("/auth", authRoutes);

// db connection
mongoose.set("strictQuery", false);
dbConnection()
  .then(() => console.log("db connected"))
  .catch((e) => console.log(e.message));

app.listen(PORT, () => console.log("server is runnong on port " + PORT));
