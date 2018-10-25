---
title       : Data Analysis with R
subtitle    : 13 - Intro2Statistical Modelling - Part 2
author      : Saskia A. Otto
job         : Postdoctoral Researcher
framework   : io2012        
highlighter : highlight.js 
hitheme     : sao_theme     
widgets     : [mathjax, quiz, bootstrap, interactive] 
mode        : selfcontained 
knit        : slidify::knit2slides
logo        : uham_logo.png
biglogo     : BigLogo_MDS.png
assets      : {assets: ../../assets}
--- &slide_no_footer .segue bg:#1874CD





# Model assumption
<img src="img/Data_science_1c.png" style="height:150px;border:0;position: absolute; left: 900px; top: 50px" </img> 

--- 
## Assumptions of linear regression models

1. Independence (most important!)
2. Homogeneity / homogenous variances (2nd most important)
3. Normality / normal error distribution 
4. Linearity 

--- &twocol
## Assumptions of linear regression models

1. **Independence** (most important!)
2. Homogeneity / homogenous variances (2nd most important)
3. Normality / normal error distribution 
4. Linearity 

*** =left
<div class="boxorange1" style="margin-left: auto; margin-right: auto;">
    <h3>Independence assumption</h3>
    <p style="line-height: 140%">
    - Dependence inflates p-values<br>
    - Dependence you can "smell"<br>
    - Dependence due to model misfit<br>
    - Temporal or spational dependence<br>
    - df incorrect (number of independent components) 
    </p>
</div>

*** =right


<img src="lecture13_plotting_files/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" width="504" style="display: block; margin: auto;" />

--- &twocol
## Assumptions of linear regression models

1. Independence (most important!)
2. **Homogeneity** / homogenous variances (2nd most important)
3. Normality / normal error distribution 
4. Linearity 

*** =left
<div class="boxorange1" style="margin-left: auto; margin-right: auto;">
  <h3>Homogeneity</h3>
    <p style="line-height: 140%">
    → The variance in Y is constant (i.e. the variance does not change as Y gets bigger/smaller). <br>
    → Only one variance has to be estimated and not one for every X value.<br>
    → Also the multiple residuals for every X are expected to be homogeneous.
    </p></div>
    
    
*** =right


<img src="lecture13_plotting_files/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" width="504" style="display: block; margin: auto;" />

<kbd>p</kbd>

*** =pnotes
To avoid estimating a variance component for every X value, we assume the variance for all X values is the same. This is called the homogeneity assumption. This is important and implies that the spread of all possible values of the population is the same for every value of X. 

---
## Check: outlier / influential observations

### Leverage / Cook‘s distance ⇒ step of model validation

- **Leverage**: tool that identifies observations that have rather extreme values for the explanatory variables and may potentially bias the regression results
- **Cook's distance statistic**: measure for influential points → identifies single observations that are influential on all regression parameters: it calculates a test statistic D that measures the change in all regression parameters when omitting an observation.
  - D > 0.5 considered as too influential
  - D > 1: very critical
- It is easier to justify **omitting influential points** if they have both, *large Cook* and *large leverage values*.

---
### Leverage / Cook‘s distance ⇒ step of model validation

<div class="img-with-text" style="position: absolute; left: 200px; top: 150px; z-index:100">
    <img src="img/Leverage_CooksD.png" alt="" width=700px height=500px/>
 <p><span class="source-img" style = "float:right">Adapted from: 
    <a href='http://highstat.com/index.php/analysing-ecological-data' title=''>Zuur et al. (2007)</a></span></p>
</div>

<kbd>p</kbd>

*** =pnotes
Applying a regression analysis with and without point B gives similar results, showing that B might have a high leverage, but it is not influential on the regression parameters.


--- --- &twocol
## Standard graphical output for model validation
### Lets use the salinity ~ depth example from lecture 12:

<small>(taken from the ICES hydro dataset, station 0076, 2015-02-01)</small>


*** =left

```r
par(mfrow = c(2,2))
plot(mod) 
```

