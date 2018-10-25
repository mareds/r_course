---
title       : Data Analysis with R
subtitle    : 17 - Functions and Iteration 1 (Loops)
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





# Functions
<img src="img/Data_science_1a.png" style="height:150px;border:0;position: absolute; left: 900px; top: 50px" </img> 

---
## Functions are the core of reproducible research

- Help you to structure your work.
  - Reading in data
  - Data processing
  - Visualisation
- Divide complex problems into small "simple" units.
- Re-use your functions whenever you need them!
- Share your work with others!

--- &vcenter
## Function components



<img src="img/Function_components.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" width="900px" style="display: block; margin: auto;" />


---
## Lexical scoping

Scoping is the set of rules that govern how R looks up the value of a symbol. 


```r
x <- 10 
x 
```

```no-highlight
## [1] 10
```
<div class="alert alert-orange" style="position: absolute; left: 240px; top: 240px">
  How does R know that x equals 10 ? </div>

### Principles of Lexical Scoping

1. Name masking
2. Functions vs. variables
3. A fresh start
4. Dynamic lookup

--- &twocol
## 1. Name masking

*** =left

```r
f <- function() { 
  x <- 2 
  y <- 3 
  x * y
}

f()
```

```no-highlight
## [1] 6
```

- <span style="color:green;"> value for <b>x</b> found in f</span>
- <span style="color:green;"> value for <b>y</b> found in f</span>

*** =right

```r
x <- 2 
g <- function() { 
  y <- 3 
  x + y
}

g()
```

```no-highlight
## [1] 5
```
- <span style="color:red;"> value for <b>x NOT</b> found in f</span>
  - check global environment → <span style="color:green;"> value for <b>x</b> found</span>
- <span style="color:green;"> value for <b>y</b> found in f</span>

--- &vcenter
## 1. Name masking - Nested functions

<img src="img/Function_name_masking_1.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" width="800px" style="display: block; margin: auto;" />

--- &vcenter
## 1. Name masking - Nested functions

<img src="img/Function_name_masking_2.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" width="800px" style="display: block; margin: auto;" />


--- &twocol
## 1. Name masking - Variables exist locally


```r
add_one <- function(x) { 
  add_this <- 1
  x + add_this
}

add_one(5) 
```

```no-highlight
## [1] 6
```

```r
add_this
```

```
## Error in eval(expr, envir, enclos): object 'add_this' not found
```

*** =left
<img src="img/Function_add_one.png" title="plot of chunk unnamed-chunk-9" alt="plot of chunk unnamed-chunk-9" style="display: block; margin: auto;" />

*** =right

- `x` and `add_this` are not present in the global environment
- they **exist locally** in `add_one()`

--- &vcenter
## 2. Functions vs. variables

<img src="img/Function_vs_variable_1.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" width="700px" style="display: block; margin: auto;" />

--- &vcenter
## 2. Functions vs. variables

<img src="img/Function_vs_variable_2.png" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" width="700px" style="display: block; margin: auto;" />

---
## 2. Functions vs. variables - Exception


```r
n <- function(x) {
  x / 2
}
 
o <- function() { 
  n <- 10 
  n(n) 
} 

o()
```

```no-highlight
## [1] 5
```
<img src="img/Function_vs_var_exception.png" style="height:120px;border:0;position: absolute; 
left: 210px; top: 240px" </img> 

**Try to avoid this whenever possible.**


--- &twocol
## 3. A fresh start

*** =left
<img src="img/Function_fresh_start.png" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" style="display: block; margin: auto;" />




*** =right
What gets returned each time?

```r
j()
a <- j()
j()
j()
a <- j()
j()
```

--- &twocol
## 3. A fresh start

*** =left
<img src="img/Function_fresh_start.png" title="plot of chunk unnamed-chunk-16" alt="plot of chunk unnamed-chunk-16" style="display: block; margin: auto;" />

*** =right
What gets returned each time?

```r
j()
```

```no-highlight
## [1] 1
```

```r
a <- j()
j()
```

```no-highlight
## [1] 2
```

```r
j()
```

```no-highlight
## [1] 2
```

```r
a <- j()
j()
```

```no-highlight
## [1] 3
```

---
## 4. Dynamic lookup

R looks for values when the function is run, not when it’s created.


```r
my_mean <- function(x) {
    sum(x) / count
}

count <- 10

my_mean(rep(2, times = 10)) 
```

```no-highlight
## [1] 2
```

