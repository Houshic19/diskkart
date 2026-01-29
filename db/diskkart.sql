DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;

CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT,
  password TEXT,
  role TEXT
);

CREATE TABLE products (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  category TEXT,
  subcategory TEXT,
  description TEXT,
  price INTEGER,
  image TEXT
);

CREATE TABLE orders (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER,
  username TEXT,
  items TEXT,
  total_amount INTEGER,
  fullname TEXT,
  email TEXT,
  phone TEXT,
  address TEXT,
  city TEXT,
  state TEXT,
  postalcode TEXT,
  payment_status TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO users(username,password,role) VALUES
('admin','admin123','admin'),
('user','user123','user'),
('john.doe','password123','user'),
('sarah.smith','secure456','user'),
('mike.wilson','tech789','user');

/* ===== STORAGE ===== */
INSERT INTO products VALUES
(NULL,'Seagate 1TB Laptop HDD','Storage','Laptop HDD','High capacity 1TB 2.5 inch HDD for laptops with fast speed and reliability',3200,'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=400&h=400&fit=crop'),
(NULL,'WD 2TB Desktop HDD','Storage','Desktop HDD','Reliable 2TB 3.5 inch HDD perfect for desktop computers and NAS systems',4800,'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=400&h=400&fit=crop'),
(NULL,'Samsung 970 EVO SSD','Storage','SSD','Ultra-fast 500GB SSD with NVMe interface for rapid boot and load times',3900,'https://images.unsplash.com/photo-1639815189175-a40fc8acab45?w=400&h=400&fit=crop'),
(NULL,'WD Black 1TB NVMe','Storage','NVME','Premium 1TB NVMe SSD with exceptional performance for gaming and content creation',7500,'https://images.unsplash.com/photo-1639815189175-a40fc8acab45?w=400&h=400&fit=crop');

/* ===== RAM ===== */
INSERT INTO products VALUES
(NULL,'Corsair Vengeance 8GB DDR4','RAM','Desktop RAM','8GB DDR4 3200MHz RAM with RGB lighting for gaming PCs',2800,'https://images.unsplash.com/photo-1587829191301-4b10a2f0b8e8?w=400&h=400&fit=crop'),
(NULL,'Crucial 16GB Laptop RAM','RAM','Laptop RAM','16GB DDR4 SODIMM RAM perfect for laptops and ultrabooks',4200,'https://images.unsplash.com/photo-1587829191301-4b10a2f0b8e8?w=400&h=400&fit=crop'),
(NULL,'G.Skill Trident Z 32GB','RAM','Desktop RAM','High-performance 32GB DDR4 kit for power users and professionals',8900,'https://images.unsplash.com/photo-1587829191301-4b10a2f0b8e8?w=400&h=400&fit=crop');

/* ===== GRAPHICS CARDS ===== */
INSERT INTO products VALUES
(NULL,'NVIDIA RTX 3060','Graphics Card','GPU','12GB GDDR6 memory RTX 3060 for 1440p gaming and creative work',28000,'https://images.unsplash.com/photo-1591290621127-8b9aae415c5b?w=400&h=400&fit=crop'),
(NULL,'RTX 4070 Super','Graphics Card','GPU','High-end 12GB GDDR6X GPU for 4K gaming and AI applications',65000,'https://images.unsplash.com/photo-1591290621127-8b9aae415c5b?w=400&h=400&fit=crop'),
(NULL,'GTX 1650','Graphics Card','GPU','Entry-level GPU perfect for budget gaming and light workloads',14000,'https://images.unsplash.com/photo-1591290621127-8b9aae415c5b?w=400&h=400&fit=crop');

/* ===== MOTHERBOARDS ===== */
INSERT INTO products VALUES
(NULL,'ASUS ROG STRIX B550','Motherboard','ATX','Premium AM4 motherboard with PCIe 4.0 and RGB support',9500,'https://images.unsplash.com/photo-1621905167918-48416bd8575a?w=400&h=400&fit=crop'),
(NULL,'Gigabyte H410','Motherboard','mATX','Reliable LGA1200 motherboard for Intel processors',6200,'https://images.unsplash.com/photo-1621905167918-48416bd8575a?w=400&h=400&fit=crop'),
(NULL,'MSI MPG Z690','Motherboard','ATX','Latest generation Intel Z690 chipset with DDR5 support',18500,'https://images.unsplash.com/photo-1621905167918-48416bd8575a?w=400&h=400&fit=crop');

/* ===== ACCESSORIES ===== */
INSERT INTO products VALUES
(NULL,'Corsair K95 Mechanical Keyboard','Accessories','Keyboard','Premium RGB mechanical keyboard with Cherry MX switches',8500,'https://images.unsplash.com/photo-1587829191301-4b10a2f0b8e8?w=400&h=400&fit=crop'),
(NULL,'Logitech G502 HERO Gaming Mouse','Accessories','Mouse','High-precision 25600 DPI gaming mouse with customizable weights',3500,'https://images.unsplash.com/photo-1527814050087-3793815479db?w=400&h=400&fit=crop'),
(NULL,'Premium HDMI 2.1 Cable','Accessories','Cables','High-speed 8K 60Hz HDMI 2.1 cable for 2 meters',899,'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=400&h=400&fit=crop'),
(NULL,'Corsair H100i Liquid Cooler','Accessories','Cooling','240mm RGB liquid CPU cooler with zero-RPM mode',5999,'https://images.unsplash.com/photo-1639815189175-a40fc8acab45?w=400&h=400&fit=crop'),
(NULL,'Noctua NF-A12x25','Accessories','Cooling','Premium 120mm case fan with exceptional noise performance',2200,'https://images.unsplash.com/photo-1639815189175-a40fc8acab45?w=400&h=400&fit=crop');

/* (Repeat same pattern to reach 50–100 items) */