<div class="boxgreen1">
  <h3><em>par()</em> sets plotting parameters.</h3>
  <p> The <em>mfrow</em> argument creates a multi-paneled plot; first argument in the vector specifies the number of rows and the second the number of columns of plots.</p>
</div>


--- &mytwocol2
## Standard graphical output for model validation
### Lets use the salinity ~ depth example:



*** =left

```r
par(mfrow = c(2,2))
plot(mod) 
```

*** =right
<img src="img/Interpret_diag_plots.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="550px" style="display: block; margin: auto;" />


--- &mytwocol2
## Standard graphical output for model validation

### Lets use the salinity ~ depth example:

*** =left

```r
par(mfrow = c(2,2))
plot(mod) 
```


<p style="position: absolute; left: 380px; top: 150px; font-size: 15px; background-color:#98F5FF;">$\epsilon$ seems slightly correlated with Y</p>

<p style="position: absolute; left: 900px; top: 225px; background-color:#98F5FF; font-size: 15px;">$\epsilon$ ~ N</p>

<p style="position: absolute; left: 600px; top: 400px; font-size: 15px; background-color:#98F5FF;">No outlier or too influential data point</p>

    
*** =right
<img src="lecture13_plotting_files/unnamed-chunk-10-1.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" width="504" style="display: block; margin: auto auto auto 0;" />

---
## Ordinary vs. standardized residuals 

- Ordinary residuals: observed – fitted value
- Standardized residuals = the residual divided by its standard deviation:
  $$e_{stand.} = \frac{e_{i}}{\sqrt{MS_{Residual}*(1-h_{i})}}$$  
  - where $e_{i}$ = observed - fitted value; $h_{i}$ = leverage for observation *i*; $MS_{Residual}$ represents the residual variance → more on this later
- Standardised residuals are assumed to be normally distributed with expectation 0 and variance 1; N(0,1).
- Consequently, **large residual values (>2)** indicate a **poor fit** of the regression model.

---
## Compute residuals in R

You can compute both types of residuals using

- `residuals(model)` (works too: `resid()`) from the *stats* package → returns a vector with the **ordinary** residuals
- `rstandard(model)` from the *stats* package → returns a vector with the **standardized** residuals

- `add_residuals(data, model, var = "resid")` from the *modelr* package (in tidyverse) →  adds the variable 'resid' containing the **ordinary** residuals to your data frame; useful when piping operations!

---
## Additional graphics for model validation



<img src="img/Add_diagnostic_plots.png" title="plot of chunk unnamed-chunk-12" alt="plot of chunk unnamed-chunk-12" width="1100px" style="display: block; margin: auto;" />


--- &slide_no_footer .segue bg:#EEC900

# Your turn...

--- &exercise

# Quiz: Identify violated assumptions or outliers

Load the 4 datasets into your workspace: assumptions1.txt, assumptions2.txt, assumptions3.txt,  assumptions4.txt


```r
df <- read_delim("data/assumptions1.txt")
str(df)
```

Regress each **y** variables against **x** in the same dataset using the `lm` function and inspect the 4 diagnostic plots per model.

```r
par(mfrow = c(2,2))
plot(your_lin_model)
```

Each of the 4 models will have outliers or assumptions that are not met. Find these and try to find a solution! How do the summary outputs change?


--- &slide_no_footer .segue bg:#1874CD

# Coming back to the EDA cycle ...
<img src="img/Data_science_1d.png" style="height:150px;border:0;position: absolute; left: 900px; top: 50px" </img> 


--- &vcenter

<div class="img-with-text" style="position: absolute; left: 50px; top: 100px; z-index:100">
    <img src="img/EDA_loop_understand.png" alt="" width=1000px/>
 <p><span class="source-img" style = "float:right">source flowchart:
    <a href='http://r4ds.had.co.nz/wrangle-intro.html' title=''>R for Data Science</a> by Wickam & Grolemund, 2017 (licensed under <a href='https://creativecommons.org/licenses/by-nc-nd/3.0/us/' title=''>CC-BY-NC-ND 3.0 US</a>)</span></p>
