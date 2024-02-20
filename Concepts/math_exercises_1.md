# Practice exercises for theory

1. Recursive definitino of $card(X)$

    I. **Basis**: if $X = \{\}$, then $card(X) = 0$

    II. **Recursive step**: if $X = Y \cup \{z\}$, then $card(X) = s(card(Y))$

    III. **Closure**: $card(X) = n$ only if it can be obtained from the basis using a finite number of applications of the recursive step


0. Recursive definition of the set of prime numbers: $P = \{2, 3, 5, 7, 11, 13, ...\}$

    I. **Basis**: $2 \in P$

    II. **Recursive step**: $n \in P$ only if for any $p \in P$, $n$ $mod$ $p \neq 0$

    III. **Closure**: $n \in P$ only if it can be obtained from the basis using a finite number of applications of the recursive step


0. Prove by induction Gauss' formula for sum of numbers up to $n$

    $\Sigma_{i=0}^n i = \dfrac{n(n+1)}{2}$

    I. **Basis**: $n = 0$

    $0$

    $\frac{0(0+1)}{2} = \frac{0}{2} = 0$

    II. **Inductive hypothesis**: $n = k$

    $\Sigma_{i=0}^k i = \dfrac{k(k+1)}{2}$

    III. **Inductive step**: $n = k + 1$

    $\Sigma_{i=0}^{(k + 1)} i = \dfrac{(k +1)((k+1) + 1)}{2}$

    $\Sigma_{i=0}^{k} i + (k + 1) = \dfrac{(k +1)((k+1) + 1)}{2}$   // Definition of sum

    $\dfrac{k(k+1)}{2} + (k + 1) = \dfrac{(k +1)((k+1) + 1)}{2}$   // inductive hypothesis

    $\dfrac{k(k+1)}{2} + \dfrac{2(k + 1)}{2} = \dfrac{(k +1)((k+1) + 1)}{2}$   // multiply and divide by 2

    $\dfrac{k(k+1) + 2(k + 1)}{2} = \dfrac{(k +1)((k+1) + 1)}{2}$   // addition of fractions

    $\dfrac{(k+1)(k + 2)}{2} = \dfrac{(k +1)((k+1) + 1)}{2}$   // factorize (k+1)

    $\dfrac{(k+1)(k + 1 + 1)}{2} = \dfrac{(k +1)((k+1) + 1)}{2}$   // definition of adition

    $\dfrac{(k+1)((k + 1) + 1)}{2} = \dfrac{(k +1)((k+1) + 1)}{2}$   // associative property

