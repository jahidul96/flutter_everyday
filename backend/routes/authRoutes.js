const express = require("express");
const mongoose = require("mongoose");
const router = express.Router();

// register a user
router.post("/register", async (req, res) => {
  const { username, email, ...rest } = req.body;

  console.log(req.body);
  try {
    res.status(201).json({
      message: "Succes",
      username,
      email,
    });
  } catch (e) {
    res.status(403).json({
      message: "failed",
    });
  }
});

// exports routes module
module.exports = router;
