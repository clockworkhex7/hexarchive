## Sep 19 / Summarizing Numerical Associations
### 1. Association
There is an **association** between two variables if the **conditional distribution of one varies** as you move across values of the other.
### 2. Correlation Coefficient
- ranges from 0 to 1
- measures the **strength** and **direction** of the linear relationship between two variables
```math
r = \frac{1}{n-1}\sum_{n}^{i = 1} (\frac{x_i - \bar x}{s_x})(\frac{y_i - \bar y}{s_y})
```
In R language:
```r
cor()
```
> ``n`` is the <u>number</u> of data points.
> ``x_i`` and ``y_i`` are the <u>individual</u> data points for variables
> ``\bar x`` and ``\bar y`` are the <u>means</u> (averages)
> ``s_x`` and ``x_y`` are the <u>standard deviations</u>


| Absolute ``r`` value | Strength of Relationship |
|---|---|
| ``r`` < 0.3 | None / Very Weak |
| 0.3 < ``r`` < 0.5 | Weak |
| 0.5 < ``r`` < 0.7 | Moderate |
| ``r`` > 0.7 | Strong |

May use summarize to calculate:
```r
poverty |>
  summarize(r = cor(Poverty, Graduates))
```
### 3. The Simple Linear Model
```math
\hat y = b_0 + b_1x
```

### 4. The Least Square Lines
#### Least Squares Slope
```math
b_1 = r \frac{s_y}{s_x}
```
#### Least Squares Intercept
```math
b_0 = \bar y - b_1 \bar x
```
#### In R language
```r
lm(y ~ x, data = my_df)
```
### 5. Residuals
 That gap between expectation and reality is called a **residual**;
 The difference between the **observed value of a data point**, ``y_i``
, and the value that we would **expect according to a linear model**, 
``\hat y_i``.
```math
\hat e = y_i - \hat y_i
```
