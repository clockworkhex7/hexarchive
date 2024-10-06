# Lec14 [DStructures1] Disjoint Sets
一个基础的`DisjointSets` interface：
```js
public interface DisjointSets {
	/** Connects two items P and Q. */
	void connect(int p, int q);
 
	/** Checks to see if two items are connected. */
	boolean isConnected(int p, int q);
}
```
我们将通过**四种**不同的set类型，来达成以上两种方法。
## 0. ListOfSets
List of sets of integers:`[{0, 1, 2, 4}, {3, 5}, {6}]
`.
In Java: `List<Set<Integer>>`
**HOWEVER:** iterating through all the sets to find anything.

| Implementation | Constructor | Connect | isConnected |
|:-:|:-:|:-:|:-:|
| ListOfSetsDS | ``\Theta (N)`` | ``O(N)`` | ``O(N)`` |

## 1. QuickFind
List of integers where ith entry gives set number of item i.
```js
public class QuickFindDS implements DisjointSets {
	private int[] id;
	
	public QuickFindDS(int N) {
   	    id = new int[N];
   	    for (int i = 0; i < N; i++){
       	id[i] = -1;
	   }
     } 

	public boolean isConnected(int p, int q) {
    	    return id[p] == id[q];
	}
 
	public void connect(int p, int q) {
    	    int pid = id[p];
    	    int qid = id[q];
    	    for (int i = 0; i < id.length; i++) {
    	       if (id[i] == pid) {
    	           id[i] = qid;
    	       }
    	    }
    	}
}
```
| int[] id | 4 | 4 | 4 | 5 | 4 | 5 | 6 |
|:-:|:--|:--|:--|:--|:--|---|---|
| index / items | 0 | 1 | 2 | 3 | 4 | 5 | 6 |

When call `connect(p, q)` we change entries if `id[p]` to `id[q]`.
For QuickFind, 
the `isConnected()` method is pretty **fast** right now: just check corresponding index in `int[]` and see if they are equal, always **take one single step**.
While the `connect()` is not getting any better... we have to assign every item inside a set with a new id number, which still **iterate over the list exactly one whole cycle**.

| Implementation | Constructor | Connect | isConnected |
|:-:|:-:|:-:|:-:|
| QuickFind | ``\Theta (N)`` | ``\Theta(N)`` | ``\Theta(1)`` |

## 2. QuickUnion
```js
public class QuickUnionDS implements DisjointSets {
	private int[] parent;
	public QuickUnionDS(int N) {
    	    parent = new int[N];
    	    for (int i = 0; i < N; i++) 
        	  {  parent[i] = -1; }
   	    }
 
  	private int find(int p) {
    	    int r = p;
        while (parent[r] >= 0) 
        	  { r = parent[r]; }
       	return r;
    }
    public boolean isConnected(int p, int q) {
	return find(p) == find(q);
}
    public void connect(int p, int q) {
	int i = find(p);
	int j = find(q);
    parent[i] = j;
}
```
Assign each item a **parent** instead of an id.
Results in a tree-like shape.

| parent | -1 | 0 | 1 | -1 | 0 | 3 | -1 |
|:-:|:--|:--|:--|:--|:--|---|---|
| items | 0 | 1 | 2 | 3 | 4 | 5 | 6 |

- `-1` represents **root**, i.e. no parent assigned yet.
- When `connect(a, b)`, first use `find()` method to look for a and b's root node;
-  **set a's ROOT equal to b's parent**.

Now consider the **worst case**, 
there is only one tree and every node extends its parent, in one line.
`connect()` now take at most ``\Theta(N)`` to operate;
while `isConnected()` also take ``\Theta(N)`` -- they both iterate over the entire tree to find root.

| Implementation | Constructor | Connect | isConnected |
|:-:|:-:|:-:|:-:|
| QuickUnion | ``\Theta (N)`` | ``O(N)`` | ``O(N)`` |

## 3.WeightedQuickUnion
We want to prevent trees from getting unbalanced and too tall:
now we **track tree size**, i.e. noting down number of elements in a tree.

**NEW RULES!** Always link root of **smaller** tree to **larger** tree. 
轻的连重的。
树的size看总个数。

Changes Needed:
Replace `-1` with `-weight` for roots (top approach).

| parent | -7 | 0 | 1 | -3 | 0 | 3 | -2 |
|:-:|:--|:--|:--|:--|:--|---|---|
| items | 0 | 1 | 2 | 3 | 4 | 5 | 6 |

如果是负 = 一定是root；
具体负的数值 = 总共这棵树的size
| Implementation | Constructor | Connect | isConnected |
|:-:|:-:|:-:|:-:|
| WeightedQuickUnionDS | ``\Theta (N)`` | ``O(\log N)`` | ``O(\log N)`` |

## 4. WQU with Path Compression
A clear, new idea: When we do `isConnected(15, 10)`, tie **all nodes seen to the root**.

## 5. Summary!
Represent sets as connected components (don’t track individual connections).
- `ListOfSetsDS`: Store connected components as a List of Sets (slow, complicated).
- `QuickFindDS`: Store connected components as set ids.
- `QuickUnionDS`: Store connected components as parent ids.
-  `WeightedQuickUnionDS`: Also track the size of each set, and use size to decide on new tree root.
    -  `WeightedQuickUnionWithPathCompressionDS`: On calls to connect and isConnected, set parent id to the root for all items seen.

| Implementation | Constructor | Connect | isConnected | Runtime | 
|:-:|:-:|:-:|:-:|:-:|
| QuickFind | ``\Theta (N)`` | ``\Theta(N)`` | ``\Theta(1)`` |``\Theta (NM)`` |
| QuickUnion | ``\Theta (N)`` | ``O(N)`` | ``O(N)`` | ``O(NM)`` | 
| WeightedQuickUnionDS | ``\Theta (N)`` | ``O(\log N)`` | ``O(\log N)`` | ``O(M \log N)`` |
| WQU with Path Compression | ``\Theta (N)`` | ``O(\log N)`` single;``O(\alpha (N))``amortized  | ``O(\log N)`` single;``O(\alpha (N))``amortized | ``O(M \log N)`` |

