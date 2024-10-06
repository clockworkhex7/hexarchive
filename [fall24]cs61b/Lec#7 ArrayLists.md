# Lec7 ArrayLists
## 1. Basic ArrayList Implementation
```js
public class AList {
   private int[] items;
   private int size;

   /** Creates an empty list. */
   public AList() {
       items = new int[100];
       size = 0;
   }
}
```
For every AList, we have:
> index 0 1 2 3 4 5 6 ...
> item  [1 3 5 7 9 0 0 ...]
> size = 5 
When we add new things, the next item wil always go into the position of `size`.

**Method `addLast`**
```js
/** Inserts x into the back of the list. */
   public void addLast(int x) {
       items[size] = x;
       size += 1;
   }
```
**Method `getLast`**
```js
/** Returns the item from the back of the list. */
   public int getLast() {
       return items[size - 1];
   }
```
**Method `get`**
```js
public int get(int i) {
       return items[i];
   }
```
* The position of the **next item** to be inserted is always `size`.
* `size` is always the **number of items** in the AList.
* The **last item** in the list is always in position `size - 1`.
## 2. RemoveLast Implementation
Most of the times, users only care about whether the effects suits their expectation, yet they never care about the base codes.
To implement the **`RemoveLast`** method,
we want to **deletes item from back of list and returns deleted item.**
In this process, simply change the counting of `size` and fetch the last term;
there is no need (so far) to reset the previously last term, for we will**overwrite** it anyway some time.
```js
   public int removeLast() {
       int x = getLast();
       size = size - 1;
       return x;
   }
```
## 3. Resizing ArrayLists
When the original list is fully used, we are unable to add any items anymore.
In this case, we create a **somehow longer** new `ArrayList` and copy every previous item into it, then bind the `item` to the new arraylist. -- With this being said, the garbage collector will automatically delete the previous lists!
We create  `resize` method first, and incorporate it into `addLast`, in case when we reach the size limit, the program may automatically prolong the list size!
```js
private void resize(int capacity) {
  int[] a = new int[capacity];
  System.arraycopy(items, 0, a, 0, size);
  items = a;
}
public void addLast(int x) {
  if (size == items.length) {
    resize(size + 1);
  }
  items[size] = x;
  size += 1;
}
```
## 4. Generics!
As usual, we need a placeholder to identify the specific type: `<Glorp>`, let's say.
However, in this case we better **NOT** simply put `new Glorp[8]`;
instead, `items = (Glorp[]) new Object[8];` is what we recommend.
```js
public class AList<Glorp> {
   private Glorp[] items;
   private int size;

   public AList() {
       items = (Glorp[]) new Object[8];
       size = 0;
   }

   private void resize(int cap) {
       Glorp[] a = (Glorp[]) new Object[cap];
       System.arraycopy(items, 0,
               a, 0, size);
       items = a;
   }

   public Glorp get(int i) {
       return items[i];
   }
   ...
}
```