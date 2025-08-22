#!/bin/bash

# GitHub Repository Setup Script for mcp-integration-research
# This script helps create and initialize the research repository

echo "================================================"
echo "  MCP Integration Research - GitHub Setup"
echo "================================================"

# Configuration
REPO_NAME="mcp-integration-research"
GITHUB_USER="macnishio"  # Changed from organization to user
REPO_DESCRIPTION="Research repository for Dynamic Cloud Provider Integration in Multi-Cloud Platform Architectures"

echo ""
echo "📋 Repository Details:"
echo "   Name: $REPO_NAME"
echo "   User: $GITHUB_USER"
echo "   Description: $REPO_DESCRIPTION"
echo ""

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) is not installed."
    echo "   Please install it first: https://cli.github.com/"
    exit 1
fi

echo "✅ GitHub CLI is installed"

# Check authentication
echo "🔐 Checking GitHub authentication..."
if ! gh auth status &> /dev/null; then
    echo "❌ Not authenticated with GitHub."
    echo "   Please run: gh auth login"
    exit 1
fi

echo "✅ Authenticated with GitHub"

# Create the repository
echo ""
echo "🚀 Creating GitHub repository..."
gh repo create "$GITHUB_USER/$REPO_NAME" \
    --public \
    --description "$REPO_DESCRIPTION" \
    --clone=false \
    --confirm

if [ $? -ne 0 ]; then
    echo "❌ Failed to create repository. It may already exist."
    echo "   Continuing with existing repository..."
fi

# Initialize git if not already initialized
if [ ! -d .git ]; then
    echo "📦 Initializing git repository..."
    git init
    git branch -M main
else
    echo "✅ Git repository already initialized"
fi

# Add remote
echo "🔗 Adding remote origin..."
git remote remove origin 2>/dev/null
git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"

# Add all files
echo "📁 Adding files to git..."
git add .

# Create initial commit
echo "💾 Creating initial commit..."
git commit -m "Initial commit: MCP Integration Research

- Academic research repository setup
- Provider template generation system
- Configuration-driven architecture
- Research papers in EN/JA/ZH
- Benchmark and test frameworks
- Sample implementations for Google Workspace

Based on: Dynamic Cloud Provider Integration in Multi-Cloud Platform Architectures
Digital Autograph Research Team, 2025"

# Push to GitHub
echo "⬆️  Pushing to GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Success! Repository created and pushed to GitHub"
    echo ""
    echo "🌐 Repository URL: https://github.com/$GITHUB_USER/$REPO_NAME"
    echo ""
    echo "📊 Repository Contents:"
    echo "   - Research papers (3 languages)"
    echo "   - Provider template generator"
    echo "   - Configuration examples"
    echo "   - Benchmark frameworks"
    echo "   - Implementation samples"
    echo ""
    echo "🎯 Next Steps:"
    echo "   1. Visit the repository: https://github.com/$GITHUB_USER/$REPO_NAME"
    echo "   2. Add topics: multi-cloud, api-integration, research, oauth"
    echo "   3. Enable GitHub Pages if needed"
    echo "   4. Set up GitHub Actions for CI/CD"
    echo ""
    echo "📚 Citation:"
    echo "   @article{digitalautograph2025dynamic,"
    echo "     title={Dynamic Cloud Provider Integration},"
    echo "     author={Digital Autograph Research Team},"
    echo "     year={2025},"
    echo "     url={https://github.com/$GITHUB_USER/$REPO_NAME}"
    echo "   }"
else
    echo ""
    echo "❌ Failed to push to GitHub"
    echo "   Please check your permissions and try again"
    echo "   You may need to use: gh auth refresh"
fi

echo ""
echo "================================================"
echo "  Setup Complete"
echo "================================================"