module.exports = (app) => {
  const order = require("../controllers/order.controller.js");

  var router = require("express").Router();

  // Create Order
  router.post("/", order.create);

  // Change status
  router.put("/status/:orderId", order.changeStatus);

  app.use("/api/orders", router);
};
