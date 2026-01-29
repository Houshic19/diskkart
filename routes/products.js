const express=require("express");
const sqlite3=require("sqlite3").verbose();
const router=express.Router();
const db=new sqlite3.Database("./db/diskkart.db");

router.get("/",(r,s)=>{
 db.all("SELECT * FROM products",(e,p)=>s.render("home",{p:p||[],user:r.session.user}));
});

router.get("/category/:c",(r,s)=>{
 db.all("SELECT * FROM products WHERE category='"+r.params.c+"'",(e,p)=>{
  s.render("category",{p:p||[],cat:r.params.c,user:r.session.user});
 });
});

router.get("/product/:id",(r,s)=>{
 db.get("SELECT * FROM products WHERE id="+r.params.id,(e,p)=>{
  s.render("product",{p:p||{},user:r.session.user});
 });
});

router.post("/add-to-cart",(r,s)=>{
 if(!r.session.cart) r.session.cart=[];
 const item={
  id:r.body.product_id,
  name:r.body.name,
  price:r.body.price,
  qty:parseInt(r.body.qty)||1
 };
 const existing=r.session.cart.find(x=>x.id==item.id);
 if(existing) existing.qty+=item.qty;
 else r.session.cart.push(item);
 s.redirect("/cart");
});

router.get("/search",(r,s)=>{
 db.all("SELECT * FROM products WHERE name LIKE '%"+r.query.q+"%'",(e,p)=>{
  s.render("category",{p:p||[],cat:r.query.q,user:r.session.user});
 });
});

router.get("/cart",(r,s)=>{
 const cart=r.session.cart||[];
 const total=cart.reduce((sum,item)=>sum+(item.price*item.qty),0);
 s.render("cart",{cart,total,user:r.session.user});
});

router.post("/remove-from-cart",(r,s)=>{
 r.session.cart=r.session.cart.filter(x=>x.id!=r.body.product_id);
 s.redirect("/cart");
});

module.exports=router;
