# Lec8 [Inheritance1&2] Interface and Inheritance
## 1. Interface Inheritance
To **implement a same method on different classes**, one <u>stupid</u> way is to **overload** -- Copy-paste the same method body into two methods with different signatures. [**NOT** recommended!]
### Hypernyms and Hyponyms
* poodle / malamute / yorkie -> sub terms of **dogs**
We say dogs are **hypernyms** 上位 of p/m/y;
p/m/y are **hyponyms** 下位 of dogs.
## 2. Hyponymic Relationships in Java
Obviously, SLList and AList are hyponyms of **LIST**;
by a two-step process, we want:
**<u>Step 1:</u>** Define a reference type for our hypernym (List61B.java).
**<u>Step 2</u>**: Specify that SLLists and ALists are hyponyms of that type.
### Step1 - Interface
写一个统筹的目录**Interface**;
Interface is a specification of **what a List is able to do**, not how to do it.
**File: List61B.java**
```js
public interface List61B<Item> {
   public void insert(Item x, int position);
   public void addFirst(Item x);
   public void addLast(Item y);
   public Item getFirst();
   public Item getLast();
   public Item removeLast();
   public Item get(int i);
   public int  size();
}
```
### Step2 - Inheritance
在各自分开的class文件中，标明从属关系；
Use `implements` keyword so that SLList and AList are now hyponyms of List61B.

**NOTE!** interface主要是“证明class属于一个大的合集” + “罗列每个class需要用到的method”；你依旧需要在每个class中定义每个提到过的method。
```js
public class AList<Item> implements List61B<Item> {
   ...
   public void addLast(Item x) {
      ...
```
```js
public class SLList<Blorp> implements List61B<Blorp>{
   ...
   public void addLast(Blorp x) {
      ...
```
So far, we have:
`List61B = AList + SLList`

In this case, while defining functions:
```js
public static String longest(List61B<String> list){
}
```
**NOTE** we use `List61B<String>` to replace `AList<String>`

## 3. Overriding VS. Overloading
interface会被用于罗列所有method，在**<u>每个</u>** subclass需要**重新定义methods**， 并且使用`@override`.
Within in List61B.java:
```js
public interface List61B<Item> {
   public void addLast(Item y);
   ...
```
Within AList.java:
```js
public class AList<Item> implements List61B<Item>{
   ...

   @Override
   public void addLast(Item x) {
      ...
```
## A Brief Look on Interface & Inheritance!
Specifying the capabilities of a subclass using the implements                        keyword is known as <u>**interface inheritance**</u>.
* **Interface**: The list of all method signatures.
* **Inheritance**: The subclass “inherits” the interface.
* Specifies what the subclass **can do**, but not how.
* **<u>Subclasses must override all of these methods!</u>**; otherwise, will fail to compile otherwise.

## 4. Extends
If we want to inherit methods from a **class**:
use `extend` to let one class to be a hyponym of another class.
Now we want to start off a `RotatingSLList`, which is a type of `SLList` but not under `List61B` interface;
the  `RotatingSLList` is missing all the methods from `SLList`, but we still want to operate it.
When declaring the class, we are supposed to use `extends` signature:
```js
public class RotatingSLList<Item> extends SLList<Item>
```
Because of extends, RotatingSLList inherits all members of SLList:
* All instance and static **variables**.
* All **methods**.
* All **nested classes**.
* **<u>*Constructors are not inherited.*</u>**
## A Brief Look on Implements and Extends
* Use `implements`if the hypernym is an **interface** and the hyponym is a class (e.g. hypernym List, hyponym AList).
* Use `extends` in all other cases.

## 5. Super()
只能在extend之下用。
The `super ` keyword in Java is used in classes that inherit from another class using `extends`. It refers to the **parent class** (superclass) of the current object.
`super` used in two main ways:
* To **call a method** from the parent class that has been overridden in the child class.
* To **call the constructor** of the parent class, since constructors are not included when inheriting.
### 5.1 super methods
```js
// only extended classes can use super
public class VengefulSLList<Item> extends SLList<Item> {
   private SLList<Item> deletedItems;
   public VengefulSLList() {
       deletedItems = new SLList<Item>();
   }

   @Override
   // we don't want to copy-paste codes
   //SLList's removeLast method uses private variables like:
   // sentinel and size. 
   //VengefulSLList cannot access these variables.
   public Item removeLast() {
       Item oldBack = super.removeLast();
       //Use the super keyword to call SLList's removeLast method.
       // so we don't have to care about sentinel!
       deletedItems.addLast(oldBack);
       return oldBack;
   }

   public void printLostItems() {
       deletedItems.print();
   }
}
```
### 5.2 super constructors
Idea: If every VengefulSLList is-an SLList, every VengefulSLList **must be set up like an SLList**.
Constructors with / without parameters:
```js
 public VengefulSLList() {
       deletedItems = new SLList<Item>();
   }
   public VengefulSLList(Item x) {
       super(x);
       deletedItems = new SLList<Item>();
   }
```
## 6. Types
Every variable in Java has a “**compile-time type**”, a.k.a. “**static type**”.
This is the type specified at **declaration**. Never changes!
> 这里的static就是compile-time type!
```js
public static void main(String[] args)
```
------

Variables also have a “**run-time type**”, a.k.a. “**dynamic type**”.
This is the type specified at **instantiation** (e.g. when using new).
> 简单来说就是object type！
```js
livingThing lt1;
lt1 = new Fox()
```
Method calls have compile-time type equal to their declared type.
```js
public static Dog maxDog(Dog d1, Dog d2) { ... }
```
**Any call to maxDog will have compile-time type Dog!
**
So under this case, if you directly call:
```js
Poodle largerP = maxDog(Frank, FrankJr)
```
...gives a compilation error!
**Because maxDog always returns Dog objects.**
因为poodle是dog的一种，即使frank和frankjr在定义的时候是poodle，但他们仍然能够被当作dog使用于parameter；
但是`maxDog`是method，只会return `Dog`。
To get a special syntax for specifying the compile-time type of any expression:
```js
Poodle largerPoodle = (Poodle) maxDog(frank, frankJr);
```
this is called **Casting**!
* tells JS  to treat an expresison as having a different compile-time type;
* let the compiler ignore its type checking duties;
* does not actually change anything, so make sure your classes are correct

