#!/bin/bash

# ==============================================================================
# Script Name: open-branch.sh
# Purpose: Open the current Git branch in the browser on GitHub
# Author: Lucas Draney
# Date: 2025-06-18
# ==============================================================================

set -e

# Set your GitHub repo slug here
REPO_SLUG="ldraney/primacy-stack"

# Get current branch name
BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Construct URL
URL="https://github.com/$REPO_SLUG/tree/$BRANCH"

# Open in default browser (macOS/Linux compatible)
echo "🌐 Opening: $URL"
open "$URL" 2>/dev/null || xdg-open "$URL"

