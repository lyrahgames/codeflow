---
title: "C++ Project Structures"
author: lyrahgames
---

For a C++ developer when starting a project one of the major concerns is about the project structure. In general, the file hierarchy of a project should fulfill the following properties.
- easy to maintain
- easy to work with
- self-explanatory
- scalable
- self-consistent
- extensible by subprojects, documentation, scripts, external dependencies, examples, etc.
- usable for different kinds of projects (eg. header-only libraries and projects for multiple applications and libraries)
- compatible with C++ modules

However, there are already some common folder structures for a C++ project. A typical one can be found [here](https://cliutils.gitlab.io/modern-cmake/chapters/basics/structure.html). Looking at other projects on GitHub, like [doctest](https://github.com/onqtam/doctest) and [Eigen](https://github.com/eigenteam/eigen-git-mirror), we can find a more modern approach. 
 
Personally, I would like to suggest the [*Canonical Project Structure*](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p1204r0.html) developed by Boris Kolpackov which was already submitted to the C++ standard. Currently, it seems to fulfill every single requirement. Especially the application of such a structure to the process of developing a project from scratch does not introduce a major overhead in your workflow. It can be even used for a library realized by more than one project. It scales better to large code bases than prior project structures and is not as error-prone. The intrinsic support for executing integration tests independently of the build process after the installation is unique. Last but not least, putting headers, sources and unit tests inside the same directory structure prevents doubling of subtrees in the file hierarchy and makes the process of maintaining easier.

The *Canonical Project Structure* is a really modern approach to handle the file hierarchy of a project without the typical drawbacks of other schemes. I would suggest to use it.