const express = require("express");

// app initializetion
const app = express();

// port
const PORT = 4000 || process.env.PORT;

app.use((req, res, next) => {
  console.log("this is a middlewares");
  next();
});

// routes
app.get("/main", (req, res) => {
  res.status(200).json({
    message: "you have got our url right",
    succes: true,
  });
});

app.listen(PORT, () => console.log("server is runnong on port " + PORT));