</div>






--- &slide_no_footer .segue bg:url(img/EDA_CPUE_loop_1.png);background-size:cover

--- &slide_no_footer .segue bg:url(img/EDA_CPUE_loop_2.png);background-size:cover

--- &slide_no_footer .segue bg:url(img/EDA_CPUE_loop_3.png);background-size:cover

--- &slide_no_footer .segue bg:url(img/EDA_CPUE_loop_4.png);background-size:cover

--- &slide_no_footer .segue bg:url(img/EDA_CPUE_loop_5.png);background-size:cover

--- &slide_no_footer .segue bg:url(img/EDA_CPUE_loop_6.png);background-size:cover

--- &slide_no_footer .segue bg:url(img/EDA_CPUE_loop_7.png);background-size:cover

--- &slide_no_footer .segue bg:url(img/EDA_CPUE_loop_8.png);background-size:cover

--- &slide_no_footer .segue bg:url(img/EDA_CPUE_loop_9.png);background-size:cover

--- &slide_no_footer .segue bg:url(img/EDA_CPUE_loop_10.png);background-size:cover

--- &slide_no_footer .segue bg:url(img/EDA_CPUE_loop_11.png);background-size:cover

--- &slide_no_footer .segue bg:url(img/EDA_CPUE_loop_12.png);background-size:cover

--- &slide_no_footer .segue bg:url(img/EDA_CPUE_loop_13.png);background-size:cover

--- &slide_no_footer .segue bg:url(img/EDA_CPUE_loop_14.png);background-size:cover

--- &slide_no_footer .segue bg:#EEC900

# Your turn...


--- &exercise
# Try it out yourself:

**Can you find a latitudinal or longitudinal gradient in cod CPUE during the first quarter in 2015?**

In this exercise, you can apply yourself what has been outlined in the EDA cycle: Follow up on the exercise from lecture 10, in which we tried to identify visually whether the CPUE differs between areas. Now you will explore visually but also statistically, whether the observed differences follow a specific pattern: Does the CPUE increase or decrease with latitude or longitude?

--- &exercise
# Apply the following steps. If you need some guidance, look at the next slides.

1. Load the dataset "data/cod_2015_q1.R", which contains the data frame `cod15`
2. Add coordinates of the area to the dataset → for more info press 'p'
3. Visualize the relationship between CPUE and Lat/Long
4. Apply linear models and inspect the model diagnostic plots
5. Create histograms of each model residuals
6. Highlight the age group in your scatterplot from step 3 (e.g. colour points by age) → which age group deviates greatest?

<kbd>p</kbd>

*** =pnotes
**For step 2**:   
To get the latitude and longitude for each area

1. search the internet for a map that shows the ICES subdivisions (SD) for the Baltic Sea and estimate the central coordinates for each SD (= area),
2. create a tibble that contains the `Area` variable as well as the respective `Lat` and `Long` values and than 
3. merge this tibble into the `cod15` tibble using a `join` function from the dplyr package

--- 
## 1. Data loading

Load the following dataset, which is a subset of the full CPUE dataset ("CPUE per age per area_2017-11-20 06_48_16.csv") we used already in lecture 10:



```r
load("data/cod_2015_q1.R")
ls()
```

```no-highlight
## [1] "cod15"
```

<kbd>p</kbd>

*** =pnotes
If you want to know how this dataset was subsetted from the full CPUE dataset:
```
cpue <- read_csv(
  "data/CPUE per age per area_2017-11-2006_48_16.csv")
cod15 <- cpue %>% 
  mutate(Area = factor(Area, levels = c(21,22,
    23,24,25,26,27,28,29,30,31,32))) %>%
  filter(Year == 2015, Quarter == 1, 
    Species == "Gadus morhua") %>%
  select(Area, contains("Age")) %>%
  gather(key = "Age", value = "CPUE", Age_0:Age_10) %>%
  mutate(Age = factor(Age, levels = paste0("Age_", 0:10),
    labels = as.character(0:10))) 
```    

---
## 2. Adding coordinates

To get the latitude and longitude for each area

