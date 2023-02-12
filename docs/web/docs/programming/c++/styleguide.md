---
title: Style Guide
---

## Personal Experience
- For me, one of the biggest problems in programming is how to decide the name and spelling of an entity.
- If a language provides a feature and the typical best practice is to not use it, think about when to use it, because most features have a reason.
- In my opinion, lots of best practices, do's, and don'ts are not considering the development cycle of code. Typically, I start as simple as possible to not distract myself. After some time, I apply refactoring steps. But still then I will not be able to easily adhere to all the rules because I am currently developing the code. For example, the naming of private variables with a prepending underscore makes sense when I am using getters and setters but is completely slowing down the development process for other variables when you started with a simple struct and all public members.
Hence, these rules are more complex on purpose.
- Our naming schemes are based on abstraction principles and intuition. In corner cases, often the language specification does not "allow" to be "intuitive" because there is sometimes no valid idea of intuition in such cases. In C++, naming every type with a capital letter will give you a consistent interface for typical class-based libraries and applications. Taking template metaprogramming into account, things get much more fickle.
Suddenly, types can be interpreted as functions on types, so called meta-functions, and it is not intuitive to name them with a capital letter anymore. The result of thinking this through is that there always has to be something that breaks consistency. The question is then to find when it is best to break consistency and how to do it to make it still as simple as possible. One possible way would to separate a library, if it would be required, into modular parts that have their own style guide. So there would only be a breaking consistency between those modular parts but not in a single one.
- The biggest problem with non-capital naming is the non-existent compiler support for implicitly naming entities and then be able to explicitly specify the entity.


## Pros and Cons of Abstraction
- Abstraction should be no black box. Sometimes there is no other possibility. But this should not be the case very often.
- Abstraction is powerful and one of the major design principles of software and hardware. Without abstraction we would not be able to solve complex problems. Abstraction makes development fast.
- Typically, further knowledge of the underlying problem and topic are required to use and apply abstraction in a useful way.
- Often abstraction principles are misused and introduce many layers of indirections that could otherwise with understanding of the underlying problem be omitted.
- Having knowledge of all abstraction layers allows one to switch between them to achieve the best trade-offs in the current context (expressiveness vs robustness vs complexity)
- Abstraction is used nearly everywhere. Not only in computer science but for example in mathematics and physics. Abstraction allows humans to do 'bootstrapping' which can be thought of as the process of applying and implementing abstraction principles.

## Automatic Vectorization vs. Manual Vectorization
- With automatic vectorization, we cannot be sure that the performance of code under the application of different compilers is portable.
- Small irrelevant changes in code often changes how automatic vectorization works.
- For good automatic vectorization, several magic compiler flags are required.
- Typically, we have no idea what the compiler has done or even if he has done anything.
- Manual vectorization makes code unreadable and changes the way of programming dramatically without the possibility to port it to more modern hardware.
- As a result, a hybrid approach of manual and automatic vectorization should be used by introducing an SIMD library.

## Why doing things from scratch if there is a library?
- Look at abstraction explanation. Using another library, we typically have how the underlying process works.
- For learning purposes. Afterwards we can still use a library.
- We have to differentiate between learning and problem solving.
- In general, nearly everything already has been done. So the tasks of doing things for yourself might not be as rewarding as it should be. Hence, while doing things for yourself, try not only to copy others code but to think of your own design and implementations. Possibly, a much better implementation is the result.
- Other libraries introduce a major dependency.
- Learning the API of another library might take as long as implementing the problem yourself.
- Other libraries may not be easy to install or to integrate in your working environment.
- Bootstrapping may be easier using your own tools.
- It is fun.
- Many libraries try to be very general. They provide functionalities for every operating system and different hardware. If you are only working on a very specialized system, it may be much better to use your own slick variant. Design and abstraction is done from a more general point of view but problem solving is typically more involved and specialized to a certain situation.

## Naming Conventions and Ideas
### Variables
#### Local Variables
Abbreviations, Acronyms, One-Letter Names, Short but Understandable
Stroustrup: Length of name should be proportional to the scope sizes the variable is used in.
#### Global Variables
Only the most common abbreviations and acronyms, like 'dir' for 'directory' or 'std' for 'standard'.
Descriptive names with possible long name that describe where they are used.
#### Member Variables
Same as global variables without description where they are used because already tells this.

Problem with private member variables and their getters and setters.
They cannot have the same name.
The scope of private variables is much smaller than the scope of public member functions, but private member could be called in a much wider scope than local variables.
Furthermore, public member functions provide a uniform interface.
Hence, the private member variables have to renamed in this scenario but not abbreviated.
Underscores seem to be a good idea.
Be consistent about appending or prepending.
In my opinion, it looks weird to append an underscore.
In such cases, i will stick to prepending.
I do not think, that all private variables should be renamed.
```c++
class A{
 public:
  size_t size() const;
  void set_size(size_t s);
 private:
  size_t _size;
  int id;
};
```

