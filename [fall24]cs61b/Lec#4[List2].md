# Lec4 [List2] SLList
In this lecture, we look at improvements that could be made to `IntList` methods, primary to make programs more efficient and precise.
**IMPORTANT THING TO DIGEST!**
```js
public class SLList {
   private static class IntNode {
       public int item;
       public IntNode next;
       public IntNode(int i, IntNode n) {
          item = i;
          next = n;
       }
    }
   private IntNode sentinel;
   private int size;
// Constructors
// normal ones that takes one argument
   public SLList(int x) {
        //42 can be anything!
      sentinel = new IntNode(42, null);
      sentinel.next = new IntNode(x, null);
      size = 1;
   }
// empty ones that sets defalt value
   public SLList() {
      sentinel = new IntNode(42, null);
      size = 0;
   }
//Adds x to the front of the list. 
   public void addFirst(int x) {
      sentinel.next = new IntNode(x, sentinel.next)
      size += 1;
   }
// Returns the first item in the list. 
   public int getFirst() {
      return sentinel.next.item;
   }
//Adds an item to the end of the list. 
   public void addLast(int x) {
      IntNode p = sentinel;
      size += 1;
      /* Move p until it reaches the end of the list. */
      while (p.next != null) {
         p = p.next;
      }
      p.next = new IntNode(x, null);
   }
}
```
## 1. Rebranding and Culling
Comparison between `SLList` and `IntList`:
```Js
IntList X = new IntList(10, null);
SLList Y = new SLList(10);
// SLList is easier to instantiate!
```
## 2. `addFirst` and `getFirst`
defining helper functions
## 3. Access Control
Use the `private` keyword to prevent code in other classes from using members (or constructors) of a class:
```js
private static class IntNode {}
//and
private IntNode sentinel;
private int size;
```
Prevent stupid cases like ~~`L.first.next.next = L.first.next`~~!

## 4. Nested Classes
```js
public class SLList {
   private static class IntNode {
   ......
   private IntNode sentinel;
   private int size;
```
- `IntNode` is nested within `SLList` and is `private static class`;

> Declaring `sentinel` as `private IntNode sentinel` is allowed because:
    -  `SLList` has access to `IntNode` (since it's nested within the class). 
    - Even though `IntNode` is `static`, `sentinel` is an instance variable of type `IntNode`, meaning each instance of `SLList` will have its own sentinel node.
    
== 可以理解为“只有在class里面的东西”可以成为`private`，例如：
```js
private class xxx{}
//java会报错！
```
## 5. Efficiency
Sure thing we could compute size of lists recursively:
```js
private int size(IntNode p) {
      if (p.next == null)
         return 1;
      return 1 + size(p.next);
   }
   public int size() {
      return size(first);
   }
```
However it's way more efficient if we **track sizes all the way** instead of compute at the end, starting with `private int size;`.
## 6.Representing the Empty List
Defalt `first` to `null` is simple:
```js
public SLList() {
      first = null;
      size = 0;
   }
```
However, we ignore cases where we call `fist.next` and program will crash!
Now introduce `sentinel`:
```js
private IntNode sentinel;
...
    sentinel = new IntNode(63, null);
```
hence `sentinel.next`can never be `null`!
