# Lec6 Testing
During this whole lecture, the ultimate goal is to complete a `sort()` function that takes in an array list and sort them alphabetically, as well as their **test cases.**
## 1. Naive Way of Testing
**WARNING:**
This is boring and tedious to look at!
Not recommended -- basically listing out every possible expectation and use program to see if it goes right...
```js
public class TestSort {
   /** Tests the sort method of the Sort class. */
   public static void testSort() {
       String[] input =    {"CC", "BB", "DD", "AA"};
        String[] expected = {"AA", "BB", "CC", "DD"};
        Sort.sort(input);
        ...
    }
    public static void main(String[] args) {
       testSort();
   }
}
```
## 2. Unit Test & Truth
To make the case above easier to understand, we import `static com.google.common.truth.Truth.assertThat` and `org.junit.jupiter.api.Test` to assist out debugging.
```js
import static com.google.common.truth.Truth.assertThat;
import org.junit.jupiter.api.Test;
// above the existing library needed!

public class TestSort {
   /** Tests the sort method of the Sort class. */
   @Test
   // important to put the @Test! otherwise won't run
   // non-static to run!
   public void testSort() {
       String[] input = {"cows", "dwell", "above", "clouds"};
       String[] expected = {"above", "clouds", "cows", "dwell"};
       Sort.sort(input);
// is going to report whether results and expected look the same
       assertThat(input).isEqualTo(expected);
   }
}
```
**IMPORTANT!**
> - Always remember to **add** `@Test` before a method;
> - make the funtion **non-static**.

## 3. The Selection Sort Algorithm
For a list or `n` items, the algorithm always:
- Find the smallest item (**idea: write a `findSmallest` method**).
- Move it to the front.
- Selection sort the remaining N-1 items.

### Step1
**Test for `FindSmallest`:**
```js
public class TestSort {
   @Test
   public void testFindSmallest() {
       String[] input = {"rawr", "a", "zaza", "newway"};
       int expected = 1;
       int actual = Sort.findSmallest(input, 0);
       assertThat(actual).isEqualTo(expected);

       expected = 3;
       actual = Sort.findSmallest(input, 2);
       assertThat(actual).isEqualTo(expected);
   }
}

```

Method for `FindSmallest`:
```js
public class Sort {
   /** @source https://stackoverflow.com/questions/5153496 */
   public static int findSmallest(String[] x, int start) {
      int smallest = start;
      for (int i = start; i < x.length; i += 1) {
         int cmp = x[i].compareTo(x[smallest]);
         if (cmp < 0) {
            smallest = i;
         }
      }
      return smallest;
   }
}
```

### Step2
Test for swapping:
```js
public class TestSort {
   @Test
   public void testSwap() {
       String[] input = {"rawr", "a", "zaza", "newway"};
       String[] expected = {"rawr", "newway", "zaza", "a"};
       Sort.swap(input, 1, 3);
       assertThat(input).isEqualTo(expected);
   }
}

```
Method `swap`:
```js
public class Sort {
   public static void swap(String[] x, int a, int b) {
      String temp = x[a];
      x[a] = x[b];
      x[b] = temp;
   }
}
```
### Step3
Finally, the sorting method!
```js
public class Sort {
   public static void sort(String[] x) {
      sort(x, 0);
   }

   /** Sorts the array starting at index start. */
   // this is a helper!
   private static void sort(String[] x, int start) {
      if (start == x.length) {
         return;
      }
      int smallest = findSmallest(x, start);
      swap(x, start, smallest);
      sort(x, start + 1);
   }
}
```