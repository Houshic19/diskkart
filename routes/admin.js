const express=require("express");
const sqlite3=require("sqlite3").verbose();
const router=express.Router();
const db=new sqlite3.Database("./db/diskkart.db");

// Admin middleware to check if user is admin
const adminAuth=(r,s,next)=>{
 if(!r.session.user || r.session.user.role!=='admin'){
  return s.status(403).send("<h2>Access Denied</h2><p>Only admins can access this page</p><a href='/'>Go Home</a>");
 }
 next();
};

router.use(adminAuth);

router.get("/",(r,s)=>{
 db.all("SELECT * FROM orders ORDER BY created_at DESC LIMIT 100",(e,orders)=>{
  db.all("SELECT COUNT(*) as total FROM orders",(e,count)=>{
   db.all("SELECT SUM(total_amount) as revenue FROM orders",(e,rev)=>{
    s.render("admin/dashboard",{
     orders:orders||[],
     total_orders:count?count[0].total:0,
     revenue:rev?rev[0].revenue:0,
     user:r.session.user
    });
   });
  });
 });
});

router.get("/products",(r,s)=>{
 db.all("SELECT * FROM products",(e,p)=>s.render("admin/products",{p:p||[],user:r.session.user}));
});

router.post("/add",(r,s)=>{
 const q="INSERT INTO products(name,category,subcategory,description,price,image) VALUES('"+
 r.body.name+"','"+r.body.category+"','"+r.body.subcategory+"','"+r.body.description+"',"+r.body.price+",'"+r.body.image+"')";
 db.run(q,()=>s.redirect("/admin/products"));
});

router.post("/delete-product",(r,s)=>{
 const q="DELETE FROM products WHERE id="+r.body.product_id;
 db.run(q,()=>s.redirect("/admin/products"));
});

module.exports=router;
