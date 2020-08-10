# Characterization of Bijectivity

## Problem

Let $X$ and $Y$ be sets and $f:X\to Y$ a function.
Show that $f$ is bijective if and only if there exists a function $g:Y\to X$ with $f\circ g = \operatorname{id}_Y$ and $g\circ f = \operatorname{id}_X$.
Furthermore, show that in this case the function $g$ is unique.

---

## Proof

$\implies$:
Let $f$ be bijective.
The typical characterization of bijectivity is given as follows.

\[
    \forall\ y\in Y: \exists!\ x\in X: \quad f(x) = y  
\]

For all $y\in Y$, let $x\in X$ be the unique element such that $f(x)=y$ and define the function $g$ to be the following.

\[
    g:Y\to X
    ,\qquad
    g(y)=x
\]

\[
    f(g(y)) = f(x) = y
    \quad\implies\quad
    f\circ g = \operatorname{id}_Y
\]

\[
    g(f(x)) = g(y) = x
    \quad\implies\quad
    g\circ f = \operatorname{id}_X
\]

$\Longleftarrow$:

Let $g:Y\to X$ with the following properties.

\[
    f\circ g = \operatorname{id}_Y
    ,\qquad
    g\circ f = \operatorname{id}_X
\]

First, we show that $f$ is injective which is defined by the following statement.

\[
    \forall\ a,b \in X: \quad f(a)=f(b) \implies a = b
\]

Let $a,b\in X$ be arbitrary.
Then the following to equations hold.

\[
    g(f(a)) = a
    ,\qquad
    g(f(b)) = b
\]

\[
    f(a) = f(b)
    \implies
    g(f(a)) = g(f(b))
    \implies
    a = b
\]

This shows that the function $f$ is injective.

Now, we show that $f$ is surjective which is characterized by the following statement.

\[
    \forall\ y\in Y: \exists\ x\in X: \quad f(x) = y
\]

Let $y\in Y$ be arbitrary.

\[
    f(g(y)) = y
\]

Choose $x = g(y)$.

\[
    f(x) = y
\]

This shows that the function $f$ is surjective and as a consequence bijective.


*Uniqueness:*

Let $g_1,g_2:Y\to X$ be two functions with the following properties for all $i\in\{1,2\}$.

\[
    f\circ g_i = \operatorname{id}_Y
    ,\qquad
    g_i\circ f = \operatorname{id}_X
\]

We have already proven that the function $f$ is bijective.
Now, let $y\in Y$ be arbitrary.

\[
    f(g_1(y)) = y = f(g_2(y))
\]

Because $f$ is injective this implies the uniqueness.

\[
    g_1(y) = g_2(y)
\]

!!! note
    The unique function $g$ is called the inverse of $f$ and is typically denoted with $f^{-1}$.
    So $f$ is bijective if and only if its unique inverse exists.