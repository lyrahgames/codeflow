# Convergence Implies the Existence of a Fixed Point

## Lemma

Let $(X,d)$ be a metric space and $f:X\to X$ a continuous function.
Furthermore, let $x_0, x\in X$ and $(x_n)_{n\in\mathbb{N}}$ be a sequence in $X$ such that for all $n\in\mathbb{N}_0$ the following is true.

\[
    x_{n+1} = f(x_n)
    \ ,\qquad
    \lim_{n\to\infty} x_n = x
\]

In this case, $x$ is a fixed point of $f$ and therefore $f(x) = x$.

---

## Proof

To prove the lemma, we directly apply the continuity of $f$ and the definition of $(x_n)$.

\[
    f(x) = f\left( \lim_{n\to\infty} x_n \right) = \lim_{n\to\infty} f(x_n) = \lim_{n\to\infty} x_{n+1} = x
\]

!!! note
    The lemma gives us a way of computing the limit of a converging sequence by solving the equation $f(x)=x$.

## Example

\[
    f:[0,1]\to[0,1]
    \ ,\qquad
    f(x) =
    \begin{cases}
        x^2 &: x\in (0,1] \\
        \frac 12 &: x=0
    \end{cases}
\]

In this case, $f$ is not continuous but provides a fixed point $f(1)=1$.
The lemma cannot be applied.
For $x_0=\frac 12$, the sequence $(x_n)$ will converge to $0$ but $f(0)\neq 0$.