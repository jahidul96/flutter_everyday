const express = require("express");

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

app.listen(PORT, () => console.log("server is runnong on port " + PORT));
