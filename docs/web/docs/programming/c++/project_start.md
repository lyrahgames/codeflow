---
title: Starting a simple project in C++
---

# Starting with a Really Simple C++ Project

1. Create a folder `<project>` with the name of your project and initialize `git`
```
git init <project>
```
2. Start with `.gitignore`-whitelisting
```
*
!*.cc
!*.h
!CMakeLists.txt
!README.md
!.gitignore
```
3. Create a file `README.md` and write down most important informations about your project.
4. For directly testing the source code create the file `doctest_main.cc`
```c++
#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include <doctest/doctest.h>
```
5. Create a C++ source file with the name `<code>.cc` to write the actual code
```c++
#include <doctest/doctest.h>

// STL includes
#include <iostream>

// custom includes

// namespace directives and declarations
using namespace std;

// actual code

// test cases to test the actual code
TEST_CASE(""){
    // your checks and requirements
}
```
6. Create the file `CMakeLists.txt` for building the code
```cmake
cmake_minimum_required(3.10)
project(<project> VERSION 0.1.0 LANGUAGES CXX)
enable_testing()

find_package(doctest REQUIRED)

add_executable(main_test
    doctest_main.cc
    <code>.cc
)

target_link_libraries(main_test
    PRIVATE
        doctest::doctest
)

add_test(main_test main_test)
```
7. Create a GitHub repository for your project, make the initial commit and push it to the master branch
```
git add .
git commit -m "Initial commit"
git remote add origin git@github.com:<user>/<project>.git
git push origin master
```
8. Initialize the build process
```
mkdir build 
cd build
cmake ..
```
9. Use test-driven development cycle to write, test and commit new code

    1. Write test
    2. Make sure building or testing fails
    3. Write least simple code for a successful building and testing
    4. Make sure building and testing is successful.
    5. Commit the changes.
    6. Refactor the code for better design.
    7. Make sure building and testing is successful.
    8. Commit the changes.

    Building and Testing:
    ```
    cmake --build .
    ctest --verbose
    ```