```r
my_mean(rep(2, times = 5))
```

```no-highlight
## [1] 1
```
→ **Hard to spot** because occurring errors depend on the global environment.

--- &slide_no_footer .segue bg:#EEC900

# Your turn...

--- &twocol 
## What is the output of the following code snippets?

*** =left

```r
func1 <- function(y) {
   func2(z = y)
}
func2 <- function(z) {
   3 * z
}
func1(4) 
z <- 3 
func1(4) 
```


```r
y <- 3
func <- function(x, y) {
   x ^ y
}
func(2, 2)
x
y
func(3)
```

*** =right

```r
x1 <- 10
func <- function() {
   x1 * 2
}
func() 
x1 <- 5
func()
```


```r
f <- function(x) { 
   f <- function(x) { 
      f <- function(x) { 
         x ^ 2 
      } 
      f(x) + 1 
   } 
   f(x) * 2 
} 
x <- 10
f(x)
```


---
## The 4 Golden Rules

Every function should be...
 
- **selfcontained**,

- able to **solve one** particular **problem**,

- as **small as possible** and as **complex as needed**,

- properly **documented**


--- &twocol 
## Which functions are selfcontained?

*** =left

```r
func1 <- function(y) {
   func2(z = y)
}
func2 <- function(z) {
   3 * z
}
func1(4) 
z <- 3 
func1(4) 
```


```r
y <- 3
func <- function(x, y) {
   x ^ y
}
func(2, 2)
x
y
func(3)
```

*** =right

```r
x1 <- 10
func <- function() {
   x1 * 2
}
func() 
x1 <- 5
func()
```


```r
f <- function(x) { 
   f <- function(x) { 
      f <- function(x) { 
         x ^ 2 
      } 
      f(x) + 1 
   } 
   f(x) * 2 
} 
x <- 10
f(x)
```


---
## How to convert code to a function?





```r
df <- data.frame(replicate(6, sample(c(1:10, -99), 6, rep = TRUE)))
names(df) <- letters[1:6]
df
```

```no-highlight
##    a   b   c   d  e  f
## 1  3 -99   8   5  3  6
## 2  5   8   5   9  5  7
## 3  7   7   9 -99  1  6
## 4 10   1   6   3  5  3
## 5  3   3   8   8 10 10
## 6 10   2 -99   2  4  8
```

### Replace -99 with NA


--- 
## How to convert code to a function?


```r
df$a[df$a == -99] <- NA
df$b[df$b == -99] <- NA
df$c[df$b == -99] <- NA
df$d[df$d == -99] <- NA
df$e[df$e == -99] <- NA
df$e[df$f == -98] <- NA
```

**Can you spot all mistakes?**

--- 
## Try to downscale the problem

<img src="img/Function_downscale_problem.png" title="plot of chunk unnamed-chunk-30" alt="plot of chunk unnamed-chunk-30" width="700px" style="display: block; margin: auto auto auto 0;" />

---
## Try to downscale the problem




Test your function

```r
replace_value(c(2, 5, -99, 3, -99))
```

```no-highlight
## [1]  2  5 NA  3 NA
```

Use your function

```r
df$a <- replace_value(df$a)
df$b <- replace_value(df$b)
df$c <- replace_value(df$c)
df$d <- replace_value(df$d)
df$e <- replace_value(df$e)
df$f <- replace_value(df$f)
```

**Still prone to error but much better!**

--- &twocol
## Easy to customise

Imagine the value changes from -99 to -999

```no-highlight
##    a    b    c    d  e  f
## 1  3 -999    8    5  3  6
## 2  5    8    5    9  5  7
## 3  7    7    9 -999  1  6
## 4 10    1    6    3  5  3
## 5  3    3    8    8 10 10
## 6 10    2 -999    2  4  8
```

*** =left
Simply change your function

```r
replace_value2 <- function(x) {
   x[x == -999] <- NA
   x
}
```

*** =right
Or add an additional argument

```r
replace_value2 <- function(x, rep_na) {
   x[x == rep_na] <- NA
   x
}
```


---
## Return values


```r
replace_value <- function(x) {
   x[x == -99] <- NA
   return(x)
}
replace_value(c(2, 5, -99, 3, -99))
```

```no-highlight
## [1]  2  5 NA  3 NA
```

```r
replace_value <- function(x) {
   x[x == -99] <- NA
   invisible(x)
}
replace_value(c(2, 5, -99, 3, -99))
```

