## Sep 12 / Graphics[1]
### 1. Grammar of Graphics
In **Wickham’s** adaptation of the grammar of graphics, a plot can be decomposed into three primary elements:
* the data,
* the aesthetic mapping of the variables in the data to visual cues, and
* the geometry used to encode the observations on the plot.
### 2. Data
To construct a diagram like this:
![](assets/17261115455802.jpg)
![17261090837721](assets/17261090837721.jpg)
We need at least three types of variables, bill_length, bill_depth, species.
That is, three columns of a data frame that we need to have on hand.
### 3. Aesthetics
By the diagram above, the penguin plot relies upon three forms of visual variation:
- The first is the **location along the x-axis.** 
- Penguins with **longer** bills are placed on the **right** side of the plot and those with **shorter** bills are placed on the **left**. 
- Variation in **bill depth** is captured by variation in the location along the **y-axis**, which is the second form. 
- The **third form is color**: each of the three species is designated by one of three **colors**.

In a word,
* `bill_length_mm` is mapped to the x-axis;
* `bill_depth_mm` is mapped to the y-axis;
* `species` is mapped to color.

**Aesthetics Attributes!**
`x`: location along the x-axis
`y`: location along the y-axis
`color`: hue of the mark that represents the observation
`alpha`: the level of transparency of the color
`size`: the size of the mark representing the observation
`shape`: the shape of the mark representing the observation
`fill`: the color of the inside of the representation of an observation

### 4. Geometrics
The final choice in making our plot is to decide how to graphically express the observations themselves. 
**Types!**
`point`
`bar`
`line`
`histogram`
`density`
`violin`
`dotplot`
`boxplot`

### 5. Tutorial on R Studio
**画布：**
```r
ggplot(penguins, 
            aes(x = bill_length_mm,
                    y = bill_depth_mm，
                    # x and y axis
                    color = species
                     # coloring the third variable, species))
```
**点图**：
`+ geom_point()`

**Beautiful!**
![](assets/17261115455802.jpg)


**Sometimes...**
To have a special color representing two variables on x and y axis,
may use:
```r
ggplot(penguins, aes(x = bill_length_mm,
                     y = bill_depth_mm)) +
    geom_point(color = "blue", size = 3, alpha = 0.5)
    # change color setting, size and opacity
```

**Labels for Clarity**
```r
labs(x = "Bill Length (mm)",
         y = "Bill Depth (mm)",
         title = "Bill length and bill depth positively correlated and\n strongly dependent on species",
         caption = "Source: Data collected by Dr. Kristen Gorman at Palmer Station, Antarctica")
```

**Choosing a Theme**
```r
theme_excel()
```