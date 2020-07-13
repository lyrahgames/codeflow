# MkDocs and GitHub Pages Workflow

This article will not explain the syntax and semantics of MkDocs or how to actually write a documentation.
Instead, it aims at providing a workflow on how to start and integrate MkDocs in an ongoing project.
Hence, this explanation should be useful if you want to learn how to start with a documentation and/or if your `README.md` of your project is not sufficient.

Without loss of generality, we assume the name of the project to be `codeflow` and the name of the user to be `lyrahgames`.
Please interchange both of them with your own preference.

## Requirements

- Python
- pip
- MkDocs

## Preliminaries

Typically, the project files of your project `codeflow` will reside in their own directory, also known as the *project directory*, with the same name.
In the most cases, the project directory is version-controlled by Git and as a result, we may as well call the respective directory the *project repository*.
As an example, assume your project would be a C++ application.
The content of the project could then be something like the following.

    codeflow
    ├── .git/...
    ├── .gitignore
    │
    ├── build/
    │   ├── bootstrap.build
    │   └── root.build
    ├── buildfile
    ├── manifest
    │
    ├── codeflow/
    │   ├── application.cpp
    │   ├── application.hpp
    │   ├── buildfile
    │   └── main.cpp
    │
    ├── LICENSE
    └── README.md

Here, we have some files and folders concerning Git, the chosen build system, the source code itself, license files, and the up-to-this-point-sufficient documentation in the file `README.md`.

In a C++ project, we tend to use more than one configuration to build and test the source code of the project.
As an example, we would like to build the project with the GCC and the Clang compiler.
Due to their strong platform-dependence, these configurations should not be stored inside the project repository.
Hence, they are not version-controlled by Git.
To keep the overview over all those configurations, we use another parent directory again with the same name as the project.
We call this parent directory the *developer folder*.
In the following, the tree of the content for this example is shown.

    codeflow/                        # Developer Folder
    │
    ├── codeflow/                    # Project Folder
    │   ├── .git/...
    │   ├── .gitignore
    │   │
    │   ├── build/
    │   │   ├── bootstrap.build
    │   │   └── root.build
    │   ├── buildfile
    │   ├── manifest
    │   │
    │   ├── codeflow/
    │   │   ├── buildfile
    │   │   ├── application.hpp
    │   │   ├── application.cpp
    │   │   └── main.cpp
    │   │
    │   ├── LICENSE
    │   └── README.md
    │
    ├── codeflow-gcc/...             # Configuration Folder 'gcc'
    │
    └── codeflow-clang/...           # Configuration Folder 'clang'

## Initialization

In the next step, we will initialize the documentation with its configuration.
We assume that you are currently residing inside the developer folder of your project.

    $ pwd
    /home/lyrahgames/projects/codeflow

Go into the project folder and create a directory for the documentation.
Afterwards, initialize a new web documentation with MkDocs.

    cd codeflow
    mkdir docs
    cd docs
    mkdocs new web

!!! note
    Sometimes the documentation for a project does not only exist as website readable by browsers but also as LaTeX documents or other presentations.
    In this case, we want to be able to keep such files inside the docs directory without changing the web documentation.
    Therefore we use another subdirectory called `web`.
    If you do want to keep things very simple then run `mkdocs new docs` inside your project folder.
    But please be aware that this will pollute your project folder with configuration files concerning MkDocs and its themes.

We now have to make sure that Git is not ignoring those new files created by MkDocs.
If you have chosen the white-listing approach for your `.gitignore` files, we can add something like the following to a new `.gitignore` file inside the web documentation folder.

```
# File: docs/web/.gitignore

!*.md
!mkdocs.yml
!requirements.txt
```

Because MkDocs is based on Python, we additionally have created the file `requirements.txt` for the pip Package Manager to provide all requirements the documentation needs to be built.
At this moment, it should only contain `mkdocs`.

```
# File: docs/web/requirements.txt

mkdocs
```

The project folder structure should now look like the following.

    codeflow                            # Project Folder
    ├── .git/...
    ├── .gitignore
    │
    ├── build/
    │   ├── bootstrap.build
    │   └── root.build
    ├── buildfile
    ├── manifest
    │
    ├── docs/                           # Documentation Folder
    │   └── web/                        # Web Documentation Folder
    │       ├── .gitignore
    │       ├── docs/
    │       │   └── index.md
    │       ├── mkdocs.yml
    │       └── requirements.txt
    │  
    ├── codeflow/
    │   ├── application.cpp
    │   ├── application.hpp
    │   ├── buildfile
    │   └── main.cpp
    │
    ├── LICENSE
    └── README.md

Now, to get an impression of the website, MkDocs provides the `serve` command.
It will generate the documentation, update it every time a file in the directory has changed, and provide browser access to the generated site at address `127.0.0.1:8000`.
So go into the web documentation folder, run the following command, and look at the result in your browser.

    mkdocs serve

This finalizes the initialization process and as a good practice, a commit should be made.

## Configuration

