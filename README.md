# DAF
Code Challenge 

First you need the database so you must import it in your localhost you will find file 'daf.sql' it contains database first create database and name it 'daf' then import it.

To run the code you can use 'nodemon' or 'npm start' from terminal.

This is the list of APIs :
- Get all products : GET "http://localhost:3000/api/products/", 
- Add product : POST "http://localhost:3000/api/products/", body:{ name , price , quantity }
- Create Order : POST "http://localhost:3000/api/orders/", body:{ user_id , price , status }
- Change Status : PUT "http://localhost:3000/api/orders/status/:orderId", body:{ status }
- Get User Orders : GET "http://localhost:3000/api/users/orders/:userId",
- Signin : POST "http://localhost:3000/api/users/signin", body:{ email , password }
- Register : POST "http://localhost:3000/api/users/signup", body:{ first_name , middle_name , last_name , email , password , phone }

