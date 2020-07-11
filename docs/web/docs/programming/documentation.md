---
title: Creating a Documentation for your Project
---

Developing a software project which is used by others is a rewarding task.
By communicating with users, you are able to improve the code and the overall design of the project.
The users on the other side are happy to see their comments implemented and will use the tool more intensive.
But even if the user base consists only of a few people, it becomes tedious to explain the basic usage of your program or library every time your API has changed.
Additionally, not every user wants to communicate with you directly.
Hence, documenting your software is mandatory if you want people to use it.
But on the other hand, creating documentation seems not to be rewarding.
And therefore, one likes to ignore this part of writing code.

I am not a technical writer.
So I will not talk about how to actually write documentation for your software, such that it is understandable by everyone.
Instead, I would like to give you an idea about how to start with the basics and how to create a system which looks professional and is easy to handle.
The first impression counts.
And so, even yourself may be tempted to write more and better documentation.

## Basic Techniques
There are a lot of possibilities out there for documenting software.
I am not able to cover all of them.
But I will try to explain some basic approaches and to provide a few more elaborate techniques for handling your documentation.

### Comments

!!! abstract "Recommendation"
    Use comments only to give other developers hints about design decisions in your implementation or interface.

Writing comments inside your code is a great and easy way to provide some sort of documentation where the programming language itself is not able to make the intention clear.
But most of the times it is an overused feature.
Blocks of comments reduce the readability of your code tremendously.
[Doxygen](http://www.doxygen.nl/), for example, is a documentation tool which builds upon comments inside your code.
Its usage is deprecated, in my opinion.
Instead, use comments in your code to explain details about special implementation or interface parts.
As a result, comments make it possible to give other developers hints about design decisions in your implementation or interface, but they are not suitable for documenting the usage of your software.

### `README` File

!!! abstract "Recommendation"
    Always keep a `README` file in the root of your project up-to-date.

In general, you will use a code hosting platform, like GitHub or Bitbucket, to publish your git repository.
These platforms will recognize and automatically surface a `README` file in the root of your project to repository visitors.
A `README` file is often the first item a visitor will see.
Additionally, you do not have to use a specific extension or format.
You can create a `README` file as `README.txt` for a simple text-based approach, as `README.md` to write your text in Markdown, as `README.rst` to use the reST format or as other formats that are supported by your code hosting platform.
Hence, it is a perfect starting point for the documentation of every project.
It is fast and easy to create and gives some advanced utilities based on the format you are using.
Nearly every developer would first try to find such a `README` file to learn something about your code.

## Advanced Techniques

!!! abstract "Recommendation"
    If your documentation does not fit into a `README.md` file anymore then use MkDocs and GitHub Pages as a hosting platform.
    If the manual building of the documentation becomes too cumbersome, try to use ReadTheDocs.

There will be a point in time when writing information into a `README` file will not suffice as documentation.
Therefore, tools were developed to make things easier for developers and technical writers.
If you need more than one file to structure your documentation, you will generally use a folder `docs` inside your repository where you will put all of your documentation files.
This will reduce merge conflicts and therefore make it easier for a developer to add new documentation parts or change already existing ones.
But for a user of the library or application, the new layer of indirection introduces overhead.
As a developer, you should make it appealing to read the documentation.
This is why we need tools which make it possible to display the documentation in a stylish way.

There are two types of tools we need.
First, we use a documentation builder that takes the documentation sources and generates the HTML webpage.
Afterwards, we will push to a hosting platform which then provides worldwide access to the generated HTML webpage.
Unfortunately, both of them have to be compatible with each other.

**Documentation Builder:**

- [Sphinx](http://www.sphinx-doc.org/en/master/):
    It is an easy-to-use build system written in Python which is not only able to generate HTML webpages but also LaTeX PDF documents and other formats.
    Documentation sources can be written in reST and Markdown.

- [MkDocs](https://www.mkdocs.org/):
    This is a fast and simple static site generator written in Python mainly used for building project documentation.
    Documentation source files are written in Markdown, and configured with a single YAML configuration file.

- [Jekyll](https://jekyllrb.com/):
    This is a simple, extendable, static site generator written in Ruby.
    You give it text written in your favorite markup language and it churns through layouts to create a static website.
    Throughout that process you can tweak how you want the site URLs to look, what data gets displayed in the layout, and more.

**Documentation Hosting Platform:**

 - [ReadTheDocs](https://readthedocs.org/):
    They call themselves a continuous documentation platform.
    For every commit, the documentation will be built and hosted.
    It is even possible to deploy different versions.
    Because of that, it is only possible to use Sphinx or MkDocs with it.
- [GitHub Pages](https://pages.github.com/):
    This is a general hosting platform for static websites powered by GitHub and is therefore perfect to be integrated with your GitHub repositories.
    Nearly every static documentation builder should be compatible with it.
    But it is mainly used for Jekyll webpages.

As an example, take a look at the build process of [this](../developer/generate_the_documentation.md) documenation.

<!-- All of these tools will give you a good-looking and manageable documentation system.
But I would like to recommend two specific workflows and to show some examples of how to implement these. -->

<!-- Sphinx Documentation hosted by ReadTheDocs
:   This is by far the simplest method to start with more advanced documentation.
You will initialize Sphinx inside your documentation folder.
Afterward, you will directly be able to add documentation files written in Markdown and reST.
At last, you have to register your project on the website of ReadTheDocs and it will be automatically built and hosted. -->

<!-- Jekyll Documentation hosted by GitHub Pages
:   If you need stylish and highly-customized documentation with some extra facilities, like a blog, then Jekyll is your tool of choice.
It will take some time, but it will be worth it. -->

## Other Techniques
- GitHub Wiki
- GitBooks
