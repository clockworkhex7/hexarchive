## Sep 10 / Summarizing Numerical Data
### 1. Rules To Summarize
**Include:**
- **<u>*Qualities*</u>** relevant to the question you’re answering;
- **<u>*Features*</u>** that are aligned with the interest of your audience.
**Omit:**
- Qualities that are **<u>*irrelevant*</u>****<u>*, distracting, or deceptive*</u>**;
- Replicated or **<u>*assumed information*</u>**.
### 2. Constructing Graphical Summaries
#### Dot Plot
Use **Dot Plot** to save the **desiderata**, a word meaning “that which is desired or needed”.
**PROS:**
- one-dimensional scatter plot. 
- Each observation shows up as a dot and its value corresponds to its location along the x-axis. 
**- All information is preserved**
- No information loss.
#### Histogram [NOT bar chart!]
A histogram involves **aggregation**. 
**STEP1:**
Divide the range of the variable into bins of equal size. 
**STEP2:**
Count up the number of observations that occur in each bin. 

In this way, some observations will <u>have their own bar (every bar with a count of one)</u> ;
but other observations will be <u>aggregated into the same bar</u>;
the **<u>tallest</u>** bar, with a count of 3, corresponds to all observations from 39.09 to 39.30: 39.1, 39.2, and 39.3.

**BINWIDTH:**
The degree of aggregation performed by the histogram is determined by the **<u>binwidth</u>**. 

**PROS:**
- graphical tool for summarizing the distribution of a numerical variable;
- Through your choice of binwidth, can determine how much to focus on.
#### Density Plots
Changes the **y-axis** to feature a quantity called “**density**”.(later)
The important information is <u>**relative**</u>: an area of the curve with **twice the density** = **twice the number of observations.**

**NOTE:**
- be sure to **experiment with different bandwidths** -- not to smooth!
#### Violin Plots
A simple **density curve reflected about its x-axis. **
This means that you can tinker with a violin plot the same as a density plot, but changing the bandwidth.
- Balance depiction of the **general characteristics of the distribution** with a **fidelity to the individual observations.**
- Allow for easy **comparisons** between groups.
#### Box Plot
### 3. Describing Distributions
Pay attention to **modality and skew**. 
The modality of a distribution <u>captures the number of distinct peaks (or modes) that are present.</u>

**<u>SKEWED DATA</u>**: use median;
**<u>NORMAL distribution</u>**: use mean or median;
**<u>Categorical data</u>**: use mode.

### 4. Constructing Numerical Summaries
Any numerical summary of a data set -- a mean or median, a count or proportion -- is a **statistic**. 
A statistic is, fundamentally, **a mathematical function** where the data is the input and the output is the observed statistic.
#### Measure of Center
**Mean**
> - Synthesizes the magnitudes of all n observations.
> - As close as possible to all of the observations.

```math
\bar x = \frac{x_1+x_2+...+x_n}{n}
```
```r
mean()
```
- Not so good when meets an **outlier**!
- 
**Median**
DEF: the 50% percentile!
> - Synthesize the order of all ``n`` observations.
> - As close as possible to all of the observations.
```r
median()
```
**Mode**
>  **Identical** to as many observations as possible.
```r
mode()
```
#### Measure of Spread
**Range**
```math
range = max - min
```
**Sample Variance**
- calculate mean ``\bar x``;
- takes difference of ``\bar x`` to each sample value ``x_i``;
- squares the diff;
- adds them all up;
- divides by ``n-1``;
- then finally, takes the square root.
```math
s^2 = \frac{1}{n-1} \sum_{i = 1}^{n} (x_i - \bar x)^2
```
**Standard Deviation**
```math
s = \sqrt{\frac{1}{n-1} \sum_{i = 1}^{n} (x_i - \bar x)^2}
```
```r
sd()
```
**IQR - Interquartile Range**
```r
IQR()
```
- Is robust to extreme values (outliers).
The IQR is the difference between the median of the larger half of the sorted data set, 
``Q_3``, and the median of the smaller half, ``Q_1``.
```math
IQR = Q_3 - Q_1
```
**MAD - Mean Absolute Deviation**
Similar to standard variance, but:
- we divide by ``n``rather than ``n-1``;
- we take the absolute value of ``x_i - \bar x`` instead of squaring it.
```math
MAD = \frac{1}{n} \sum_{i = 1}^{n} |x_i - \bar x|
```
### 5. Tutorial On R Studio
#### Step1: Start Up
Always import tools and data from:
```r
library(tidyverse)
library(stat20data)
library(dplyr)
```
#### Step2: Isolate Variable of Interest
 We can do this in code by using the `dplyr` function `select()` -- this is to **isolate a single column into a new dataset.**
 ```r
body_mass <- select(penguins, body_mass_g)
```
#### Step3: Implementing Functions
**<u>Case1: calculation on single column</u>**
Function `summarise()` may **<u>*access specific column*</u>** in a dataset, since columns are not vectors and connot be called `mean()` or `median()` on.
```r
summarise(body_mass, 
# first argument: dataset (we just created!)
          body_mass_median = median(body_mass_g),
          body_mass_IQR = IQR(body_mass_g)
          # name new columns to be put into a new dataset  
          )
```
**Case2: calculation on every group**
The `group_by()` function takes a variable from a dataset and group them by levels, putting into a **new set!**
```r
grouped_penguins <- group_by(penguins, species)
 #(dataset, variable)
```
Then `summarise()` into a new data frame:
```r
summarise(grouped_penguins, 
          bill_length_mean = mean(bill_length_mm),
          bill_length_sd = sd(bill_length_mm))
```
#### Step4 Plotting with Categorical Values
By default, violin plot puts the level first in the <u>alphabetical order</u> on the bottom of the plot.
Use `factor()` to re-order!
Since columns cannot be factored as vectors,  we use the `dplyr` function `mutate()`. 
A mutation involves <u>changing the properties of an existing column, or adding a new one altogether </u>.
似乎是只改变顺序，但是不改变col/vec的性质！
```r
reordered_penguins <- 
  mutate(penguins, 
            # dataframe
  species = 
  # existing or new column
    factor(species, levels = c("Gentoo", "Chinstrap", "Adelie")))
```
