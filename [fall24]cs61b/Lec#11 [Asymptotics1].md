# Lec11 Asymptotic Analysis
## 1. Intuitive Simplification
### i) Consider Only the Worst Case
```js
for (int i = 0; i < A.length; i += 1) {
  for (int j = i+1; j < A.length; j += 1) {
    if (A[i] == A[j]) {
       return true;
    }
  }
}
return false;
```
Only look at running every for loops!
i.e 跑一遍也能成功，全部跑完也能成功；通常看跑的次数最多的情况。
### ii) Eliminate Low Order Terms
only look at ``N^2`` in ``\frac{N^2+3N+2}{2} ``
### iii) Eliminate Multiplicative Constants
系数统统不看！
``\frac{N^2}{2} \equiv N^2``
``N^3 + 5 \equiv N^3``

## 2. Big Theta
Example:
For ``Q(N) = 3N^3+N^2``, we say the **Order of Growth** is ``N^3``.
To put this in **Big Theta Notation**:
```math
N^3+3N^4 \in \Theta(N^4)
```
```math
\frac{1}{N} + N^3 \in \Theta(N^3)
```
### Formal Definition of Big Theta
``R(N) \in \Theta(f(N))`` means that there exist positive constant<u> k_1 and k_2</u> that :
```math
k_1\cdot f(N) \le R(N) \le k_2 \cdot f(N)
```
for all values of **very large N.**
Example:
suppose ``R(N) = \frac{4N^2 + 3N \cdot \ln(N)}{2}``, we can say:
- ``f(N) = N^2``
- ``k_1 = 1``
- ``k_2 = 3``
## 3. Big Omega
Upper bound O:
```math
R(N) \le k_2 \cdot f(N) = O(f(N))
```
Lower bound omega:
```math
\Omega(f(N)) = k_1\cdot f(N) \le R(N)
```
