module.exports = (app) => {
  const user = require("../controllers/user.controller.js");

  var router = require("express").Router();

  // Get user orders
  router.get("/orders/:userId", user.orders);

  // Register
  router.post("/signup", user.signUp);

  // Sign In
  router.post("/signin", user.signIn);

  app.use("/api/users", router);
};
