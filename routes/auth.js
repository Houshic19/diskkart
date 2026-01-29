const express=require("express");
const sqlite3=require("sqlite3").verbose();
const router=express.Router();
const db=new sqlite3.Database("./db/diskkart.db");

router.get("/login",(r,s)=>s.render("login"));
router.get("/register",(r,s)=>s.render("register"));

router.post("/login",(req,res)=>{
 const username=req.body.username?.trim();
 const password=req.body.password?.trim();
 
 if(!username || !password){
  return res.send("Please provide username and password");
 }
 
 const q="SELECT * FROM users WHERE username='"+username+"' AND password='"+password+"'";
 db.get(q,(e,u)=>{
  if(e){
   console.error("Login error:",e);
   res.send("Database error");
  } else if(u){ 
   req.session.user=u; 
   res.redirect("/"); 
  } else {
   res.send("<h2>Invalid Credentials</h2><p>Username or password is incorrect</p><a href='/login'>Back to Login</a>");
  }
 });
});

router.post("/register",(req,res)=>{
 const q="INSERT INTO users(username,password,role) VALUES('"+req.body.username+"','"+req.body.password+"','user')";
 db.run(q,()=>res.redirect("/login"));
});

router.get("/logout",(r,s)=>{r.session.destroy();s.redirect("/login");});
module.exports=router;
