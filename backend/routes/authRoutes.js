const express = require("express");
const mongoose = require("mongoose");
const bcrypt = require("bcrypt");

const User = require("../models/userModel");
const router = express.Router();

// register a user
router.post("/register", async (req, res) => {
  const { username, email, password, ...rest } = req.body;
  const saltRounds = 10;
  try {
    // const userExists = await User.find({ email });

    // if (userExists) {
    //   return res.status(403).json({
    //     message: "user already exists!!",
    //   });
    // }

    const hasedPassword = await bcrypt.hash(password, saltRounds);
    const user = new User({
      email: email,
      username: username,
      password: hasedPassword,
    });
    user.password = "";
    res.status(201).json({
      message: "Succes",
      user,
    });
  } catch (e) {
    res.status(403).json({
      message: "failed",
    });
  }
});

// exports routes module
module.exports = router;