**No output in the console due to the `invisible()` call within the function**

--- &vcenter
## Return values

<img src="img/Function_return_values.png" title="plot of chunk unnamed-chunk-38" alt="plot of chunk unnamed-chunk-38" width="800px" />


--- &twocol
## Only one return value per function

*** =left

```r
complex_function <- function(x) {
   out_mean <- mean(x)
   out_median <- median(x)
   out_min <- min(x)
   out_max <- max(x)
   result <- list(out_mean, out_median, 
     out_min, out_max)
   return(result) 
}
```
<div class="boxorange1">
    <h3>list()</h3><p>is used here to combine intermediate results to one returned list object.</p></div>


*** =right

```r
complex_function(1:10)
```

```no-highlight
## [[1]]
## [1] 5.5
## 
## [[2]]
## [1] 5.5
## 
## [[3]]
## [1] 1
## 
## [[4]]
## [1] 10
```


--- &slide_no_footer .segue bg:#EEC900

# Your turn...

--- &exercise

# Exercise 1: Write your first functions!

1. Write a function to calculate the standard error.
2. Write a function to plot the weight-length relationship (W = a*L^b) of any fish species! Test your function with

- *Gadus morhua*, a = 0.0077, b = 3.07
- *Anguilla anguilla*, a = 0.00079, b = 3.23 


--- &slide_no_footer .segue bg:#1874CD

# Iterations
<img src="img/Data_science_1a.png" style="height:150px;border:0;position: absolute; 
left: 900px; top: 50px" </img> 

---
## Iteration or so-called loop functions in R

### 2 types

1. `for` loop family: execute for a prescribed number of times, as controlled by a **counter** or an index, incremented at each iteration cycle
2. `while` or `repeat` family of loops: are based on the onset and verification of a logical **condition**. The condition is tested at the start or the end of the loop construct.

<!-- <a href="https://www.datacamp.com/community/tutorials/tutorial-on-loops-in-r"> -->
<!--   <img src="img/Loop_types.png" alt="Loop types"style="height:300px;border:0;position: absolute; left: 250px; top: 380px" > -->
<!-- </a>  -->

<div class="img-with-text" style="position: absolute; left: 250px; top: 330px">
    <img src="img/Loop_types.png" alt="" width=500px/>
 <p><span class="source-img" style = "float:right">source: 
  <a href='https://www.datacamp.com/community/tutorials/tutorial-on-loops-in-r' title=''>www.datacamp.com/community/tutorials/tutorial-on-loops-in-r</a> (licensed under <a href='https://creativecommons.org/licenses/by-nc-nd/4.0/' title=''>CC-BY-NC-ND 4.0</a>)</span></p>
</div>





--- &vcenter
## `for` loop

<img src="img/For_loop_components_1.png" title="plot of chunk unnamed-chunk-41" alt="plot of chunk unnamed-chunk-41" width="500px" style="display: block; margin: auto;" />



--- &vcenter
## `for` loop

<img src="img/For_loop_components_2.png" title="plot of chunk unnamed-chunk-43" alt="plot of chunk unnamed-chunk-43" width="700px" style="display: block; margin: auto;" />


--- &vcenter
## `for` loop - Styles

<img src="img/For_loop_styles.png" title="plot of chunk unnamed-chunk-44" alt="plot of chunk unnamed-chunk-44" width="600px" style="display: block; margin: auto;" />


--- &twocol
## Best practice for the counter: `seq_along(x)`

→ a safe version of the familiar `1:length(x)`


```r
x <- c(2, 4, 7)
y <- numeric(0)
```

*** =left

```r
for (i in 1:length(x)) {
   print(x[i])
}
```


```r
1:length(x)
```

```no-highlight
## [1] 1 2 3
```

```r
1:length(y)
```

```no-highlight
## [1] 1 0
```
→ `1:length()` iterates at least once!

*** =right

```r
for (i in seq_along(x)) {
   print(x[i])
}
```


```r
seq_along(x)
```

```no-highlight
## [1] 1 2 3
```

```r
seq_along(y)
```

```no-highlight
## integer(0)
```
→ If the counter is NULL `seq_along()` does not execute any iteration!

--- &twocol
## Best practice for the output

- Before you start the loop, you must always allocate sufficient space for the output. 
- If you grow the `for` loop at each iteration using `c()` (for example), your `for` loop will be very slow:

*** =left

