# Lec 2
In Java, we run and call method inside codes.
All method shall be called inside a **main method**.
```js
public static void main(String[] args) {
      Dog.makeNoise();
   }
```
> can be called either in the class it's defined, or other classes. **[CLASS DOESNT MATTER]**
## 1 WORLD IS A HUGE OOP!
### Dog
```js
public class Dog {
// this is the biggest class for dogs!
  public int weightInPounds;
// instance variable "weight"
// have to declare its TYPE!
  public Dog(int startingWeight) {
     weightInPounds = startingWeight;
  }
// = python's __init__ method
// make it possible when you input: 
// Dog(55), the dog's weightInPounds is 
// automatically bound to 55
  public void makeNoise() {
//non-static method: 
// vary according to each not, 
// not universal towards all
     if (weightInPounds < 10) {
        System.out.println("yipyipyip!");
     } else if (weightInPounds < 30) {
        System.out.println("bark. bark.");
     } else {
        System.out.println("woof!");
     }
  }
}

```
We say, **Classes can be instantiated as objects.**.
This means **<u>Dog</u>** class -> create **<u>instances</u>** of this Dog.
### Dog Launcher
Then having a DogLauncher where methods are called.
```js
public class DogLauncher {
   public static void main(String[] args) {
   //main  method to call  everything!
      Dog smallDog; // a name/variable
      new Dog(20); // a dog of weight 20
      smallDog = new Dog(5); // bind
      Dog hugeDog = new Dog(150);
      //do all above in one line
      smallDog.makeNoise();
      hugeDog.makeNoise();
      //after binding, call them all!
   }
}
```
### An Array of Objects
```js
Dog[] dogs = new Dog[2];
//Dog[]: create a list
//dogs: list name
//new Dog[2]: indicate that you have
//two objects in a list
dogs[0] = new Dog(8);
dogs[1] = new Dog(20);
//assign dogs' info
dogs[0].makeNoise();
```

## 2 Static VS. Non-Static
### Static Methos
```js
public static void makeNoise() {
   System.out.println("Bark!");
}
```
- invoked using the class name, e.g. `Dog.makeNoise();`
- can’t access “my” instance variables, because there is no “me”.
- Exist to serve some general things, such as `x = Math.round(5.6)` instead of `Math m = new Math(); x = m.round(x);`
### Non-Static Method
```js
public void makeNoise() {
   if (weightInPounds < 10) {
      System.out.println("yipyipyip!");
   } else if (weightInPounds < 30) {
      System.out.println("bark. bark.");
   } else { System.out.println("woof!"); }
}
```
- invoked using an instance name, e.g. `maya.makeNoise();`

## 3 Dogs Revisited: maxDog
We want to compare two dogs' weights, and ask the heavier dog to bark.
### Method 1: Using STATIC Method
Invoked as `Dog.maxDog(a, b)` and returns a dog from either `a` or `b`.
***Dog.java***
```js
public static Dog maxDog(Dog d1, Dog d2) {
     if (d1.weight > d2.weight) {
        return d1;
     }
     return d2;
  }
```
***DogLauncher.java***
```js
public static void main(String[] args) {
     Dog d = new Dog(15);
     Dog d2 = new Dog(100);
// making new dogs
     Dog bigger = Dog.maxDog(d, d2);
     bigger.makeNoise();
// assign instance bigger to what's returned
// by calling Dog.maxDog(d, d2)
// either d or d2
  }
```
### Method 2: Using NON-STATIC Method
Invoked by `dogname.maxDog(another dogname)`.
***Dog.java***
```js
public Dog maxDog(Dog d2) {
     if (weight > d2.weight) {
        return this; //this = self, which is Dog
     }
     return d2;
  }
```
***DogLauncher.java***
```js
bigger = d.maxDog(d2);
bigger.makeNoise();
```
## 4 Language Constructs [ref hw0B]
### 4.1 Fixed-Sized ArrayLists
> create an array with a **specified size**:
```js
int[] zeroedArray = new int[3];
//int[]: indicate this is of all integers
//zeroedArray: name of this created array
//new int[3]: three new items inside (length)
```
> create an array with **initial values**:
```js
int[] array = {4, 7, 10};
```
> **modify** terms
```js
array[0] = 5;
```
> **printing** terms
 ```js
System.out.println(array[0]);
//print #0 term
System.out.println(Arrays.toString(array));
//print entire array
System.out.println(array.length);
//print length
```
**NOTE!!**
- To print an array, call `Arrays.toString(array)`.
- Java does not support ~~negative indexing or slicing.~~

### 4.2 Enhanced For Loop
```js
int[] array = {1, 2, 3};
for (int i : array) {
// ":" = in
    System.out.println(i);
}
```
### 4.3 Resizable Lists
- create new list
```js
List<String> lst = new ArrayList<>();
//list of string objects named "lst"
```
- append by `listname.add("xxx")`
- modification by `listname.set(index,term)`
- find by `listname.get(index)`
- length by `listname.size()`
- boolean by `listname.contains("xxx")`
- Example!
```js
List<String> lst = new ArrayList<>();
lst.add("zero");
lst.add("one");
lst.set(0, "zed");
System.out.println(lst.get(0));
System.out.println(lst.size());
if (lst.contains("one")) {
    System.out.println("one in lst");
}
for (String elem : lst) {
    System.out.println(elem);
}
```
### 4.4 Sets
```js
Set<Integer> set = new HashSet<>();
```
There are two main implementations: TreeSet, and HashSet.
- TreeSet keeps its elements in “**<u>*sorted*</u>**” order, and is fast. 
- In contrast, HashSet does not have a defined “order”, but is (usually) really fast.

### 4.5 Dictionaries / Maps
```js
Map<String, String> map = new HashMap<>();
```
- Adding keys and values by`dicname.put(key, value)`
- look up keys by `dicname.get(keyname)`
- boolean by `dicname.containsKey(keyname)`
- iterate over keys by `dicname.keySet()`
- iterate over keys and values by `dicname.entrySet()`
- Example!
```js
Map<String, String> map = new HashMap<>();
map.put("hello", "hi");
map.put("hello", "goodbye");
System.out.println(map.get("hello"));
System.out.println(map.size());
if (map.containsKey("hello")) {
    System.out.println("\"hello\" in map");
}
for (String key : map.keySet()) {
    System.out.println(key);
}
```
Similarly, there are two main implementations: TreeMap, and HashMap. 
- A Map cannot contain ~~duplicate keys~~. If we try to add a key already in the map, **<u>*the value would be overwritten.*</u>**
## 5 Class
***ClassExample.java***
```js
//abstracting data!
public class Point {
    public int x;
    public int y;
    //setting variables that every instant should have
    
    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }
    //constructing Point
    
    public Point() {
        this(0, 0);
    }
    public double distanceTo(Point other) {
        return Math.sqrt(
            Math.pow(this.x - other.x, 2) +
            Math.pow(this.y - other.y, 2)
        )
    }
    //Methods!
    
    public void translate(int dx, int dy) {
        this.x += dx;
        this.y += dy;
    }
}

//to call methods, we make main method!
public static void main(String[] args) {
        Point p1 = new Point(5, 9);
        Point p2 = new Point(-3, 3);
        System.out.println("Point 1: ( " + p1.x
            + ", " + p1.y + ")");
        System.out.println("Distance: "
            + p1.distanceTo(p2));
        p1.translate(2, 2);
        System.out.println("Point 1: ( " + p1.x
            + ", " + p1.y + ")");
    }``
```