1. search the internet for a map that shows the ICES subdivisions (SD) for the Baltic Sea and estimate the central coordinates for each SD (= area),
2. create a tibble that contains the `Area` variable as well as the respective `Lat` and `Long` values and than 
3. merge this tibble into the `cod15` tibble using a `join` function from the dplyr package


---
## 2. Adding coordinates (cont)

Here are some rough approximations of the central coordinates of each area:

```r
sd_coord <- tibble(
  Area = factor(c(21,22,23,24,25,26,27,28,29,30,31,32)),
  Lat = c(57,55,55.75,55,55.5,55.5,58,57.5,59.5,62,64.75,60),
  Long = c(11.5,11,12.5,13.5,16,19.5,18,20,21,19.5,22.5,26)
  )
```

--- &twocol
## 2. Adding coordinates (cont)

The merging can be done using the `left_join()` function from `dpylr`:   

*** =left

```r
cod15 <- left_join(cod15, sd_coord, 
  by = "Area") %>% print(n = 5)
```

```no-highlight
## # A tibble: 88 x 5
##   Area  Age    CPUE   Lat  Long
##   <fct> <fct> <dbl> <dbl> <dbl>
## 1 21    0         0  57    11.5
## 2 22    0         0  55    11  
## 3 23    0         0  55.8  12.5
## 4 24    0         0  55    13.5
## 5 25    0         0  55.5  16  
## # ... with 83 more rows
```

*** =right
<div class="boxorange1">
  <h3>left_join()</code></h3>
  <p>This function returns all rows from the left table (1st table listed in the function), and all columns from both tables. Alternative functions: <code>right_join(), inner_join(), full_join()</code></p>
</div>
    


--- &twocol
## 3. Visualize the relationship between CPUE and Lat/Long

*** =left

```r
p_lat <- cod15 %>% 
  ggplot(aes(x = Lat, y = CPUE)) +
  geom_point() +
  geom_smooth(method="lm", se=F)

p_long <- cod15 %>% 
  ggplot(aes(x = Long, y = CPUE)) +
  geom_point() +
  geom_smooth(method="lm", se=F)

grid.arrange(p_lat, p_long, nrow = 2)
```
 
*** =right
<img src="lecture13_plotting_files/unnamed-chunk-21-1.png" title="plot of chunk unnamed-chunk-21" alt="plot of chunk unnamed-chunk-21" width="360" />

--- &mytwocol2
## 4. Apply the linear statistical models and inspect the model diagnostic plots


```r
m_lat <- lm(formula = CPUE ~ Lat, data = cod15)
m_long <- lm(formula = CPUE ~ Long, data = cod15)
```

*** =left

```r
par(mfrow = c(2,4))
plot(m_lat)
plot(m_long)
```

--- &mytwocol2
## 4. Apply the linear statistical models and inspect the model diagnostic plots


```r
m_lat <- lm(formula = CPUE ~ Lat, data = cod15)
m_long <- lm(formula = CPUE ~ Long, data = cod15)
```

*** =left

```r
par(mfrow = c(2,4))
plot(m_lat)
plot(m_long)
```
What do you think about the residual distributions? Any outlier?

*** =right
<img src="lecture13_plotting_files/unnamed-chunk-26-1.png" title="plot of chunk unnamed-chunk-26" alt="plot of chunk unnamed-chunk-26" width="576" />

--- &mytwocol2
## 4. Apply the linear statistical models and inspect the model diagnostic plots


```r
m_lat <- lm(formula = CPUE ~ Lat, data = cod15)
m_long <- lm(formula = CPUE ~ Long, data = cod15)
```

*** =left

```r
par(mfrow = c(2,4))
plot(m_lat)
plot(m_long)
```
What do you think about the residual distributions? Any outlier?
<div class="alert alert-orange">No outlier, but strong violation of normality and homogeneity assumptions</div>

*** =right
<img src="lecture13_plotting_files/unnamed-chunk-29-1.png" title="plot of chunk unnamed-chunk-29" alt="plot of chunk unnamed-chunk-29" width="576" />

