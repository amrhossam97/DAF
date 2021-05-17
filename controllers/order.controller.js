const db = require("../db.connection");

//create order
exports.create = (req, res) => {
  db.query(
    "INSERT INTO `order` ( `User Id`, `Total price`, `Status`) VALUES ('" +
      req.body.user_id +
      "', '" +
      req.body.price +
      "', '" +
      req.body.status +
      "')",
    (err, result) => {
      if (err) {
        res.status(500).send({
          message: err.message || "Some error occurred while Add Order.",
        });
      }
      res.status(201).send("Added successfully");
    }
  );
};

//change status
exports.changeStatus = (req, res) => {
  db.query(
    "UPDATE `order` SET `status` = '" +
      req.body.status +
      "' WHERE `order`.`id` = " +
      req.params.orderId,
    (err, result) => {
      if (err) {
        res.status(500).send({
          message: err.message || "Some error occurred while Add Order.",
        });
      }
      res.status(201).send("Edited successfully");
    }
  );
};
