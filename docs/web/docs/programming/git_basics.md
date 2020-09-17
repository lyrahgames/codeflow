# Git Basics

## Initialization

After installing `git` make sure to set the user name and mail address.

```bash
git config --global user.name "$USER"
git config --global user.email "$EMAIL"
```

Additionally, you should set the command-line editor as the commit message editor when using git from command-line.
Graphicals tools will mostly have their own ways of communicating with Git.

```bash
git config --global core.editor "$EDITOR"
```

Since version 2.27, we should also configure the pull strategy.

    git config --global pull.rebase false


## .gitignore Whitelisting and Blacklisting Workflow

The `.gitignore` file gives us the possibility to lighten up the process of adding modified or untracked files to the staging area.
Instead of committing every file manually, we can do so by `git add .`.
A proper `.gitignore` file will make sure only the necessary and important files are added to version control system.
Because of this and due to different ignoring strategies, the `.gitignore` file can become a little bit more complicated.
As a consequence, we need a way to test if the ignoring is working correctly.
Git already provides a built-in tool for things like this.
It is called `git ls-files`.

## Git Hooks

    git config --global core.hooksPath .githooks
    git config --local core.hooksPath .githooks


## References

- [Pro Git](https://git-scm.com/book/en/v2): Main source for learning about Git available in multiple languages