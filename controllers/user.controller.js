const db = require("../db.connection");
const jwt = require("jsonwebtoken");

ACCESS_TOKEN_SECRET =
  "3d63c724836f5480311e0097ce252948692bfe1c63dc315b9fe1058b6d592a41a60ef505c093bcf77a8bc6e3e0717dece8a3dcdfe8649688306dabfecf3b5c11";

//get user orders
exports.orders = (req, res) => {
  db.query(
    "SELECT * FROM `user orders` WHERE `User id` =" + req.params.userId,
    (err, result) => {
      if (err) {
        res.status(500).send({
          message: err.message || "Some error occurred while Add Order.",
        });
      }
      res.status(200).send(result);
    }
  );
};

//sign in
exports.signIn = (req, res) => {
  db.query(
    "SELECT `password`,`id` FROM `user` WHERE `email` ='" +
      req.body.email +
      "'",
    (err, result) => {
      if (err) {
        res.status(500).send({
          message: err.message || "Some error occurred while Sign In.",
        });
      }
      if (result.length === 0) {
        res.status(500).send("Email is incorrect");
      } else if (req.body.password === result[0].password) {
        const accessToken = jwt.sign(req.body.email, ACCESS_TOKEN_SECRET);
        db.query(
          "UPDATE `user` SET `Token` = '" +
            accessToken +
            "' WHERE `user`.`id` = " +
            result[0].id,
          (err, result) => {
            res.status(200).send("Logged In successfully");
          }
        );
      } else {
        res.status(401).send("Passwrod is incorrect");
      }
    }
  );
};

//register
exports.signUp = (req, res) => {
  db.query(
    "INSERT INTO `user` ( `First name`, `Middle name`, `Last name`, `Email`, `password`, `Phone number`) VALUES ( '" +
      req.body.first_name +
      "', '" +
      req.body.middle_name +
      "', '" +
      req.body.last_name +
      "', '" +
      req.body.email +
      "', '" +
      req.body.password +
      "', '" +
      req.body.phone +
      "')",
    (err, result) => {
      if (err) {
        res.status(500).send({
          message: err.message || "Some error occurred while Add User.",
        });
      }
      res.status(200).send("User Added");
    }
  );
};
