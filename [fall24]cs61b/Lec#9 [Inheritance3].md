# Lec9 [Inheritance3]Subtype Polymorphism
**Polymorphism**: providing a single interface to entities of differnt types.
## 1. max in Dogs & OurComparable
When creating a `max` method comparing dogs' size, consider a problem: how do you fetch `size` automatically<u> from an array full of dog objects?</u>

**STEP1:**
Create an interface that guarantees a comparison method.
核心就是，把大于/小于的思想变成一个method，用
`a.compareTo(b)`的方法代替。
> OurComparable.java **[interface!]**

```js
public interface OurComparable {
   /** Return -1 if this < o.
    *  Return 0 if this equals o.
    *  Return 1 if this > o.
    */
   public int compareTo(Object o);
}
```
**STEP2**:
implement the `compareTo` method into `dog` classes!
```js
// starting with implementing new interface
public class Dog implements OurComparable {
   private String name;
   private int size;

   /** define method of comparison.
   * so could call Class.method later. */
   public int compareTo(Object o) {
   //cast o into Dog, will adress this later
      Dog uddaDog = (Dog) o;
       return this.size - uddaDog.size;
   }
}

```
**STEP3**:
modify `maximizer` class in terms of this interface.
> Maximizer.java **only has the `maximizer` class!**
```js
// interface can work as static types as well
public class Maximizer {
  public static OurComparable max(OurComparable[] items) {
      int maxDex = 0;
      for (int i = 0; i < items.length; i += 1) {
      //replace ">" with the new compareTo method
         int cmp = items[i].compareTo(items[maxDex]);
         if (cmp > 0) {
            maxDex = i;
         }
      }
      return items[maxDex];
   }
}
```
## 2. Comparables
The industrial strength approach: **Use the built-in Comparable interface.**
Already defined and used by tons of libraries. Uses generics.
`Comparable<T>` is a **built-in**Java interface, used for comparing objects of the same type, and it has a `compareTo` method that must be implemented.
```js
public interface Comparable<T> {
//INTEGER!!!
    int compareTo(T o);
}
```
**NOTE!** no specification on HOW a `CompareTo` method may return something, but whatever it returns, it should be an **integer**, bc this is how the built in interface were made

<u>Now, no need to create a new interface file for comparables:</u>
```js
// <Dog>for comparing Dog objects specifically
public class Dog implements Comparable<Dog> {
   private String name;
   private int size;
   
   @Override
   public int compareTo(Dog uddaDog) {
       return this.size - uddaDog.size;
   }
}
```
本来只有ourcomparable，没有办法特指`dog`class，为了让`compareTo()`能够专门比`Dog`，需要`Dog uddadog = (Dog) o`;
现在有了`Comparable<Dog>`, `compareTo()`自动特指`Dog`，就省去了casting。

## 3. Comparator
Another built-in interface as well!
**Requires to implement in a nested class!**
Originally, `Comparator` looks like:
```js
public interface Comparator<T>{
    int compare(T o1, T o2);
}
```
十分类似于`CompareTo`，但是此处的`compare` method需要两个parameter；
并且需要注意，应用在不同的class中时，需要把`<T>`所对应的内容改的相通！！

```js
import java.util.Comparator;
public class Dog implements Comparable<Dog> {
   private String name;
   private int size;
...
//nested class
   public static class NameComparator implements Comparator<Dog> {
       private int compare(Dog a, Dog b) {
       //directly use compareTo to work on string
           return a.name.compareTo(b.name);
       }
   public static Comparator<Dog> getNameComparator() {
       return new NameComparator();
   }
   }
}
```
While being called...
```js
 Comparator<Dog> nc = Dog.getNameComparator();
 //call RHS = call new NameComparator()
       if (nc.compare(d1, d3) > 0) { 
       // if d1 comes later than d3 in the alphabet
           d1.bark();
       } else {
           d3.bark();
       }
```