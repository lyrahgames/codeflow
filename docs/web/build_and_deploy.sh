#!/bin/sh

# Make sure to run the run the commands in the web documentation folder.
doc_dir=`dirname "$0"`
cd $doc_dir

# Build the documentation into the GitHub Pages configuration folder.
mkdocs build -d ../../../codeflow-gh-pages

# Deploy the documentation by amending the changes to disable version control
# and by force pushing to the remote repository.
cd ../../../codeflow-gh-pages
git add .
git commit --amend -m "Update site"
git push -f origin gh-pages