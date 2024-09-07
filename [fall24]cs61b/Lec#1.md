# Lec 1
## 1. Basics
In Javascript...
> Notate **CLASS**;
> use **{ }** to begin & end;
> end lines with **;**
### 1.1 Variables
- variables, parameters, and methods(func) have a TYPE.
- always declare **variable types**
- variable types can never change (cannot int -> string)
```js
int i = 0;
string j = "Hello World";
```
### 1.2 Types
- ```boolean```
Java uses `true` and `false`
- ```int```
Java `ints` have a (large) max and min value.
Eg. 1, 2, 3, 4, 5
- ```double```
Decimal values. 
Eg. 3.14159 / 123.456
Java `doubles` are again bounded.
- ```String```
Java `Strings` use **double quotes (")**
Eg. `"Hello World"`
- `char`
Java `char` represents a single character, and uses single quotes (').
### 1.3 Comments
`// This is a single line comment.`
### 1.4 Boolean Operators (the mini stuff)
- And: `&&`
- Or: `||`
- Not: `!`
- ==: `==` 
> In Java, `==` is used for identity, and `.equals()` is used for equality. 
## 2 Exponentials
```js
Math.pow(base, exp);
```
> Eg. `int x = Math.pow(2, 10);` is same to `x = 2 ** 10` in python.
> Have **NO** `2 ^ 10`
## 3 Print
```js
System.out.println("hello world");
```
## 4 Function Declaration and Usage
In Java, we call a function **Method**.
Each method returns only **ONE** value, and that value needs to be declared a **TYPE**.
> Method looks like: 
> ```js
> public static <TYPE of method> <Name>(<Input Type> <Input>){<Body>}
> ```
For example, to write a method that returns a string, we may use:
```js
public static String greet(String name){
    return "Hello, " + name;
}
```
This is equivalent to
```python
def greet(name):
    return "Hello, " + name
```
in python.

**NOTICE!!!**
- When a function returns nothing, it has a return type of `void`.
    - Eg. printing (returns nothing):`public static void`

## 5 Loops
### 5.1 While Loop
```js
int i = 0;
while (i < 10) {
    System.out.println(i);
    i++;
}
```
Add **( )** to conditions.
Notice the curly braces **{ }**.
`++` essentially means `+= 1`.
### 5.2 For Loop
#### For Loop Counting Up
Three important elements inside a `for` loop:
```js
for (initialization; termination; increment) {
    // loop body
}
```
Notice that **increment included in loop**.
For example, to print from <u>0 to 9</u>:
```js
for (int i = 0; i < 10; i ++) {
    System.out.println(i);
}
```
#### For Loop Counting Down
To print from <u>9 to 0</u>:
```js
for (int i = 9; i >= 0; i --) {
  System.out.println(i);
}
```

## 6 Conditionals
**ONE** if -> **MULTIPLE** else if -> **ONE** else
Format:
```js
if (condition){
body;
}... else if (condition){
body;
}... else {
// no condition needed this time!
body;
}
```
Eg.
```js
if (i % 3 == 0 && i % 5 == 0) {
    System.out.println("FizzBuzz");
} else if (i % 3 == 0) {
    System.out.println("Fizz");
} else if (i % 5 == 0) {
    System.out.println("Buzz");
} else {
    System.out.println(i);
}
```
## 7 Strings
**Define** a string: 
```js
String s = "Hello";
```
**Modify** string:
```js
s += " world";
s += 5;
```
Counting **Length**:
```js
int sLength = s.length();
```
**Slicing**:
```js
String substr = s.substring(1, 5);
```
> Note: same as `s[1:5]`

**Selecting**:
```js
char c = s.charAt(2);
```
> Note: same as `c = s[2]`

**Looking Up**:
JS does not have `in` to look up for strings.
Instead, use `.indexOf()` method.
When `x` not in `word`, the method **returns '-1'**.
**TO SEE IF A PART IS IN THE STRING** in Python,
```py
if "hello" in s:
    <body>
```
converts to:
```js
if (s.indexOf("hello") != -1){
<body>;
}
```
**TO FIND INDEX TO A LETTER**:
...first occurence!
```js
s = "hello world";
int index = s.indexOf('o');
```

**TO FIND LETTER BY GIVEN INDEX**:
Use `.charAT()` method.
```js
char letter = s.charAt(i);
```
assigns name `letter` the first-occurence index of letter `i` in string `s`.

## Programming
All codes in JS must be in **CLASS**
Everything inside a **METHOD**, if cannot find appropriate function, use `public static void main(String[] args)`.
Eg.
```js
public class LargerDemo {
   public static int larger(int x, int y) {
      if (x > y) {
         return x;
      }
      return y;
   }

   public static void main(String[] args) {
      System.out.println(larger(-5, 10));
   }
}

```
Where`System.out.println(larger(-5, 10))`only prints some simple lines, but **still need to be in a method**.
