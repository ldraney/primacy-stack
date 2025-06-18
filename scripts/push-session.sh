#!/bin/bash

# ==============================================================================
# Script Name: push-session.sh
# Purpose: Quickly commit and push changes to the current session's Git branch
# Author: Lucas Draney
# Date: 2025-06-18
# ==============================================================================

set -e

# Get current Git branch
BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "📦 Staging all changes..."
git add .

echo "📝 Committing changes..."
git commit -m "Update session: $BRANCH"

echo "🚀 Pushing to remote branch: $BRANCH"
git push origin "$BRANCH"

echo "✅ All done. Branch pushed: $BRANCH"

