# Invariance of the Laplacian

## Problem
Let $n\in\mathbb{N}$, $\Omega\subset\mathbb{R}^n$ an open subset, and $u:\Omega\to\mathbb{R}$ a two-times continuously differentiable scalar function.
Additionally, let $A = (a_{ij}) \in\mathbb{R}^{n\times n}$ denote an orthogonal matrix and $b\in\mathbb{R}^n$ an arbitrary shift vector.
Define the affine transformation $\varphi:\mathbb{R}^n\to\mathbb{R}^n$ with $\varphi(x)=Ax + b$ for all $x\in\mathbb{R}^n$.
<!-- Furthermore, define the Laplacian of $u$ as the following.

\[
    \Delta u = \sum_{i=1}^n \partial^2_iu
\] -->

In this case the Laplacian is invariant under the transformation $\varphi$.

\[
    \Delta(u\circ\varphi) = \Delta u\circ\varphi
\]



---

## Proof

We proof the proposition by computation.

\[
    \Delta(u\circ\varphi) = \nabla\cdot\nabla (u\circ\varphi)
\]

\[
    = \nabla\cdot\left( \mathrm{D}\varphi \cdot \nabla u\circ\varphi \right)
\]

\[
    = \nabla\cdot\left(A \cdot \nabla u\circ\varphi \right)
\]

At this point, let us go over to a simplified Einstein notation where doubled indices demand a summation from $1$ to $n$.

\[
    = \partial_p ( a_{pq} \cdot \partial_qu\circ\varphi )
\]

\[
    = a_{pq} \cdot \partial_p (\partial_q u\circ\varphi)
\]

\[
    = a_{pq} \cdot \partial_r \partial_q u\circ\varphi \cdot \partial_p\varphi_r
\]

\[
    = a_{pq} a_{rp} \cdot \partial_r \partial_q u\circ\varphi
\]

Now, we apply orthogonality of $A$ which means $A^\mathrm{T}A = \mathbb{I}$.

\[
    = \delta_{rq} \cdot \partial_r \partial_q u\circ\varphi
\]

\[
    = \partial_q\partial_q u\circ\varphi = \Delta u\circ\varphi
\]