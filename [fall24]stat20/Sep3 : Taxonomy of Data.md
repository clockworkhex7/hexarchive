## Sep 3 / The Taxonomy of Data
### 1. Data
An item of (chiefly numerical) information, name, number, picture…
### 2. Variable
A characteristic of an object or observational unit that can be measured and recorded.

#### - Numerical Value
DEF. take numbers as values and magnitude of the number has a quantitative meaning.
- **<u>Continuous Numerical Value</u>**: A numerical variable that takes values on an interval of the real number line.(eg. rounding temperature)
- **<u>Discrete Numerical Value</u>**: A numerical variable that takes values that have jumps between them.(eg. population cannot have 0.5 people)
#### - Categorical Value
DEF. take categories as values. Each unique category is called a level (eg.name)
- **<u>Ordinal Categorical Value</u>**: A categorical variable with levels that have a natural ordering. (eg. survey agree to disagree)
- **<u>Nominal Categorical Value</u>**: A categorical variable with levels with no 	ordering. (eg. name has no order)
### 3. Tutorial on R Studio
R: Language in DS;
R Studio: writing and running code through;
#### Save Objects
Add an assignment arrow `<-` and a name.
```r
answer <- 2 ^ (3 + 1)
```
![](assets/17253874658970.jpg)
**NOTE!!** No output is returned at the console.
#### Vectors
Store **multiple values** by putting inside `c()` separated by commas.
```s
my_fav_numbers <- c(9, 11, 19, 28)
```
The object `my_fav_numbers` is called a **vector**.
Vectors can store different types of data.
<u>Eg. strings</u>
```r
my_fav_colors <- c("green", "orange", "purple")
```
#### Functions
-> Mean / sqrt / log
```r
mean(my_fav_numbers)
sqrt(my_fav_numbers)
log(my_fav_numbers)
```
#### Penguins!
Store multiple observations into `bill_length_mm`.
```r
bill_length_mm <- c(50.7, 48.5, 52.8,
 44.5, 42.0, 46.9, 50.2, 37.9)
```
#### Check Class Types
Check vectors' class using the `class()` function.
1. Numeric Vectors: Numbers as data.
```r
class(my_fav_numbers)
[1] "numeric"
```
2. Character Vectors: Store text as data.
```r
class(my_fav_colors)
[1] "character"
``` 
3. Factor: Shows the possible values that this vector can take.
```r
char_vec <- c("cat", "cat", "dog")
fac <- factor(char_vec)
fac
[1] cat cat dog
Levels: cat dog
```
To specify preference order, 
```r
ordered_fac <- factor(char_vec,
levels = c("dog", "cat"))
```
or
```r
ordered_fac <- factor(char_vec, ordered = TRUE)
```
#### Data Frames
So far, the data we collected:
```r
bill_length_mm <- c(50.7, 48.5, 52.8, 
44.5, 42.0, 46.9, 50.2, 37.9)
bill_depth_mm <- c(19.7, 15.0, 20.0, 
15.7, 20.2, 16.6, 18.7, 18.6)
species <- factor(c("Chinstrap", "Gentoo", 
"Chinstrap", "Gentoo", "Adelie",
 "Chinstrap", "Chinstrap", "Adelie"))
```
Create **Data Frame**, staple them together with data.frame().
```r
penguins_df <- data.frame(bill_length_mm, 
bill_depth_mm, species)
```
![](assets/17253884369028.jpg)
### Big example for review
```r
students = data.frame(
  "name" = c("Leia", "Luke", "Han", "Lando"),
  "height" = c(160, 170, 182, 178),
  "year" = factor(x = c("sophomore", "freshman", "senior", "junior"),
                  levels = c("freshman", "sophomore", "junior", "senior")),
  "resident" = c(TRUE, FALSE, TRUE, FALSE)
)
```