## Sep 17 / Conditioning

### 1. Filtering
#### Select()
One way is to go at it is **column-by-column**. 
The act of selecting a subset of the columns of a data frame is called, well, selecting. 
```r
select()
```
When you `select` a column, you can do so either by its `name` or by its `column number (or index)`. 
Selecting columns by name is more useful because their order tends to be arbitrary and might change over the course of an analysis.
把一列当成一行！
 ```r
body_mass <- select(penguins, body_mass_g)
```
#### Slice()
The other way to go at it is **row-by-row**.
The act of subsetting the rows of the data frame based on their row number is called `slice()`.
As with columns, the order of the rows is also often arbitrary, so this is of limited use. Much more useful is filtering.
### Filtering
```r
new = filter(msleep, name == "Little brown bat")
```
新建一个dataframe，只包含所有`name == "Little brown bat"`。

**Comparison Operator**

| Operator | Translation |
|---|---|
| `==` | equal to |
| `!=` | not equal to |
| `<` | less than |
| `>` | greater than |
| `<=` | less than or equal to |
| `>=` | greater than or equal to |

More cases, we return rows with large animals...
```r
filter(msleep, log_bodywt > 12)
```
**Logical Operator**
| Operator | Translation |
|---|---|
| `&` | and |
| `｜` | or |
| `%in%` | range |

Eg. 
```r
filter(msleep, name %in% c("Little brown bat", "African elephant"))
```
### 2. Data Pipelines
`arrange()` in descending order of weight:
```r
msleep_large <- filter(msleep, log_bodywt > 12)
arrange(msleep_large, desc(log_bodywt))
```
Using "the pipe":
|`>`: If you have two functions, `f1` and `f2`, both of which take a data frame as the first argument, you can pipe the output of `f1` directly into `f2` using.
```r
f1(data frame)  |> f2()
```
Eg. 
```r
filter(msleep, log_bodywt > 12) |> arrange(desc(log_bodywt))
```
`arrange` in this case, directly uses the datafram output of `filter` funtion.

Another Eg.
```r
library(stat20data)

arbuthnot |>
    mutate(total = boys + girls) |>
    arrange(desc(total)) |>
    select(year, total)
```
