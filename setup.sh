#!/usr/bin/env bash
set -e

# Ensure we're in the repository root
if [ ! -d .git ]; then
    echo "Must be run from repository root"
    exit 1
fi

# Create hooks directory if it doesn't exist
mkdir -p .git/hooks

# Copy hooks from template
cp .git-template/hooks/* .git/hooks/

# Make hooks executable
chmod +x .git/hooks/ableton-clean
chmod +x .git/hooks/ableton-smudge

# Create .gitattributes if it doesn't exist
if [ ! -f .gitattributes ]; then
    echo "*.adg filter=ableton
*.als filter=ableton
*.adv filter=ableton" > .gitattributes
fi

# Configure git
git config --local filter.ableton.clean "$(pwd)/.git/hooks/ableton-clean"
git config --local filter.ableton.smudge ".$(pwd)/.git/hooks/ableton-smudge"
git config --local filter.ableton.required true

echo "Template setup complete!"
