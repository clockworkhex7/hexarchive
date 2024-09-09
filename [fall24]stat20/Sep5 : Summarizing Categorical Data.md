## Sep 5 / Summarizing Categorical Data
### 1. Contingency Table
> Count up the number of penguins that appeared in every combination of levels and lay them out in a table.
### 2. Bar Chart
The **stacked bar chart** puts one of the variables along the x-axis (the species) and <u>fills up the y-axis according to the counts</u> in each level of the other variable (the island); succeeds in <u>highlighting the total number of Adelie penguins</u>.
The **side-by-side bar chart** is similar, but unstacks the “Adelie” bar to <u>put the three islands besides one another</u>;easier to see at a glance <u>the relative sizes</u>.
### 3. From Counts to Proportions
#### Joint Proportion
The proportion of observations of multiple variables that appear in a combination of levels of those variables.
> single / all
#### Marginal Proportion
The proportion of observations in one variable that appear in a single level of that variable.
> sum of one type / all
#### Conditional Proportion
The proportion of observations in one level of one variable that appear in a level of a second variable.
> feature a / feature b
### 4. Identifying an association
There is an association between two categorical variables if the conditional proportions vary as you move from one one level of the conditioning variable to the next.
### 5. Tutorial on R Studio
#### help
```r
?<your function>
```
#### Mean
Use a single **unnamed** argument:
```r
my_fav_numbers <- c(9, 11, 19, 28)
mean(my_fav_numbers)
```
**Named** argument:
```r
mean(x = my_fav_numbers)
```
`trim` from lower and upper end:
```r
mean(my_fav_numbers, .25)
mean(x = my_fav_numbers, trim = .25)
```
#### Libraries
Any installed library can be loaded with the `library()` function. 
```r
library(tidyverse)
```
#### Add data
Using the named `data` function.
```r
data(penguins)
```
### 6. Visualization with `ggplot2`
> **ggplot**
- `data` = a data frame
- `mapping` = horizontal axis / aesthetic attribute of the plot
> **aesthetic**
- `aes()`
- horizontal axis `x`
- `fill` = coloring according to variables
> **geom bar**
- `geom()`
- add to new layer by `+`
- `position` == `"fill"` to normalize; `nothing`to stack graph
```r
> library(stat20data)
> library(tidyverse)
ggplot(data = penguins, 
       mapping = aes(x = species, 
                     fill = island)) +
  geom_bar(position = "fill")
```
### 7. Some Tools
```r
> colnames(class_survey)
# get column names

> head(class_survey$year)
# first six of "year" title
 
> library(dplyr)
> glimpse(class_survey)
# get glimpse of data
```
