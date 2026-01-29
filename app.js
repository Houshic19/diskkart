require("dotenv").config();
const express = require("express");
const session = require("express-session");
const bodyParser = require("body-parser");

const app = express();
app.set("view engine","ejs");

app.use(bodyParser.urlencoded({extended:true}));
app.use(express.static("public"));

app.use(session({
 secret:"diskkart",
 resave:true,
 saveUninitialized:true
}));

app.use("/",require("./routes/auth"));
app.use("/",require("./routes/products"));
app.use("/admin",require("./routes/admin"));
app.use("/",require("./routes/payment"));

const PORT = process.env.PORT || 3000;
app.listen(PORT,()=>console.log(`Server running on port ${PORT}`));
