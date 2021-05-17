const express = require("express");
const app = express();
const port = process.env.PORT || 3000;

//middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use((req, res, next) => {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Headers, Authorization"
  );
  res.setHeader(
    "Access-Control-Allow-Methods",
    "GET, POST, PATCH, DELETE, PUT, OPTIONS"
  );
  next();
});

//routes
require("./routes/product.routes")(app);
require("./routes/order.routes")(app);
require("./routes/user.routes")(app);

//error handller
app.use((err, req, res, next) => {
  console.log(err.message);
  res.status(422).send({ err: err.message });
});

// listen port
app.listen(port, () => console.log("server started at port " + port));
