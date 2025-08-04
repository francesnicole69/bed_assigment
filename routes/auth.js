const express = require("express");
const router = express.Router();
const userController = require("../Controller/UserController");
const verifyJWT = require("../Middleware/verifyJWT");

// Public routes
router.post("/register", userController.registerUser);
router.post("/login", userController.login);

// Protected routes
router.get("/me", verifyJWT, userController.getCurrentUser);

module.exports = router;