--- &twocol
## 5. Create histograms of the model residuals 

Compute the residuals and generate histograms for both models


```r
cod15 <- cod15 %>% 
  add_residuals(model = m_lat, var = "Res_lat") %>% 
  add_residuals(model = m_long, var = "Res_long")
```

*** =left

```r
p_lat <- cod15 %>% 
  ggplot(aes(x = Res_lat)) +
  geom_histogram(binwidth = 5) +
  geom_vline(xintercept = 0, 
    colour = "blue", size = 0.5)
p_long <- cod15 %>% 
  ggplot(aes(x = Res_lat)) +
  geom_histogram(binwidth = 5) +
  geom_vline(xintercept = 0, 
    colour = "blue", size = 0.5)
grid.arrange(p_lat, p_long, nrow = 2)
```

*** =right
<img src="lecture13_plotting_files/unnamed-chunk-32-1.png" title="plot of chunk unnamed-chunk-32" alt="plot of chunk unnamed-chunk-32" width="360" />
<div class="alert alert-orange" style="position: absolute; left: 550px; top: 600px">Both residual distributions are highly right-skewed, meaning there are many values that slightly deviate from 0 and a few that deviate greatly!</div>


--- bg:#EEC900
<q> One should stop here, in fact, as the model assumptions are violated, and do something such as transforming the data or excluding age groups. This will be discussed in the next lecture.</q>

--- &twocol
## 6. Which age group deviates greatest from the prediction?

Lets visualize again the relationship between CPUE and Lat/Long but this time colour the data points by the age groups and plot the predictions manually.

*** =left

```r
p_lat <- cod15 %>% 
  add_predictions(m_lat, "Pred") %>%
  ggplot(aes(x = Lat)) +
  geom_point(aes(y = CPUE, colour = Age)) +
  geom_line(aes(y = Pred)) 

p_long <- cod15 %>% 
  add_predictions(m_long, "Pred") %>%
  ggplot(aes(x = Long)) +
  geom_point(aes(y = CPUE, colour = Age)) +
  geom_line(aes(y = Pred)) +
  guides(colour = "none")

grid.arrange(p_lat, p_long, nrow = 2)
```
 
*** =right
<img src="lecture13_plotting_files/unnamed-chunk-34-1.png" title="plot of chunk unnamed-chunk-34" alt="plot of chunk unnamed-chunk-34" width="432" />


--- &slide_no_footer .segue bg:#E5E5E5

## Overview of functions you learned today

`par()` for setting global graphical parameters 

linear regression model: `plot(model)`, `residuals()`, `resid()`, `rstandard(model)`, `modelr::add_residuals(data)`

joining tables: `dplyr::left_join()`

--- &slide_no_footer .segue bg:#CD2626

# How do you feel now.....?

--- 

## Totally confused?
                
<img src="img/Comic_confused.png" title="plot of chunk unnamed-chunk-35" alt="plot of chunk unnamed-chunk-35" width="200px" style="display: block; margin: auto;" />

Try out the exercises and read up on linear regressions in
- [chapter 23] (http://r4ds.had.co.nz/model-basics.html) on model basics in 'R for Data Science'
- chapter 10 (linear regressions) in "The R book" (Crawley, 2013, 2nd edition) (an online pdf version is freely available [here](https://www.cs.upc.edu/~robert/teaching/estadistica/TheRBook.pdf))
- or any other textbook on linear regressions


--- &vcenter

## Totally bored?
                
<img src="img/Comic_bored.png" title="plot of chunk unnamed-chunk-36" alt="plot of chunk unnamed-chunk-36" width="800px" style="display: block; margin: auto auto auto 0;" />

Think of solutions for the CPUE ~ Lat/Long model and compare the model results.

---

## Totally content?
Then go grab a coffee, lean back and enjoy the rest of the day...!

<img src="img/Comic_hammock.png" title="plot of chunk unnamed-chunk-37" alt="plot of chunk unnamed-chunk-37" width="600px" style="display: block; margin: auto;" />



--- &thankyou
