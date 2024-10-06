## Oct 2 / Multiple Linear Regression
On top of single best fit line denoted by ``\hat y = 96.2 + 0.89x``,
we look at more complicated model.
### 1. Definitions
**Linear Model**: A linear model is any model that explains the ``y`` as a linear function of the ``x``.
**x**: explanatory variable or <u>independent</u> variable.
**y**: response variable or <u>dependent</u> variable.
**method of least squares**: finding best fit lines.
**regression model**: general best fit curves.

### 2. Multiple Linear Regression
A method of explaining a **continuous numerical y variable** in terms of a linear function of **x explanatory terms**, ``x_i``.
```math
\hat y = b_0 + b_1x_1+b_2x_2+...+b_px_p
```
In R coding, we use:
```R
lm(y_vari ~ x1var+x2var, data = my_df)
```
#### 2 * numerical + 1 * categorical
dataframe: `zagat`;
numerical y-variable: `price`;
numerical x-variable: `food`;
categorical x-variable: `geo`

We can form our code:
```R
lm(formula = price ~ food + geo, data = zagat)
```
**DUMMY VARIABLE**
Def: A variable that is **1** if an observation takes a particular level of a categorical variable and **0** otherwise.
Use `mutate` function to achieve.
EG：如果有3个species，只需要创造``3-1=2``个dummy，
B: [1 0]
C: [0 1]
A: [0 0]
如果dummy1=1， 则为B；
dummuy2=1，则为C；
dummy1，dummy2都是0，则是A ——所以永远只需要n-1个dummy！
intercept也算一个coefficient。
```r
m1 <- lm(bill_depth_mm ~ bill_length_mm, data = penguins)
m2 <- lm(bill_depth_mm ~ bill_length_mm + body_mass_g + species, 
         data = penguins)
```
m1有2个coefficient；m2有5个。


**ORDERING**
Normally, if you don't select level, R will etermine the “order” of levels in a categorical variable registered as a `character` by way of the alphabet.
Use `level` for preference!
```R
lm(formula = price ~ food + geo, 
        data = mutate(zagat, 
            geo = factor(geo,levels = c("west", "east"))))
```
#### 3 * Numerical
We use **3D-Graphs!**
Eg.
```R
lm(formula = price ~ food + decor,
    data = zagat)
```