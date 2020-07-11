# Development Environment


## Windows and MacOS
For consistent learning, every code snippet will refer to a clearly defined Linux distribution.
We have chosen Manjaro.

In our experience, Windows operating systems tend to introduce a major overhead to the learning process.
Hence, we will provide instructions for using a Linux distribution inside a virtual machine.
But please note that it is possible to do everything in Windows as well.

- [Download](https://www.virtualbox.org/wiki/Downloads) and install VirtualBox for Windows hosts
- [Download](https://manjaro.org/download/) an ISO for Manjaro Gnome (or another Linux distribution of your choice)
- Initialize new virtual machine for a 64bit Arch-Linux
- Run the ISO of Manjaro in the new virtual machine and install it
- Shutdown the virtual machine and remove the ISO
- Restart the virtual machine

You should now have a working Linux system.
From this point on, we will only work inside this virtual machine to develop and run the code.


## Installing the Basic Tools

Typical system package managers in Linux distributions allow us to easily install needed software.

Make sure your Linux distribution is up-to-date.

    sudo pacman -Syu --noconfirm

The distributions comes with a default terminal.
If you want to use a different terminal, like `fish`, install and configure it.

    sudo pacman -S fish
    chsh -s /usr/bin/fish <username>

Download the most common C++ compilers, like GCC, Clang and Intel.

    sudo pacman -S gcc clang

Download the most common build systems for other libraries.

    sudo pacman -S make cmake

[Download and install](https://build2.org/install.xhtml) `build2`

Make sure the version control system `git` is installed and configured.

    sudo pacman -S git
    git config --global user.name <username>
    git config --global user.email <email>

Choose an editor for your future projects and install it.
Here, we will use `Sublime Text`.
Instructions can be found [here](https://www.sublimetext.com/docs/3/linux_repositories.html).
Make sure to choose the `pacman`-branch and the stable version.

Afterwards, configure your editor on your own preferences.
For `Sublime Text`, we provide [this](https://github.com/lyrahgames/sublime-text-3-config) default.