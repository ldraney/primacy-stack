#!/bin/bash

# ==============================================================================
# Script Name: push-session.sh
# Purpose: Prompt for commit message, then push changes to the current Git branch
# Author: Lucas Draney
# Date: 2025-06-18
# ==============================================================================

set -e

# Get current Git branch
BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Ask for commit message
read -rp "Enter commit message: " COMMIT_MSG

echo "📦 Staging all changes..."
git add .

echo "📝 Committing with message: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

echo "🚀 Pushing to remote branch: $BRANCH"
git push origin "$BRANCH"

echo "✅ All done. Branch pushed: $BRANCH"

