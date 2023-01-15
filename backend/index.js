const express = require("express");

// app initializetion
const app = express();

// port
const PORT = 4000 || process.env.PORT;

// routes
app.get("/user", (req, res) => {
  res.status(200).json({
    name: "jahidul islam",
    email: "jahidul@gmail.com",
    desc: "this is just fro demo purpose data!!",
    isAdmin: true,
  });
});

app.listen(PORT, () => console.log("server is runnong on port " + PORT));
