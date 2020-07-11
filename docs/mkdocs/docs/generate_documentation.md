# Generate the Documentation

## Requirements
- Git
- Mkdocs

## Configuration Setup
Open a shell and create a global folder for the project and its configurations.
This is a general advice for other projects as well.

    mkdir codeflow
    cd codeflow

Now clone the repository to be able to work with the actual on the master branch.
Most of the time, coding will be done in this folder.

    git clone https://github.com/lyrahgames/codeflow.git codeflow

!!! note "Automatic Documentation Generation"
    Of course, it would be possible to automatically generate the documentation with a CI environment.
    But we do not recommend it.
    For this, we would need another server which additionally would have to be configured.
    This may introduce unnecessary version controlling for the generated site and as a result unnecessary memory usage of the repository.
    For a simple documentation site, this may be too much overhead.
    If one would not want to use GitHub Pages, we could use ReadTheDocs to automatically generate every commit to the master branch.

We need another clone to be able to manually generate the site.

    git clone https://github.com/lyrahgames/codeflow.git codeflow-gh-pages

Make sure to set the correct branch on the output directory.

    cd codeflow-gh-pages
    git checkout gh-pages

## Work on the Documentation
Now change to the actual documentation directory.

    cd ../codeflow/docs/mkdocs

Change something and do work.
Use the `mkdocs serve` command to inspect changes.
If everything is alright, commit and push the changes.

    git add .
    git commit
    git push origin master

## Generate and Update the Site
Build the documentation into the output directory.

    mkdocs build -d ../../../codeflow-gh-pages

Commit the changes in the out directory by amending.
This makes sure the site will not be version-controlled and takes up no additional space.
The generated site is a build artifact.
We do not want it to be version controlled in contrast to the code.

    cd ../../../codeflow-gh-pages
    git add .
    git commit --amend -m "Update site"

Push the changes.
Because we have amended, we have to do a force push to the correct branch.

    git push -f origin gh-pages.