```r
# Grow objects
grow_obj <- function(x){
  y <- numeric()
  for (i in 1:x) { 
    y <- c(y, i)
  }
}
```

*** =right

```r
# Better: Indexing
index_obj <- function(x){
  y <- vector("integer", length(x))
  for (i in 1:x){ 
    y[i] <- i
  }
}
```
<small>Here, an empty vector with the <strong>length of the counter</strong> is created before the loop runs. </small> 


--- 
## Best practice for the output


```r
# Let's test the speed of both functions
microbenchmark::microbenchmark(unit = "ms", times = 5,
    grow_obj(500), grow_obj(5000), index_obj(500), index_obj(5000) )
```

```no-highlight
## Unit: milliseconds
##             expr       min        lq       mean    median        uq
##    grow_obj(500)  0.557673  0.568017  0.5879908  0.574069  0.595132
##   grow_obj(5000) 38.881681 47.168098 50.5571232 47.825416 50.714506
##   index_obj(500)  0.110457  0.115062  0.1173862  0.118125  0.120946
##  index_obj(5000)  0.908436  0.919034  1.6393442  0.930583  0.989413
##        max neval cld
##   0.645063     5  a 
##  68.195915     5   b
##   0.122341     5  a 
##   4.449255     5  a
```

Look at the `mean` column: As you can see, indexing is much faster than growing objects, particularly when iterating many times!


---
## Previous example: Replace repetitive code



Replace a specific value in a **vector**!

```r
replace_value <- function(x) {
   x[ x == -99] <- NA
   x
}
```

Use your function:

```r
df$a <- replace_value(df$a)
df$b <- replace_value(df$b)
df$c <- replace_value(df$c)
df$d <- replace_value(df$d)
df$e <- replace_value(df$e)
df$f <- replace_value(df$f)
```

**Still prone to error but much better!**

--- &mytwocol1
## Possible solution

Replace a specific value in a **data frame**!

*** =left
<img src="img/For_loop_replacement.png" title="plot of chunk unnamed-chunk-56" alt="plot of chunk unnamed-chunk-56" style="display: block; margin: auto;" />



*** =right

```r
replace_value(df)
```

```no-highlight
##    a  b  c  d  e  f
## 1  3 NA  8  5  3  6
## 2  5  8  5  9  5  7
## 3  7  7  9 NA  1  6
## 4 10  1  6  3  5  3
## 5  3  3  8  8 10 10
## 6 10  2 NA  2  4  8
```

---
## Test user input

What happens if the input is a **matrix** and not a data frame?

```r
mat <- matrix(c(1:5, -99), ncol=3)
replace_value(mat)
```

```
## Error in df[, i]: subscript out of bounds
```

```r
seq_along(mat)
```

```no-highlight
## [1] 1 2 3 4 5 6
```

- `seq_along()` counts each element in matrices and not the columns!

---
## Test user input - Solutions
- Either adjust code for various types of input
- or test the input type and return error message if not correct type:


```r
replace_value <- function(df) {
  if(is.data.frame(df)) {
    for (i in seq_along(df)) {
      df[df[, i] == -99, i] <- NA
    }
    return(df)
  } else {
    stop("Input has to be a data frame.")
  }
}
replace_value(mat) 
```

```
## Error in replace_value(mat): Input has to be a data frame.
```

--- &twocol
## Combine functions



*** =left
Instead of using a loop within the replace function you can combine 2 functions:

```r
replace_value <- function(x) {
  x[x == -99] <- NA
  x
}

apply_to_column <- function(df) {
  for (i in seq_along(df)) {
    df[, i] <- replace_value(df[, i])
  }
  return(df)
}
```

*** =right
<img src="img/For_loop_df_wNAs_arrow.png" title="plot of chunk unnamed-chunk-63" alt="plot of chunk unnamed-chunk-63" width="400px" style="display: block; margin: auto auto auto 0;" />


```r
apply_to_column(df)
```

```no-highlight
##    a  b  c  d  e  f
## 1  3 NA  8  5  3  6
## 2  5  8  5  9  5  7
## 3  7  7  9 NA  1  6
## 4 10  1  6  3  5  3
## 5  3  3  8  8 10 10
## 6 10  2 NA  2  4  8
```

--- &slide_no_footer .segue bg:#EEC900

# Your turn...

--- &exercise
# Exercise 2: Write your first `for` loops!

1. Determine the type of each column in the `FSA::Mirex` dataset
2. Compute the mean of every column in the `FSA::PikeNY` dataset