At this point, you are able to start documenting your project by adding new files in the Markdown format inside the `docs` folder of your web documentation folder.
MkDocs will automatically detect those files and show them in the table of contents inside your browser.
But on the other hand, it may be a good idea to take some more time to configure the MkDocs build process to slightly tweak the generated documentation.

### Basics

The complete configuration of MkDocs can be done by adjusting the file `mkdocs.yml` inside the web documentation folder.
At first you should add the basic information about your project and its documentation.

```yaml
# File: docs/web/mkdocs.yml

site_name: Codeflow
site_url: https://lyrahgames.github.io/codeflow
site_author: Markus Pawellek
site_description: >-
  Tutorials, Explanations, Exercises, Solutions, 
  Workflows referring to Coding and Sciences

repo_name: lyrahgames/codeflow
repo_url: https://github.com/lyrahgames/codeflow

copyright: Copyright &copy; 2020 Markus Pawellek
```

### Theme

Afterwards, in my opinion one of the main decisions has to be made.
We have to choose a theme.
I recommend to choose the [Material for MkDocs theme](https://squidfunk.github.io/mkdocs-material/).
This theme comes with an extremely good documentation about its usage and configuration.
Furthermore, it gives you some hints about what extensions and plugins to additionally add to your MkDocs configuration to make the documentation process easier and faster.
Here, we do not go through details but provide an example configuration for the Material theme.

```yaml
# File: docs/web/mkdocs.yml
# ...

theme:
  name: material
  custom_dir: overrides
  language: en
  features:
    - tabs
  palette:
    scheme: default
    primary: white
    accent: indigo
    font:
      text: Roboto
      code: Roboto Mono
    icon:
      logo: material/library
      repo: fontawesome/brands/git-alt

extra:
  social:
    - icon: fontawesome/brands/github
      link: https://github.com/lyrahgames

markdown_extensions:
  - admonition
  - codehilite:
      guess_lang: false
      linenums: false
  - toc:
      permalink: true
  - meta
  - pymdownx.arithmatex
  - pymdownx.betterem:
      smart_enable: all
  - pymdownx.caret
  - pymdownx.critic
  - pymdownx.details
  - pymdownx.emoji:
      emoji_index: !!python/name:materialx.emoji.twemoji
      emoji_generator: !!python/name:materialx.emoji.to_svg
  - pymdownx.inlinehilite
  - pymdownx.magiclink
  - pymdownx.mark
  - pymdownx.smartsymbols
  - pymdownx.superfences
  - pymdownx.tasklist:
      custom_checkbox: true
  - pymdownx.tabbed
  - pymdownx.tilde

extra_javascript:
  - https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-MML-AM_CHTML

plugins:
  - search
  - minify:
      minify_html: true
  - git-revision-date-localized
  - awesome-pages

```

We make sure not to use something not provided by the system and add some new entries to the `requirements.txt` file.

```
# File: docs/web/requirements.txt

mkdocs
mkdocs-material
mkdocs-minify-plugin
mkdocs-git-revision-date-localized-plugin
mkdocs-awesome-pages-plugin
```

Before looking at the generated output, make sure to use pip with this `requirements.txt` to install the missing dependencies for ourselves by running the following command.

    pip install -r requirements.txt

### Customization of Material Theme: Justify Text

Nearly every theme for MkDocs will give possibilities to customize its design, formatting rules, and other stuff.
As an example for the Material theme, we will show how to set the alignment of content text blocks to the justify mode.
For this, we use the override mechanism provided by the Material theme.

First, create a new directory `overrides` in the web documentation folder.

    cd docs/web
    mkdir overrides
    cd overrides

Now, open the new file `main.html` inside the folder `overrides` and add the following content.

```html
{% extends "base.html" %}

{% block content %}
  <style type="text/css">
    .justify {
      text-align: justify;
      text-justify: inter-word;
    }
  </style>
  <section class="justify">
    {{ super() }}
  </section>
{% endblock %}
```

Your current project folder structure should look like the following.

    codeflow                            # Project Folder
    ├── .git/...
    ├── .gitignore
    │
    ├── build/
    │   ├── bootstrap.build
    │   └── root.build
    ├── buildfile
    ├── manifest
    │
    ├── docs/                           # Documentation Folder
    │   └── web/                        # Web Documentation Folder
    │       ├── .gitignore
    │       ├── docs/                   # Folder for the Actual Documentation Files
    │       │   └── index.md
    │       ├── overrides/              # Material Theme Customization Folder
    │       │   └── main.html           # Customization for all Documentation Files
    │       ├── mkdocs.yml
    │       └── requirements.txt
    │  
    ├── codeflow/
    │   ├── application.cpp
    │   ├── application.hpp
    │   ├── buildfile
    │   └── main.cpp
    │
    ├── LICENSE
    └── README.md

## Build and Deploy

After complete configuration and the writing of new documentation files, the generated site should be observed in the browser to test if all settings work as expected.
This can be done again by using the command `mkdocs serve`.
If everything seems to be alright, we have to build the documentation to actually get the files of the website.
We want to push those files to a documentation hosting platform, in our case GitHub Pages, to make the documentation available to other people.

### Initialization

First, we set up a new configuration folder inside the developer folder where all files of the generated documentation will be put.
Because we want to use GitHub Pages as a hosting platform, we have to make sure to use a Git repository which is pushing to the branch `gh-pages`.

Make sure that you are in the developer folder.

    $ pwd
    /home/lyrahgames/projects/codeflow

Initialize a new Git repository, set it to the according branch, and provide the GitHub repository address as a remote by using the following commands.

    git init codeflow-gh-pages
    cd codeflow-gh-pages
    git checkout -b gh-pages
    git remote add origin git@github.com:lyrahgames/codeflow.git

The structure of your developer folder should now look like this.

    codeflow/                        # Developer Folder
    │
    ├── codeflow/...                 # Project Folder
    │
    ├── codeflow-gcc/...             # Configuration Folder 'gcc'
    │
    ├── codeflow-clang/...           # Configuration Folder 'clang'
    │
    └── codeflow-gh-pages/           # Configuration Folder for GitHub Pages

The GitHub Pages environment on GitHub does not have to be turned on manually.
GitHub should automatically enable this feature if the `gh-pages` branch is available in the GitHub repository.
If this is not the case, enable the environment manually.

### Updating

Building the documentation has to be done every time you want to push the changes to the hosting platform.
To keep your GitHub repository consistent, you should first make a commit in the project folder and push it to the `master` branch of your GitHub repository.

    git add .
    git commit
    git push origin master

Afterwards, you are now able to actually build the documentation into the configuration folder for GitHub Pages.
Make sure to run the following command inside the web documentation folder.

    mkdocs build -d ../../../codeflow-gh-pages

Now, we go into the configuration folder for GitHub Pages and commit its changes by amending to the previous commit.
This makes sure the site will not be version-controlled by Git.
We do not want it to be version-controlled because the generated site is a build artifact.

    cd ../../../codeflow-gh-pages
    git add .
    git commit --amend -m "Update site"

Because we have amended to the previous commit, we have to do a force push to the `gh-pages` branch to update the documentation on the hosting platform.

    git push -f origin gh-pages.

!!! note "Automatic Documentation Generation"
    Of course, it would be possible to automatically generate the documentation with a CI environment.
    But we do not recommend it.
    For this, we would need another server which additionally would have to be configured.
    This may introduce unnecessary version controlling for the generated site and as a result unnecessary memory usage of the repository.
    For a simple documentation site, this may be too much overhead.
    If one would not want to use GitHub Pages, we could use ReadTheDocs to automatically generate every commit to the master branch.


### Making it Easier through Scripts

If you are frequently writing the documentation of your project on different platforms, it can become cumbersome to run all the commands for the initialization, building, and deploying every time.
To make it easier and faster, we can provide simple scripts that allow us to do these processes in one simple step.
Here, it is done for a Linux-based operating system.
We will create two shell scripts, `init.sh` for the initialization and `build_and_deploy.sh` for the building and deployment, inside the web documentation folder.
Your current project folder structure should then look like the following.

    codeflow                            # Project Folder
    ├── .git/...
    ├── .gitignore
    │
    ├── build/
    │   ├── bootstrap.build
    │   └── root.build
    ├── buildfile
    ├── manifest
    │
    ├── docs/                           # Documentation Folder
    │   └── web/                        # Web Documentation Folder
    │       ├── .gitignore
    │       ├── docs/                   # Folder for the Actual Documentation Files
    │       │   └── index.md
    │       ├── overrides/
    │       │   └── main.html
    │       ├── mkdocs.yml
    │       ├── requirements.txt
    │       ├── init.sh                 # Shell Script for Initialization
    │       └── build_and_deploy.sh     # Shell Script for Building and Deployment
    │  
    ├── codeflow/
    │   ├── application.cpp
    │   ├── application.hpp
    │   ├── buildfile
    │   └── main.cpp
    │
    ├── LICENSE
    └── README.md


Both scripts only contain the commands that were already described in the above sections.
Additionally, we have added a mechanism to determine the current folder and changing the current directory to the directory where the script itself lies.
This makes sure there will be no problems when the scripts are called from another directory.

```sh
# File: docs/web/init.sh

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
```

```sh
# File: docs/web/build_and_deploy.sh

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
```

Of course, we have to slightly change the `.gitignore` file to allow the shell scripts to be captured by Git.

```
# File: docs/web/.gitignore

!overrides/*.html
!mkdocs.yml
!requirements.txt
!*.sh
```

Afterwards, we set the executable flags to be able to run the scripts from the command line.

    chmod +x init.sh build_and_deploy.sh

For the future this means, after cloning the repository, one should execute the `init.sh` script to generate the GitHub Pages configuration folder.
After changing the documentation and committing the result, one should call the `build_and_deploy.sh` script to push the newly created site to documentation hosting platform.

!!! note
    Going one step further, we could even think about using Git hooks to automatically run the `build_and_deploy.sh` script for every commit on the `master` branch.

## References

- [MkDocs Documentation](https://www.mkdocs.org/)
- [Material for MkDocs Documentation](https://squidfunk.github.io/mkdocs-material/)