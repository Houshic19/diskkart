const express=require("express");
const Razorpay=require("razorpay");
const sqlite3=require("sqlite3").verbose();
const router=express.Router();
const db=new sqlite3.Database("./db/diskkart.db");

let rzp;
const razorpayKey = process.env.RAZORPAY_KEY_ID || "";
const razorpaySecret = process.env.RAZORPAY_KEY_SECRET || "";

if(razorpayKey && razorpaySecret){
 rzp=new Razorpay({
  key_id:razorpayKey,
  key_secret:razorpaySecret
 });
}

router.get("/checkout",(r,s)=>{
 if(!r.session.user){
  return s.redirect("/login?next=/checkout");
 }
 const cart=r.session.cart||[];
 const total=cart.reduce((sum,item)=>sum+(item.price*item.qty),0);
 s.render("checkout",{user:r.session.user,cart,total,razorpayKey:razorpayKey});
});

router.post("/pay",(r,s)=>{
 if(!r.session.user){
  return s.status(401).json({error:"Please login first"});
 }
 
 // Save order to database
 const cart=r.session.cart||[];
 const items=JSON.stringify(cart);
 const amount=parseInt(r.body.amount);
 
 const q="INSERT INTO orders(user_id,username,items,total_amount,fullname,email,phone,address,city,state,postalcode,payment_status) VALUES("+
 r.session.user.id+",'"+r.session.user.username+"','"+items.replace(/'/g,"''")+"',"+amount+",'"+r.body.fullname+"','"+r.body.email+"','"+r.body.phone+"','"+r.body.address+"','"+r.body.city+"','"+r.body.state+"','"+r.body.postalcode+"','pending')";
 
 db.run(q,function(err){
  if(err){
   console.error("Order save error:",err);
   return s.status(500).json({error:"Error saving order"});
  }
  
  if(!rzp){
   // If Razorpay not configured, mark as completed
   db.run("UPDATE orders SET payment_status='completed' WHERE id="+this.lastID);
   r.session.cart=[];
   return s.json({id:"demo_order_"+this.lastID,success:true});
  }
  
  rzp.orders.create({
   amount:amount*100,
   currency:"INR"
  },(e,o)=>{
   if(e){
    s.status(500).json({error:e.message});
   } else {
    s.json(o);
   }
  });
 });
});

router.post("/payment-verify",(r,s)=>{
 if(!r.session.user){
  return s.status(401).json({error:"Unauthorized"});
 }
 
 // Mark order as completed
 db.run("UPDATE orders SET payment_status='completed' WHERE payment_status='pending' ORDER BY created_at DESC LIMIT 1");
 r.session.cart=[];
 s.json({success:true,message:"Payment successful"});
});

module.exports=router;

module.exports=router;
