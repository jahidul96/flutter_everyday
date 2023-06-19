const express = require("express");
const mongoose = require("mongoose");
const dbConnection = require("./db");
const { Server } = require("socket.io");
const http = require("http");
require("dotenv").config();

// routes imports
const authRoutes = require("./routes/authRoutes");

// port
const PORT = 4000 || process.env.PORT;

// app initializetion
const app = express();

// middlewares
app.use(express.json());

// server
const server = http.createServer(app);

// api routes
app.use("/auth", authRoutes);

// db connection
// mongoose.set("strictQuery", false);
// dbConnection()
//   .then(() => console.log("db connected"))
//   .catch((e) => console.log(e.message));

server.listen(PORT, () => console.log("server is running on port " + PORT));

// socket code

const io = new Server(server, {
  cors: {
    origin: "*",
  },
});

io.on("connection", (socket) => {
  console.log("connected" + socket.id);

  socket.emit("hello", {
    name: "socket io initialized",
    age: " hell now",
  });
});
