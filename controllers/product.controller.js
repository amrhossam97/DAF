const db = require("../db.connection");
//get all products
exports.findAll = (req, res) => {
  db.query("SELECT * FROM `product`", (err, result) => {
    if (err) {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving products.",
      });
    }
    res.status(200).send(result);
  });
};

//add product
exports.create = (req, res) => {
  db.query(
    "INSERT INTO `product` ( `product_name`, `price`, `quantity`) VALUES ('" +
      req.body.name +
      "', '" +
      req.body.price +
      "', '" +
      req.body.quantity +
      "')",
    (err, result) => {
      if (err) {
        res.status(500).send({
          message: err.message || "Some error occurred while Add product.",
        });
      }
      res.status(201).send("Added successfully");
    }
  );
};