#### Template and Function Arguments
Same as local scope.
#### Constants
No uppercase. Same as other variables.
#### bool
```c++
bool is_valid = false;
bool is_enabled = true;
bool is_done;
bool is_validation_layer_support_enabled = true;
// ...
```


### Functions
Functions are variables of a certain type.
#### void Functions
#### Returning Functions
Constructors vs. Helper Functions: Constructors should only be used when directly initializing members without crazy algorithms.
#### bool Returning Functions
#### Meta Functions
These functions use a different syntax and should therefore be put in another namespace, like 'meta'.

using t = void(int,float);
meta::argument_count<t>; // == 2

### Types, Classes, and Structs
This one cannot be decided easily.
With respect to an object y, could their be a unique x of y?
Do we need functions with the same name to generate that type?
If a finite number of constructors completely suffices then choose the set meaning.
If one needs overloaded functions to be able to use multiple source units and to add functionality from external point then choos semantic meaning.
When going to semantic meaning, add namespace type and change all constructor calls to function constructor overloads.
#### Semantic Meaning
size -> size_t
type::size
type::string
string_t
aabb_t, type::aabb
#### Set Meaning
int, float
uint32_t -> uint32
point
vector
set, map
#### Template Parameters
As a template parameter, a type can be viewed as a variable with local scope.
They are typically named with a starting capital letter.
This should be allowed when the parameter is only one letter.
Otherwise non-capital should be used.

### Concepts
Concepts can be viewed as types of types.
We do not want to introduce another underscore-one-letter suffix.
Use a namespace, like 'generic'.
Put all other meta functions in the namespace 'meta'.
Name concepts by using nouns.
The standard STL naming scheme for concepts seems to be broken, because of backwards compatibility

generic::string
generic::float
generic::callable
generic::callability
generic::invokability
generic::vector
generic::equality<T,U>
generic::constructability<T,U>

### Macros
Macros are special and it should be very clear to everyone when they are used.
Therefore we use capital letters.
#### Macro Symbols
Can be viewed as variables.
#### Macro Functions
Can be viewed as returning functions and should therefore be described by a noun.

### Namespaces
Singletons Implementation: class-based vs. namespace-based
A namespace-based singleton stands for something unique that is already there and will be there until the end of the program, like this_thread, filesystem, system_clock, keyboard, mouse, application.
Otherwise we have a unique timely bounded state. But this may be an anti-pattern. This could be implemented with non-singleton class.
Problems with namespace-based singletons may be non-trivial constructors and destructors and their static memory usage over the whole lifetime of the program as well as hidden dependencies on other non-trivial static global states.

- I do not like capital letters. They break uniformity in API. This is a personal opinion. I will try to reduce their use as much as possible, but will not completely remove them.
- I hate CamelCasing. Look at VulkanAPI: You cannot separate single words in an identifier anymore.
- Do snake_casing for readability.

```c++
class string{
    string(){}
};

// Constructor-based
string a{};
string a;
string(...);

// overloaded function
to_string(...) -> string

namespace type{
struct string{
    string();
    string(const char*);
    string(char);
};
}
using string_t = type::string;
// Create function overloads for all constructors.
string_t string(){return string_t{};}
string_t string(const char* cstr){return string_t{cstr};}
string_t string(char c){return string_t{c};}
// Add more overloads for usability.
string_t string(int);
// That is analogous to size_t type and size functions.


// Not every type needs this.
namespace type{
struct float32x2{};
}
using float32x2 = type::float32x2;


//
using float32 = float;
using float64 = double;
using int32 = int32_t;
using int64 = int64_t;
using uint32 = uint32_t;
using uint64 = uint64_t;


namespace type{
struct aabb{
    aabb();
    //...
};
}
using aabb_t = aabb;

namespace generic{
concept string = ...;
}

// Variables, Functions, Types, Concepts should have the same name.
// But a lot of them could use the same name.
// Therefore we use namespaces to explicitly specify concepts and types.
// Variables are tricky.
// We have to use variables and functions at the same time and cannto automaticalld deduce everything.
// In such a case, abbreviations must be allowed because variables should as short as possible without loss of understanding.
// Variables are typically used in small scopes, where even one-letter variables are understandable.
// For types and functions this is not the case.
// For member variables this can also differ because they can be used in multiple member functions and external code.
// According to naming, member variables should be seen as global variables that are not used in local scope and therefore are not allowed to used magic abbreviations.
application app{};
type::string str = string(12);
// If there is no such function with the same name. No abbreviation should be done.
type::game game;
game_t game;
t::game game;

type<game> game;
type(game) game;
typename game game;

// With capital letters in type names this becomes a little bit easier.
String str = string(12);
Game game;
// But typically, this is not a problem.
auto str = string(12);
struct A{
    Game game;
    type::string string;
    aabb_t aabb;
};


// For concepts, we can do similar things.
void print(STRING const auto& str);
// Here it is not working good because we easily interpret it as macro.
void print(generic::string const auto& str);
// This looks good but breaks uniformity.
```

