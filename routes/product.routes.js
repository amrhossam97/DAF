module.exports = (app) => {
  const product = require("../controllers/product.controller.js");

  var router = require("express").Router();

  // Get All Products
  router.get("/", product.findAll);

  // Add Product
  router.post("/", product.create);

  app.use("/api/products", router);
};
