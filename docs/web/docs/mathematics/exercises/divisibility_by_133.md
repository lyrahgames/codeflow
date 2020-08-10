# Divisibility by 133

## Problem
Show by mathematical induction that for all $n \in \mathbb{N}$ there exists an $m \in \mathbb{N}$ such that the following equations holds.

\[
    11^{n+1} + 12^{2n-1} = 133 \cdot m
\]

---

## Proof

**Initial Case:** $n=1$

\[
    11^{n+1} + 12^{2n-1} = 11^2 + 12 = 133
    \quad \implies \quad
    m = 1
\]

**Induction Step:** $n\implies n+1$

Let $n\in\mathbb{N}$.
According to the induction hypothesis, there exists an $m\in\mathbb{N}$ such that the following holds.

\[
    11^{n+1} + 12^{2n-1} = 133 \cdot m
\]

We will now show that based on this hypothesis there exists another $m' \in \mathbb{N}$ such that the same equation holds for $n+1$.

\[
    11^{(n+1)+1} + 12^{2(n+1)-1} = 11 \cdot 11^{n+1} + 12^2 \cdot 12^{2n-1}
\]

First, we factor out the number $11$.
For the right term, we are left with a remaining part.

\[
    = 11 \cdot \left( 11^{n+1} + 12^{2n-1} \right) 
    + \left( 12^2 - 11 \right) \cdot 12^{2n-1}
\]

<!-- The factor of the remaining part can directly be computed. -->

\[
    = 11 \cdot \left( 11^{n+1} + 12^{2n-1} \right) 
    + 133 \cdot 12^{2n-1}
\]

Using the induction hypothesis, we know that the first term is divisible by $133$.
After factoring out $133$, it can then be seen that for $n+1$ the given number is divisible by $133$.

\[
    = 11 \cdot 133 \cdot m + 133 \cdot 12^{2n-1}
\]

\[
    = 133 \cdot \left( 11 \cdot m + 12^{2n-1} \right)
    \quad\implies\quad
    m' = 11 \cdot m + 12^{2n-1}
\]

By mathematical induction, this proves the lemma.