# Lec16 [DStructures2] ADTs, BSTs
## 1. ADT - Abstract Data Types
Abstract Data Type is defined only by its operations, not by its implementation.
“抽象”是指interface里面并不会表明具体method要如何定义，只会给出一些需要override的method效果；
但是，一些例外在于default method，会在interface中事先定义好method的默认情况。
比如说，`ArrayList`可以使用List的default。
**Collections**
- Lists
- Sets
- Maps
An example about map:
```js
Map<String, Integer> m = new TreeMap<>();
String[] text = {"sumomo", "mo", "momo", "mo",
                 "momo", "no", "uchi"};
for (String s : text) {
   int currentCount = m.getOrDefault(s, 0);
   m.put(s, currentCount + 1);
}
```
注：method`getOrDefault`指输出一个key，看他出现过几次，如果没有出现过就回一个默认值0；
当使用map`put`一对key-value pair时，如果先前已经写过一次，则会被改写。

## 2. Binary Search Tree
**Tree**
A tree consists of:
- A set of nodes.
- A set of edges that connect those nodes.
- **Constraint**: There is exactly one path between any two nodes.

**Rooted Tree**
- In a rooted tree, we call **one node the root**.
- Every node N except the root has **exactly one parent**, defined as the first node on the path from N to the root.
- Unlike (most) real trees, the r**oot is usually depicted at the top of the tree**.
- A node with no child is called a **leaf**.
- In a rooted binary tree, every node has either **0, 1, or 2** children (subtrees).

**Binary Search Tree**
- Every key in the **left** subtree is **less** than X’s key.
- Every key in the **right** subtree is **greater** than X’s key.
- Ordering must be complete, transitive, and antisymmetric. Given keys p and q:
    - Exactly one of p ≺ q and q ≺ p are true.
    - p ≺ q and q ≺ r imply p ≺ r.

## 3. BST - Search
```js
public static BST find(BST T, Key sk) {
   if (T == null)
      return null;
   if (sk.equals(T.key))
      return T;
   else if (sk ≺ T.key)
      return find(T.left, sk);
   else
      return find(T.right, sk);
}
```
## 4. BST - Insert 
If found, do nothing.
If not found:
- Create new node.
- Set appropriate link.
```js
static BST insert(BST T, Key ik) {
  if (T == null)
    return new BST(ik);
  if (ik ≺ T.key)
    T.left = insert(T.left, ik);
  else if (ik ≻ T.key)
    T.right = insert(T.right, ik);
  return T;
}
```
## 5. BST - Delete
Goal:
- Maintain BST property.
- Flat’s child definitely larger than dog.
    - Safe to just move that child into flat’s spot.