### Constructors
In C++, constructors of classes, as done in Rust, cannot be extended or overload from the outside.
But it is not possible to always change a class definition for a new constructor.
For example, `std::string` might need constructors for many different custom classes.
It makes no sense to add this dependency to the class definition itself.
Still, needing to add the feature for constructor extensibility (in the sense of factory functions) leads to either using namespaces or prefixes/suffixes for helper functions.
Using static functions inside the class does not allow for extensibility.
Using a static function inside the class that wraps all other calls from the outside is not possible due to the wrong definition order.
```c++
// Rust-style simulation of factory functions and constructor extensions

struct aabb;

namespace detail::aabb{
    using self = ::self;
    // Symbol for 'from' needs to be defined here.
}

struct aabb{
    static auto from(auto&&... args) -> aabb {
        return detail::aabb_from(std::forward<decltype(args)>(args)...);
    }
};

// Customization
namespace detail::aabb {
// This overload will not be seen by '::aabb::from'.
auto from(int i) -> self {
    return {};
}
}

// The only way around would be to define '::aabb::from'
// after all constructor extensions and only declare it in the class itself.
// This is error-prone and no one can be expected to do this.
auto aabb::from(auto&&... args) -> aabb {
    return detail::aabb_from(std::forward<decltype(args)>(args)...);
}
```

So, static functions do not fit this need.
For consistency, it makes to not use static functions for constructor extensions at all.
Using namespace or prefixes/suffixes allows for ADL and arbitrary extensibility.
Types do not need to be accessed from the inside.
Namespaces still seem to not provide the best syntax as they cannot be used with keywords and it is not easy to give them the same name as the type itself.
There is no namespace called 'new'.
C++ STL already uses prefix-based constructor extension functions, like `make_unique`, `to_string`, and `make_shared`.
Multiple different prefixes and suffixes can be used.
```c++
struct aabb {};

// The most specific part of the function name is left.
// This makes better use of editor type support.
auto aabb_from(int) -> aabb {
    return {};
}

// '_from' can easily be specialized.
// And it can be applied in nearly every situation.
auto string_from_file(const std::filesystem::path& path) -> std::string;
// In this case, using only 'string_from(const filesystem::path&)'
// could mean two different things.
// (1) Transform the path into a string by calling 'path.string()'.
// (2) Get the content of the file given by the path.

// Alternative and conform to STL
// But still harder to read.
auto file_to_string(const filesystem::path& path) -> string;
// Used in a function template, it makes much more sense.
// But not easier to read.
template <typename container>
auto file_to(const filesystem::path& path) -> container;
file_to<string>(path);
file_to<vector<char>>(path);
file_to<vector<byte>>(path);
// Still, in the strong sense, this is no constructor extension anymore.
// Hence, it would not be inconsistent to
// use this form for templated transformations.

// Putting the type to the left by using a suffix
// makes assignments by construction easier to read.
const auto box = aabb_from(1);

// Furthermore, we can use a macro to provide all type constructors
// also as constructor extensions.
// This works also for type templates with proper CTAD support.
#define ADD_DEFAULT_CONSTRUCTOR_EXTENSION(TYPE)                        \
  constexpr auto TYPE##_from(auto&&... args) noexcept(                 \
      noexcept(TYPE(std::forward<decltype(args)>(args)...)))           \
    requires requires { TYPE(std::forward<decltype(args)>(args)...); } \
  {                                                                    \
    return TYPE(std::forward<decltype(args)>(args)...);                \
  }

// CTAD cannot be used for partial deduction.
// So, for the special case of partial deduction only for the real constructors,
// we could use the 'auto_' prefix,
// which would then be even combinable with the '_from' suffix.
auto auto_map(...);
```

## References

- [C++ Ref] [cppreference.com](https://en.cppreference.com/w/)
- [Google SG] [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html)
- [build2 BSM] [The build2 Build System](https://build2.org/build2/doc/build2-build-system-manual.xhtml)
- [build2 TS] [The build2 Toolchain Introduction](https://build2.org/build2-toolchain/doc/build2-toolchain-intro.xhtml)
- [Cpp CG] [C++ Core Guidelines](https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md)
- [GSL] [GSL: Guidelines Support Library](https://github.com/microsoft/GSL)
- [PPP SG] [PPP Style Guide](https://www.stroustrup.com/Programming/PPP-style.pdf)
- [Stroustrup SG] [Bjarne Stroustrup's C++ Style and Technique FAQ](https://stroustrup.com/bs_faq2.html)
