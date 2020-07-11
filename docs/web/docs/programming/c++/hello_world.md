---
title: Hello, World!
---

## The Basics

>C++ is a compiled language.
>For a program to run, its source text has to be processed by a compiler, producing object files, which are combined by a linker yielding an executable program.

Especially for C and C++ there exists a so called preprocessor, which replaces strings in a source based on defined macros.

>A C++ program typically consists of many source code files (usually simply called source files).

[![Scheme of Compiler Process](../../assets/images/compiler_process.png)](../../assets/images/compiler_process.pdf)

Click on the image to get the PDF.

>An executable program is created for a specific hardware/system combination; it is not portable, say, from a Mac to a Windows PC.
>When we talk about portability of C++ programs, we usually mean portability of source code; that is, the source code can be successfully compiled and run on a variety of systems.

>The ISO C++ standard defines two kinds of entities:
>- *Core Language Features*, such as built-in types and loops
>- *Standard-library Components*, such as containers and I/O operations

>C++ is a statically typed language.
>That is, the type of every entity (e.g., object, value, name, and expression) must be known to the compiler at its point of use.
>The type of an object determines the set of operations applicable to it.

## The Minimal C++ Program

The minimal C++ program, which does nothing, but is valid, is given by the following source code.
Please note, that C++ is a key-sensitive language and therefore makes a difference between capital and non-capital letters.
    
**minimal.cpp:**
```cpp
int main() {}
```

This code defines the so-called `main` function of the program.
`main` is one of the keywords of the C++ programming language and cannot be used in another place.
The `main` function defines the unique entry point for a program.
A computer then runs the executable code starting at this entry point.

The open and closed round Brackets `()` mean that the main function does not take any input arguments.
Later, we will see that there is another possibility.

The curly braces `{}` express grouping in C++ and indicate the start and end of the function body.
The function body defines the implementation of a function and therefore contains the code that the function should execute.
In the case of the `main` function the program starts by executing the first command enclosed by curly braces.

In front of the function the respective return type is defined.
In the case of the `main` function it has to be the type `int`.
`int` is an abbreviation for integer and describes some sort of integral number.
`int` is again a keyword of the language and can only be used in the context of a type.

The value returned by `main` is the program's return value to the system.
In most cases a non-zero value indicates failure (and a zero value success).
If there is no return value this means the program has succeeded.
We do not have to explicitly state the program succession but we could do with the following code snippet.

```cpp
int main() {
    return 0;
}
```

Here `return` is another keyword of the C++ programming language which defines the output value of a function AND exits from this function.
Therefore if the `return` directive is executed then every following command will be ignored.

## Producing Output on the Terminal

Typical programs should do something!
Therefore we start with one of the most basic steps of printing 'Hello, World!' on the terminal.
The following code snippet demonstrates this example.

**hello.cpp:**
```cpp
#include <iostream>
int main() {
    std::cout << "Hello, World!\n";
}
```

The command `#include <iostream>` instructs the C++ preprocessor to include all declarations (not the implementations) of the I/O routines of the C++ standard library found in the file 'iostream'.
Only with these declarations the command `std::cout << "Hello, World!\n";` makes sense.

`cout` is the standard object for printing information on the console.
To use the formatted output, we write the streaming operator `<<` before the argument `"Hello, World!\n"`.
The argument `"Hello, World!\n"` is a string literal which means that it is a sequence of characters surrounded by double quotes.
In C++ the backslash `\` in a string literal is an escape character to make it possible to write special characters, like the newline character `\n` or the tab character `\t`.
At the end of every command there has to be a semicolon `;`.

`std` is a so-called namespace which shall be explained in more detail later.
You only have to remember that every standard facility is put in the namespace `std` (an abbreviation for 'standard').
To use any function or class in this namespace we have three main possibilities.
- preceding the command by `std::` to make the namespace explicit like it was already shown
- defining a `using namespace std;` directive somewhere in the file to make anything available
- defining a `using std::cout;` directive to make only `cout` available

Both examples will be shown for convenience.
```cpp
#include <iostream>
using namespace std;
int main() {
    cout << "Hello, World!\n";
}
```

```cpp
#include <iostream>
int main() {
    using std::cout;
    cout << "Hello, World!\n";
}
```

## Writing Comments

Using comments, which are ignored by the compiler, in the source code is usually a good way of explaining the way of working of your code to other people and your future self.
C++ gives two kinds of comment-styles.
The first style is started by using `//`.
This indicates that until the end of the line there is a comment which should be ignored by the compiler.

```cpp
int main() {
    // we put a one-line comment here
}
```

The other style starts with `/*` and ends with `*/`.
So this style is not ended by any newline- or other special character.

```cpp
int main() {
    /*  
        Here we can
        write our comment
        in more than one line!
    */
    std::cout /*We can even create a comment inside a statement!*/ << "Hello, World\n";
}
```

## Building the Examples
In this folder the minimal C++ program and the program which prints 'Hello, World!' on the terminal, are already given as `.cc` files.
This file extension is one of the many standard extensions like `.cpp`, `.cxx` and `.c++`.
You are free to chose one that suits your taste and needs.

For compiling these code examples open a terminal inside this directory and run the following command to build the example code.
The GCC compiler for C++ is called by the command `g++`.
With the option `-o <target name>` your are able to name the resulting application.
The last argument gives GCC the source file to be compiled.
    
    g++ -o minimal minimal.cc
    g++ -o hello hello.cc

If there are no errors you should be able to see two executable files 'minimal' and 'hello' inside this directory.

## Execution
The resulting applications can be called by using the following commands.

    ./minimal
    ./hello

The program `minimal` is the minimal C++ program.
Therefore there shoud be no output.
But there should be no error message, either.

## Example Usage
If you build and run the source code the output should look like this:

    $   g++ -o hello hello_main.cc
    $   ./hello
    Hello, World!