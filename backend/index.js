const express = require("express");

// app initializetion
const app = express();

// port
const PORT = 4000 || process.env.PORT;

// data

const userData = [
  {
    name: "jahidul islam",
    email: "jahidul@gmail.com",
    desc: "this is just fro demo purpose data!!",
    isAdmin: true,
  },
  {
    name: "akash",
    email: "akash@gmail.com",
    desc: "this is just fro demo purpose data!!",
    isAdmin: true,
  },
  {
    name: "naim islam",
    email: "naim@gmail.com",
    desc: "this is just fro demo purpose data!!",
    isAdmin: true,
  },
];

// routes
app.get("/user", (req, res) => {
  res.status(200).json({
    name: "jahidul islam",
    email: "jahidul@gmail.com",
    desc: "this is just fro demo purpose data!!",
    isAdmin: true,
  });
});

app.get("/all/users", (req, res) => {
  res.status(200).json(userData);
});

app.listen(PORT, () => console.log("server is runnong on port " + PORT));
