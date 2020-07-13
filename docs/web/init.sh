#!/bin/sh

# Make sure to run the run the commands in the web documentation folder.
doc_dir=`dirname "$0"`
cd $doc_dir

# Install all requirements to be able to build the documentation.
pip install -r requirements.txt

# Create a configuration folder for the gh-pages branch next to the
# project folder and hopefully inside the developer folder.
# After building the documentation, we typically do a force push to
# the remote repository. Hence, it is enough to create a new repository
# and not to clone the remote repository.
# We can even run these commands if there is no gh-pages branch available.
cd ../../..
git init codeflow-gh-pages
cd codeflow-gh-pages
git checkout -b gh-pages
git remote add origin git@github.com:lyrahgames/codeflow.git
touch index.html
git add .
git commit -m "Initial commit"

# Alternative initialization process using cloning.
# cd ../../..
# git clone git@github.com:lyrahgames/codeflow.git --branch gh-pages --single-branch codeflow-gh-pages
# cd codeflow-gh-pages
# git checkout gh-pages