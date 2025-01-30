# Ableton Git Template

This repository provides a Git template for collaborating on Ableton Live projects. It automatically handles the extraction and compression of .adg, .als, and .adv files, making them diff-friendly while removing sensitive path information.

## Setup

1. Clone this repository or use it as a template:
   ```bash
   git clone https://github.com/yourusername/ableton-git-template.git my-project
   # OR use GitHub's "Use this template" button
   ```

2. Run the setup script:
   ```bash
   ./setup.sh
   ```

This will:
- Set up the necessary Git hooks
- Configure Git filters for Ableton file types
- Create the required .gitattributes file

## How it works

- When you stage Ableton files (.adg, .als, .adv), they are automatically decompressed to XML
- Path elements are automatically removed to protect privacy
- When you check out files, they are automatically recompressed
- You can see clean diffs of your Ableton files in Git

## Requirements

- bash
- gzip
