# Cardinal Number of Finite Power Sets

## Problem

Prove that the number of different subsets of a finite set $X$ with $n\in\mathbb{N}$ elements is given by $2^n$.

---

## Proof

**Initial Case:** $n=1$

In this case, the set $X$ consists only of one element which will be denoted by $x$.

\[
    X = \{ x \}
    \quad \implies \quad
    \emptyset \neq X
\]

\[
    \mathcal{P}(X) = \{ \emptyset, X \}
    \quad \implies \quad
    |\mathcal{P}(X)| = 2
\]

**Induction Step:** $n\implies n+1$

Let $X$ be a set with $n\in\mathbb{N}$ elements.
According to the induction hypothesis, the following holds.

\[
    |\mathcal{P}(X)| = 2^n
\]

Assume $x\notin X$ and define $Y$ to be their joined set.

\[
    Y = X \cup \{ x \}
    \qquad
    \emptyset = X \cap \{x\}
\]

Hence, every subset of $X$ is a subset of $Y$ but not vice versa and the subsets of $Y$ that are not subsets of $X$ have to contain the element $x$.
As a consequence, these can be described by the following expression.

\[
    \mathcal{P}(Y)\setminus \mathcal{P}(X) = \left\{ A \cup \{x\} : A \in \mathcal{P}(X) \right\}
\]

Based on this, we conclude the number of subsets of $Y$ that are not subsets of $X$ to be the same as the number of subsets of $X$.

\[
    |\mathcal{P}(Y) \setminus \mathcal{P}(X)| = |\mathcal{P}(X)|
\]

Furthermore, we know that their union defines the power set of $Y$ and that they are disjoint.

\[
    \mathcal{P}(Y) = \mathcal{P}(X) \cup \mathcal{P}(Y)\setminus \mathcal{P}(X)
\]

\[
    \emptyset = \mathcal{P}(X) \cap [ \mathcal{P}(Y)\setminus \mathcal{P}(X) ]
\]

Therefore the number of elements in the power set of $Y$ can be computed by the following expression.

\[
    |\mathcal{P}(Y)|
    = |\mathcal{P}(X)| + |\mathcal{P}(Y) \setminus \mathcal{P}(X)|
    = 2 |\mathcal{P}(X)|
    = 2 \cdot 2^n
    = 2^{n+1}  
\]

By mathematical induction, this proves the lemma.