#!/bin/bash

# DiskKart - Quick GitHub Push Script

echo "🚀 DiskKart Railway Deployment Setup"
echo "======================================"
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "📦 Initializing Git repository..."
    git init
    echo "✅ Git initialized"
else
    echo "✅ Git already initialized"
fi

echo ""
echo "📝 Staging files..."
git add .
echo "✅ Files staged"

echo ""
echo "💾 Creating initial commit..."
git commit -m "Initial commit: DiskKart e-commerce platform ready for Railway deployment" -q 2>/dev/null || echo "✅ Changes committed (or already committed)"

echo ""
echo "======================================"
echo "📋 Next Steps:"
echo "======================================"
echo ""
echo "1. Create a GitHub repository:"
echo "   - Go to https://github.com/new"
echo "   - Create repository named 'diskkart'"
echo "   - Copy the repository URL"
echo ""
echo "2. Run these commands:"
echo "   git remote add origin <your-repo-url>"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. Deploy to Railway:"
echo "   - Go to https://railway.app"
echo "   - Click 'New Project'"
echo "   - Select 'Deploy from GitHub repo'"
echo "   - Search and select 'diskkart'"
echo "   - Railway will auto-deploy!"
echo ""
echo "4. Add Environment Variables in Railway:"
echo "   - RAZORPAY_KEY_ID=your_key_id"
echo "   - RAZORPAY_KEY_SECRET=your_key_secret"
echo ""
echo "5. View your live app at the Railway URL!"
echo ""
echo "For detailed guide, see: RAILWAY_DEPLOYMENT.md"
