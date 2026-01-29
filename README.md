# DiskKart - E-Commerce Platform

A vulnerable e-commerce platform built for security lab training. Features products, shopping cart, checkout with Razorpay payment integration, and admin dashboard.

## Features

✨ **Core Features:**
- Product browsing with carousel
- Shopping cart (add/remove items)
- User authentication (login/register)
- Checkout with shipping details
- Razorpay payment integration
- Admin dashboard for order tracking
- Product management (add/delete)
- Category filtering & search

🔒 **Intentional Vulnerabilities (for lab training):**
- SQL Injection (in login, search, product queries)
- No input validation
- User-controlled payment amounts
- No CSRF protection
- Plain-text password storage

## Tech Stack

- **Backend**: Node.js + Express.js
- **Database**: SQLite3
- **Frontend**: EJS templates + Bootstrap 5
- **Payment**: Razorpay API
- **Session**: express-session

## Installation & Local Setup

### Prerequisites
- Node.js (v14+)
- npm

### Steps

```bash
# 1. Clone or extract the project
cd diskkart

# 2. Install dependencies
npm install

# 3. Create .env file
cp .env.example .env  # or create manually with variables below

# 4. Initialize database
sqlite3 db/diskkart.db < db/diskkart.sql

# 5. Start the server
npm start
```

### Environment Variables (.env)
```
PORT=3000
NODE_ENV=development
RAZORPAY_KEY_ID=your_key_id
RAZORPAY_KEY_SECRET=your_key_secret
```

### Access the App
- **Homepage**: http://localhost:3000
- **Login**: http://localhost:3000/login
- **Admin**: http://localhost:3000/admin

### Test Credentials
```
Admin:   admin / admin123
User:    user / user123
Other:   john.doe/password123, sarah.smith/secure456, mike.wilson/tech789
```

## Deployment

### Deploy to Railway (Recommended - Free Tier)

Railway.app is the easiest option for free deployment with persistent SQLite database.

**Quick Setup:**
1. Push code to GitHub
2. Go to https://railway.app
3. Click "New Project" → "Deploy from GitHub"
4. Select your `diskkart` repository
5. Add environment variables (Razorpay keys)
6. Railway auto-deploys! 🚀

See [RAILWAY_DEPLOYMENT.md](RAILWAY_DEPLOYMENT.md) for detailed instructions.

### Other Options
- **Render.com** - Free tier with Node.js support
- **Vercel** - Requires database migration (MongoDB/PostgreSQL)
- **Heroku** - (paid, was free before)

## Project Structure

```
diskkart/
├── app.js                 # Main Express server
├── package.json          # Dependencies
├── .env                  # Environment variables
├── .gitignore           # Git ignore rules
├── Procfile             # Deployment config
├── railway.json         # Railway config
│
├── db/
│   ├── diskkart.db      # SQLite database (auto-created)
│   └── diskkart.sql     # Database schema & sample data
│
├── routes/
│   ├── auth.js          # Login/Register/Logout
│   ├── products.js      # Product listing & cart
│   ├── payment.js       # Checkout & Razorpay
│   └── admin.js         # Admin dashboard & product mgmt
│
├── views/
│   ├── home.ejs         # Product listing with carousel
│   ├── login.ejs        # Login form
│   ├── register.ejs     # Registration form
│   ├── product.ejs      # Product detail page
│   ├── cart.ejs         # Shopping cart
│   ├── checkout.ejs     # Checkout & payment form
│   └── admin/
│       ├── dashboard.ejs # Order statistics & viewing
│       └── products.ejs  # Product management
│
└── public/
    ├── css/
    │   └── style.css    # Custom styles
    ├── js/              # Frontend scripts
    └── uploads/         # File uploads
```

## Key Routes

### Public Routes
- `GET /` - Homepage with products
- `GET /login` - Login page
- `POST /login` - Process login
- `GET /register` - Registration page
- `POST /register` - Create account
- `GET /product/:id` - Product details
- `GET /category/:c` - Filter by category
- `GET /search` - Search products
- `POST /add-to-cart` - Add item to cart
- `POST /remove-from-cart` - Remove from cart
- `GET /cart` - View cart
- `GET /logout` - Logout

### Protected Routes (Login Required)
- `GET /checkout` - Checkout page
- `POST /pay` - Create payment order
- `POST /payment-verify` - Verify payment

### Admin Routes (Admin Only)
- `GET /admin` - Dashboard with orders
- `GET /admin/products` - Product management
- `POST /admin/add` - Add new product
- `POST /admin/delete-product` - Delete product

## Database Schema

### Users Table
```
id (INTEGER PRIMARY KEY)
username (TEXT)
password (TEXT)
role (TEXT) - 'admin' or 'user'
```

### Products Table
```
id (INTEGER PRIMARY KEY)
name (TEXT)
category (TEXT)
subcategory (TEXT)
description (TEXT)
price (INTEGER)
image (TEXT)
```

### Orders Table
```
id (INTEGER PRIMARY KEY)
user_id (INTEGER FK)
username (TEXT)
items (TEXT - JSON)
total_amount (INTEGER)
fullname (TEXT)
email (TEXT)
phone (TEXT)
address (TEXT)
city (TEXT)
state (TEXT)
postalcode (TEXT)
payment_status (TEXT) - 'pending' or 'completed'
created_at (DATETIME)
```

## Security Notes

⚠️ **This is a deliberately vulnerable application for educational purposes.**

DO NOT use in production without extensive hardening:
- Implement input validation & parameterized queries
- Use password hashing (bcrypt)
- Add CSRF protection
- Validate user input on server-side
- Use HTTPS only
- Implement proper error handling
- Add rate limiting
- Validate payment amounts server-side

## License

Educational use only - for security training and lab purposes.

## Support

For deployment questions, see [RAILWAY_DEPLOYMENT.md](RAILWAY_DEPLOYMENT.md)