<small>Think about the output, sequence, and body before you start writing the loop.</small>

--- &exercise
# Exercise 3: Combine loops with functions

- Write a function to fit a linear model (y ~ x) to each of the 100 datasets in the "data/functions" folder ("dummyfile_1.csv" - "dummyfile_100.csv") and plot all slopes together as a histogram. 
  - What are the parameters of your function (filename, data frame, folder, ...)? 
  - Is the iteration outside of your function or part of the function call?
  - Should the plotting be part of your function?
- Do the same with the intercepts! <small> (for solution code see the last slide of the presentation)</small>

<img src="lecture17_plotting_files/unnamed-chunk-65-1.png" title="plot of chunk unnamed-chunk-65" alt="plot of chunk unnamed-chunk-65" width="576" style="display: block; margin: auto;" />

--- &slide_no_footer .segue bg:#E5E5E5

## Overview of functions you learned today

functions: `function()`, `return()`, `invisible()`

loops: `for(var in seq) expr`, `while(cond) expr`, `repeat expr`, `seq_along()`

conditions: `if(cond) expr`, `if(cond) cons.expr  else  alt.expr`

`exists()`, `microbenchmark::microbenchmark()`



--- &slide_no_footer .segue bg:#CD2626

# How do you feel now.....?

--- &vcenter

## Totally confused?
                
<img src="img/Comic_confused.png" title="plot of chunk unnamed-chunk-66" alt="plot of chunk unnamed-chunk-66" width="400px" style="display: block; margin: auto;" />

Try out the exercises and read [chapter 21 on iterations](http://r4ds.had.co.nz/iteration.html) in R for Data Science.

--- &vcenter

## Totally bored?
                
<img src="img/Comic_bored.png" title="plot of chunk unnamed-chunk-67" alt="plot of chunk unnamed-chunk-67" width="800px" style="display: block; margin: auto auto auto 0;" />

We just scratched the surface of R functional programming. If you want to learn more on how to write R functions I highly recommend the book [Advanced R](http://adv-r.had.co.nz) by Hadley Wickham.

---

## Totally content?
Then go grab a coffee, lean back and enjoy the rest of the day...!

<img src="img/Comic_hammock.png" title="plot of chunk unnamed-chunk-68" alt="plot of chunk unnamed-chunk-68" width="600px" style="display: block; margin: auto;" />


--- &thankyou



--- &slide_no_footer .segue bg:#CD2626

# Solution exercise 3

--- 
The following code demonstrates one approach for exercise 3 in which the slopes and intercepts are computed together in one function:


```r
files <- stringr::str_c("data/functions/dummyfile_", 1:100, ".csv")

# The iteration will be here part of the function:
get_coefs <- function(filenames) {
  # Create empty output vectors 
  intercept <- vector("double", length = length(filenames))
  slopes <- vector("double", length = length(filenames))
  
  for (i in seq_along(files)) {
    dat <- readr::read_csv(filenames[i]) # import single file 
    m_dat <- lm(y ~ x, data = dat) # fit linear model
    intercept[[i]] <- coef(m_dat)[1] # save the intercept
    slopes[[i]] <- coef(m_dat)[2] # save the slope
  }
  # Since output can be only 1 object:
  out <- tibble(a = intercept, b = slopes)
  return(out)
}
```

--- &twocol

*** =left

```r
# Apply function
all_coefs <- get_coefs(files) %>% 
  print(n =5)
```

```no-highlight
## # A tibble: 100 x 2
##       a     b
##   <dbl> <dbl>
## 1  3.12 0.794
## 2  2.64 0.800
## 3  1.95 0.828
## 4  3.08 0.755
## 5  1.07 0.922
## # ... with 95 more rows
```

<img src="lecture17_plotting_files/unnamed-chunk-71-1.png" title="plot of chunk unnamed-chunk-71" alt="plot of chunk unnamed-chunk-71" width="432" style="display: block; margin: auto;" />

*** =right

```r
# Create histograms
p <- ggplot(all_coefs) + 
  theme_classic()

p_a <- p + geom_histogram(aes(x = a), 
    bins = 10, fill = "white", 
  colour = "black") + 
  ggtitle("Histogram of intercepts") 

p_b <- p + geom_histogram(aes(x = b), 
    bins = 10, fill = "white", 
  colour = "black") + 
  ggtitle("Histogram of slopes") 

gridExtra::grid.arrange(p_a, p_b, 
  ncol=2)
```



