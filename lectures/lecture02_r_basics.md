---
title       : Data Analysis with R
subtitle    : 2 - Basics in R
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



# Basic data types in R
<img src="img/Data_science_1a.png" style="height:150px;border:0;position: absolute; left: 900px; top: 50px" </img> 

---
## Some of the most basic types are:

- Decimals values like `4.5` are called **doubles**.
- Natural numbers like `4` are called **integers**. Integers and doubles are  both called **numerics**. 
- Boolean values (`TRUE` or `FALSE`) are called **logical**.
- Text (or string) values are called **characters**.

---
## Some of the most basic types are:

- Decimals values like `4.5` are called **doubles**.
- Natural numbers like `4` are called **integers**. Integers and doubles are  both called **numerics**. 
- Boolean values (`TRUE` or `FALSE`) are called **logical**.
- Text (or string) values are called **characters**.


```r
my_double <- 42.5
my_integer <- 5
# With the L suffix, you get an integer rather than a double
my_integer_correct <- 5L

my_logical <- TRUE
my_character <- "some text"
# Note how the quotation marks on the right indicate that "some text" is a character.
```


---
## Whats the data type

To determine the (R internal) type or storage mode of any object or variable use the function `typeof()`

```r
typeof(my_double)
```

```no-highlight
## [1] "double"
```

```r
typeof(my_integer)
```

```no-highlight
## [1] "double"
```

```r
typeof(my_integer_correct)
```

```no-highlight
## [1] "integer"
```

---
## Test types

You can check if an object is of a specific type with an **'is.' function**:


```r
int_var <- 10L
is.integer(int_var)
```

```no-highlight
## [1] TRUE
```

```r
dbl_var <- 4.5
is.double(dbl_var)
```

```no-highlight
## [1] TRUE
```

---
## Test types (cont)

Overview of 'is.' functions 

| Function | lgl | int | dbl | num | chr 
|:----:|:----:|:-----:|:-----:|:-----:|:-----:|
| is.logical() | x |  |  |  |  |  
| is.integer() |  | x |  |  |  |  
| is.double() |  |  | x |  |  | 
| is.numeric() |  | x | x | x |  |  
| is.character() |  |  |  |  | x |  

---
## Missing values

- Missing values are specified with `NA`
- `NA` will always be coerced to the correct type if used inside a vector, or you can create NAs of a specific type with:

```r
NA            # logical
NA_integer_   # integer
NA_real_      # double
NA_character_ # character
```

- You can **check** also for missing values with `is.na()`

```r
x <- NA
is.na(x)
```

```no-highlight
## [1] TRUE
```

---
## Data structures

R’s base data structures can be organised by their **dimensionality** (1d, 2d, or nd) and whether they’re **homogeneous** (all contents must be of the same type) or **heterogeneous** (the contents can be of different types). This gives rise to the **five** data types most often used in data analysis:

|Dimensions | Homogeneous | Heterogeneous |
|:------:|:------:|:-------:|
| 1d | Atomic vector | List |
|2d | Matrix | Data frame |
|nd | Array |  |


--- &slide_no_footer .segue bg:#1874CD

# The most basic structure: atomic vectors
<img src="img/Data_science_1a.png" style="height:150px;border:0;position: absolute; left: 900px; top: 50px" </img> 

---
## Atomic vectors 
- are usually created with `c()`, short for **combine**:

```r
dbl_var <- c(1, 2.5, 4.5)
# Use TRUE and FALSE (or T and F) to create logical vectors
log_var <- c(TRUE, FALSE, T, F)
chr_var <- c("these are", "some strings")
```

--- &twocol
## Atomic vectors 
- are usually created with `c()`, short for **combine**:

```r
dbl_var <- c(1, 2.5, 4.5)
# Use TRUE and FALSE (or T and F) to create logical vectors
log_var <- c(TRUE, FALSE, T, F)
chr_var <- c("these are", "some strings")
```

*** =left
- or with `seq()` (= **sequence**) 

```r
seq(from = 0, to = 1, by = 0.2)
```

```no-highlight
## [1] 0.0 0.2 0.4 0.6 0.8 1.0
```

*** =right
- or `rep()`(= **repeat**)

```r
rep("a", times = 5)
```

```no-highlight
## [1] "a" "a" "a" "a" "a"
```

---
## Atomic vectors 
- are **always flat**, even if you nest `c()`’s:

```r
c(1, c(2, c(3, 4)))
```

```no-highlight
## [1] 1 2 3 4
```

```r
# the same as
c(1, 2, 3, 4)
```

```no-highlight
## [1] 1 2 3 4
```

--- &vcenter
## Hierarchy of data types in atomic vectors

<img src="img/Hierarchy_data_types_in_vectors.png" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" width="300px" style="display: block; margin: auto;" />

---
## Vector properties

1. Its **type**, which you can determine with `typeof()`.
2. Its **length**, which you can determine with `length()`.
3. Additional **metadata** in the form of **attributes**.

---
## Vector properties

1. Its **type**, which you can determine with `typeof()`.
2. Its **length**, which you can determine with `length()`.
3. Additional **metadata** in the form of **attributes**.


```r
typeof(1:10)
```

```no-highlight
## [1] "integer"
```

```r
x <- c(200, 50, 40, 1, 100, 20)
length(x)
```

```no-highlight
## [1] 6
```

--- 
## Important tools for working with vectors

1. How to **convert** from one type to another, and when that happens automatically?

2. What happens when you work with vectors of **different lengths**?
 
3. How to **name** the elements of a vector?
 
4. How to **pull** out elements of interest?

---
## 1. Coercion

- All elements of an atomic vector must be the **same type**
- **Different types** will be **coerced** to the most flexible type
- Types from **least to most** flexible are: 
  - logical < integer <  double < character

---
## 1. Coercion

- All elements of an atomic vector must be the **same type**
- **Different types** will be **coerced** to the most flexible type
- Types from **least to most** flexible are: 
  - logical < integer <  double < character
  
<br>  
For example, combining a character and an integer yields a character:

```r
str(c("a", 1))
```

```no-highlight
##  chr [1:2] "a" "1"
```

---
## 1. Coercion (cont)

When a logical vector is coerced to an integer or double, `TRUE` becomes 1 and `FALSE` becomes 0. This is very useful in conjunction with `sum()` and `mean()`

```r
x <- c(FALSE, FALSE, TRUE)
as.numeric(x)
```

```no-highlight
## [1] 0 0 1
```

```r
# Total number of TRUEs
sum(x)
```

```no-highlight
## [1] 1
```

--- &slide_no_footer .segue bg:#EEC900

# Your turn...

--- &radio bg:#EEC900
# Quiz 1: Coercion rules

Test your knowledge of vector coercion rules by predicting the output of the following uses of `c()`:

`c(1, FALSE)`

1. logical vector
2. integer vector
3. _double vector_
4. character vector
5. NA
6. error message

*** .explanation
The infite set of numbers cannot be reduced to simply 2 states whereas TRUE or FALSE can easily be coerced into the two numbers 0 and 1. As the value 1 in this vector is not specified explicitly as integer the vector coerces both to type double.


--- &radio bg:#EEC900
# Quiz 2: Coercion rules

Test your knowledge of vector coercion rules by predicting the output of the following uses of `c()`:

`c("a", 1)`

1. logical vector
2. integer vector
3. double vector
4. _character vector_
5. NA
6. error message

*** .explanation
A string (in this case "a") has no corresponding number it can be coerced to. But instead, a number such as the 1 can be coerced to a string.

--- &radio bg:#EEC900
# Quiz 3: Coercion rules

Test your knowledge of vector coercion rules by predicting the output of the following uses of `c()`:

`c(TRUE, 1L)`

1. logical vector
2. _integer vector_
3. double vector
4. character vector
5. NA
6. error message

*** .explanation
Now the number 1 is explicitly defined as integer, hence the TRUE is coerced to the integer 1.

--- &multitext bg:#EEC900
# Quiz 4: Coercion rules

`x <- c(TRUE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE)`

1. What would be the result if you sum up all elements of `x`?

*** .hint
<small>Remember, all TRUEs are coerced to 1 and all FALSEs to 0.</small>

*** .explanation

Simply use the `sum` function: `sum(x)`

1. <span class='answer'>5</span>


--- &multitext bg:#EEC900
# Quiz 5 - Challenge: Coercion rules

Type the following into the R console (or run it in your script),  which will create a long vector containing a random number of NAs.

```r
x <- 1:10000 
set.seed(123) # so we get all the same results
y <- sample(1:10000, 1) # random number of NAs
z <- sample(1:10000, y) # randomly assign positions of the y NAs
x[z] <- NA  # place NAs on the positions in z
```

1. How many `NA`s are in `x`?

*** .hint
<small>Recall, the `is.na()` function tests for NAs and returns a logical vector, which can be coerced to numbers for further calculations.</small>

*** .explanation

You calculate the sum of all true NAs by typing: `sum(is.na(x))`

1. <span class='answer'>2876</span>

---
## 2. Recycling rules

As well as implicitly coercing the types of vectors to be compatible, R will also implicitly coerce the length of vectors. This is called vector recycling, because the **shorter vector is repeated**, or recycled, to the **same length as the longer vector**.

```r
1:10 + 100
```

```no-highlight
##  [1] 101 102 103 104 105 106 107 108 109 110
```


```r
# What will happen with this summation?
1:10 + 1:2
```

---
## 2. Recycling rules

As well as implicitly coercing the types of vectors to be compatible, R will also implicitly coerce the length of vectors. This is called vector recycling, because the **shorter vector is repeated**, or recycled, to the **same length as the longer vector**.

```r
1:10 + 100
```

```no-highlight
##  [1] 101 102 103 104 105 106 107 108 109 110
```


```r
# What will happen with this summation?
1:10 + 1:2
```

```no-highlight
##  [1]  2  4  4  6  6  8  8 10 10 12
```

--- &slide_no_footer .segue bg:#EEC900

# Your turn...

--- &radio bg:#EEC900
# Quiz 6: Recycling rules

What happens when you do the following calculation?


```r
a <- c(10, 5, 100)
b <- 1:5
(a*b)*3
```

1. the output will be a vector of length 3
2. the output will be a vector of length 5, last element is 1500
3. _the output will be a vector of length 3, last element is 75_
4. the output will be a vector of length 3, last element is NA

*** .explanation
The shorter vector a gets recycled to the length of the longer vector b: R fills the gap with the element from the shorter vector one by one, i.e. position 4 gets the first element again, position 5 the second. And <2> gets also repeated as many times as the length of the longest vector b.


--- 
## 3. Naming vectors

All types of vectors can be named. You can name them **during creation** with `c()`:

```r
c(a = 1, b = 2, c = 4)
```

```no-highlight
## a b c 
## 1 2 4
```
Or **afterwards** by using the function `names()`

```r
x <- c(1,5,3)
names(x) <- c("a", "b", "c")
x 
```

```no-highlight
## a b c 
## 1 5 3
```

---
## 4. Subsetting

`[` is the subsetting function, and is called like `x[a]`.

There are 4 ways to subset a vector:

1. Using a **numeric** vector containing only integers
2. Subsetting with a **logical** vector 
3. Using a **named** vector
4. Using **nothing** 

---
1.Using a **numeric** vector containing only integers. 

```r
x <- c("one", "two", "three", "four", "five")
# positive integers keep elements at position:
x[c(5, 1, 3)]
```

```no-highlight
## [1] "five"  "one"   "three"
```

---
1.Using a **numeric** vector containing only integers. 

```r
x <- c("one", "two", "three", "four", "five")
# positive integers keep elements at position:
x[c(5, 1, 3)]
```

```no-highlight
## [1] "five"  "one"   "three"
```

```r
# repeating integers make vectors longer:
x[c(1,1,1,1,2,2,2,2,3,3,3,4,4,5,5)]
```

```no-highlight
##  [1] "one"   "one"   "one"   "one"   "two"   "two"   "two"   "two"  
##  [9] "three" "three" "three" "four"  "four"  "five"  "five"
```

---
1.Using a **numeric** vector containing only integers. 

```r
x <- c("one", "two", "three", "four", "five")
# positive integers keep elements at position:
x[c(5, 1, 3)]
```

```no-highlight
## [1] "five"  "one"   "three"
```

```r
# repeating integers make vector longer:
x[c(1,1,1,1,2,2,2,2,3,3,3,4,4,5,5)]
```

```no-highlight
##  [1] "one"   "one"   "one"   "one"   "two"   "two"   "two"   "two"  
##  [9] "three" "three" "three" "four"  "four"  "five"  "five"
```

```r
# negative integers remove elements:
x[c(-3,-5)]
```

```no-highlight
## [1] "one"  "two"  "four"
```

---
1.Using a **numeric** vector containing only integers. 

```r
# but you cannot mix
# x[c(1,2,-5)] # --> gives error message

# Using zero
x[0] # --> returns an empty vector
```

```no-highlight
## character(0)
```

---
2.Subsetting with a **logical** vector keeps all values corresponding to a `TRUE` value. This is most often useful in conjunction with the comparison functions.

```r
x <- c(10, 3, NA, 5, 8, 1, NA)

# All non-missing values of x
b <- is.na(x)
x[!b]  # the ! reverses the TRUE/FALSE values
```

```no-highlight
## [1] 10  3  5  8  1
```


```r
# All even (or missing!) values of x
x[x %% 2 == 0]
```

```no-highlight
## [1] 10 NA  8 NA
```

---
3.If you have a **named** vector, you can subset it with a character vector:

```r
x <- c(abc = 1, def = 2, xyz = 5)
x[c("xyz", "def")]
```

```no-highlight
## xyz def 
##   5   2
```

```r
# you can also duplicate elements
x[c("xyz", "def", "def")]
```

```no-highlight
## xyz def def 
##   5   2   2
```

---
4.Using **nothing** returns the original vector. More important for other data structures

```r
x[]
```

```no-highlight
## abc def xyz 
##   1   2   5
```

--- &slide_no_footer .segue bg:#EEC900

# Your turn...

--- &multitext bg:#EEC900
# Quiz 7: Subsetting

A vector **x** has been created by drawing 20 numbers randomly from 1 to 1000:

```r
set.seed(1) # (= state of the Random Number Generator set to 1)
x <- sample(1:1000, 20) 
```
Try it out yourself and answer the following 3 questions:

1. Which number does the 5th element of the vector **x** have?
2. What is the sum of the first 4 elements of **x**?
3. What is the sum if the 3rd and 15th element are excluded?


*** .explanation

1.To get the 5th element: `x[5]`   
2.To sum up over the first 4 elements:   
`sum(x[1:4])`or `sum(x[c(1,2,3,4)])`   
3.To remove the 3rd and 15th element before summation:   
`sum(x[c(-3, -15)])`

1. <span class='answer'>201</span>
2. <span class='answer'>2116</span>
3. <span class='answer'>9672</span>


--- &radio bg:#EEC900
# Quiz 8: Subsetting 

What happens when you subset with a positive integer that’s bigger than the length of the vector?

1. error message returned
2. nothing happens
3. the vector gets recycled (e.g. returns 2nd element if vector length is 10    and index value is a 12)
4. _NA returned_

*** .explanation
The vector gets indeed extended to the length of the requested element but not by recycling but by filling the gap with NAs.

--- &radio bg:#EEC900
# Quiz 9: Subsetting 

What happens when you subset with a name that doesn’t exist?

1. error message returned
2. nothing happens
3. the vector gets recycled (e.g. returns 2nd element if vector length is 10    and index value is a 12)
4. _NA returned_

*** .explanation
Instead of returning an error message, R returns NAs for all those pulled elements that do not exist (by the selected name). Beware of this behaviour and check your results at each step!


---
## Attributes

- All objects can have arbitrary additional attributes, used to **store metadata** about the object. 
- Attributes can be thought of as a **named list** (with unique names). 
- Attributes can be **accessed** individually with `attr()` or all at once (as a list) with `attributes()`.

---
## Attributes

- All objects can have arbitrary additional attributes, used to **store metadata** about the object. 
- Attributes can be thought of as a **named list** (with unique names). 
- Attributes can be **set** and **accessed** individually with `attr()` or all at once with `attributes()`.


```r
temp <- c(17.4, 18.3, 20.8, 16.9, 28.1)

# this metadata is typically written in the header in Excel or in an extra 
# spreadsheet, but can be put as attributes into R:
attr(temp, "unit") <- "°C"
attr(temp, "samplinginfo") <- "surface temperature (0.5m depth), measured with CTD"
attributes(temp)
```

```no-highlight
## $unit
## [1] "°C"
## 
## $samplinginfo
## [1] "surface temperature (0.5m depth), measured with CTD"
```

---
## Attributes (cont)

- The  **three most important** attributes are:
  - **Names**, a character vector giving each element a name.
  - **Dimensions**, used to turn vectors into matrices and arrays.
  - **Class**, used to implement the S3 object system.

---
## Attributes (cont)

- The  **three most important** attributes are:
  - **Names**, a character vector giving each element a name.
  - **Dimensions**, used to turn vectors into matrices and arrays.
  - **Class**, used to implement the S3 object system.

Each of these attributes has a **specific accessor function** to get and set values:

- `names(x)` 
- `length(x)` (for 1-dimensional structures: vectors, list) otherwise `dim(x)`
- `class(x)`

---
## Attributes (cont)

The attribute **names** and other attributes that you set manually will always appear when you look at the content of your vector:

```r
# add stationnames 
names(temp) <- c("st_03", "st_11", "st_17", "st_21", "st_25")
temp
```

```no-highlight
## st_03 st_11 st_17 st_21 st_25 
##  17.4  18.3  20.8  16.9  28.1 
## attr(,"unit")
## [1] "°C"
## attr(,"samplinginfo")
## [1] "surface temperature (0.5m depth), measured with CTD"
```

---
## Attributes (cont)

These attributes are only visible when you call them explicitly:

```r
length(temp)
```

```no-highlight
## [1] 5
```

```r
class(temp)
```

```no-highlight
## [1] "numeric"
```

---
## Factors

One important use of **attributes** is to **define factors**. Factors are

- vectors that can contain only **predefined values**,  
- used to store **categorical data**,
- built **on top of integer** vectors using two attributes: 
   - the **class**, “factor”, which makes them behave differently from regular integer vectors,
   - and the **levels**, which defines the set of allowed values.
- for more on factors see lecture 10

---
## Factors (cont)


```r
biomass <- factor(c("low", "medium", "low", "high", "medium"))
biomass
```

```no-highlight
## [1] low    medium low    high   medium
## Levels: high low medium
```

```r
class(biomass)
```

```no-highlight
## [1] "factor"
```

```r
levels(biomass) # shown in alphabetic order if not specified
```

```no-highlight
## [1] "high"   "low"    "medium"
```


--- &slide_no_footer .segue bg:#1874CD

# Vectorized operations in R
<img src="img/Data_science_1a.png" style="height:150px;border:0;position: absolute; left: 900px; top: 50px" </img> 


--- 
## Basic calculation example


```r
a <- c(1,2,3,4)
c <- (a + sqrt(a))/(exp(2)+1)
c
```

```no-highlight
## [1] 0.2384058 0.4069842 0.5640743 0.7152175
```
### Why 4 values???

---
## Vectorized calculations

R calculations are vectorized, that means certain calculations are done **with each element of a vector**.

--- 
## Vectorized calculations

R calculations are vectorized, that means certain calculations are done **with each element of a vector**.

### Guess...


```r
a <- c(1,2,3,4)
b <- 10
```


```r
a + b 
a * b 
```


--- 
## Vectorized calculations

R calculations are vectorized, that means certain calculations are done **with each element of a vector**.

### Guess...


```r
a <- c(1,2,3,4)
b <- 10 # b gets recycled to the length of a
```


```r
a + b # = a[1] + b[1], a[2] + b["2"], a[3] + b["3"], a[4] + b["4"]
```

```no-highlight
## [1] 11 12 13 14
```

```r
a * b # = a[1] * b[1], ...
```

```no-highlight
## [1] 10 20 30 40
```


--- &slide_no_footer .segue bg:#EEC900

# Your turn...

--- &multitext bg:#EEC900

# Quiz 10: Total Sums of Squares $\sum_{i=1}^{n} \left(x_{i} - \bar{x}\right)^{2}$

Calculate for the following vector

```r
set.seed(1)
x <- sample(1:20, 20, replace = TRUE)
```
the sum, over all observations, of squared deviation of each observation from the overall mean.

1. Write the result in the following box and compare

*** .hint
<small>The follow functions are useful: `sum()`, `mean()`.
Remember, the calculation needs to be from the innermost to the
outermost parenthesis (just like a calculator). So your order should be:
1. calculate deviations of vector,
2. square deviations,
3. sum all up. </small>


*** .explanation
`sum( (x-mean(x))^2 )`

1. <span class='answer'>594.8</span>

--- &slide_no_footer .segue bg:#E5E5E5

## Overview of functions you learned today

`c()`, `typeof()`, `length()`, `is.logical()`, `as.logical()`, `is.integer()`, `as.integer()`, `is.double()`, `as.double()`, `is.numeric()`, `as.numeric()`, `is.character()`, `as.character()`, `str()`, 

`names()`, `[]`, `is.na()`, `set.seed()`, `sample()`, `attr()`, `attributes()`, `dim()`, `class()`, 

`factor()`, `levels()`,

`+`, `-`, `*`, `/`, `^`, `sqrt()`, `exp()`

--- &slide_no_footer .segue bg:#CD2626

# How do you feel now.....?

--- &vcenter
## Totally confused?
 
<img src="img/Comic_confused.png" title="plot of chunk unnamed-chunk-42" alt="plot of chunk unnamed-chunk-42" width="400px" style="display: block; margin: auto;" />

Try out the [online tutorial at Data Camp](https://campus.datacamp.com/courses/free-introduction-to-r/chapter-1-intro-to-basics-1?ex=1)



--- &vcenter
## Totally bored?
                
<img src="img/Comic_bored.png" title="plot of chunk unnamed-chunk-43" alt="plot of chunk unnamed-chunk-43" width="800px" style="display: block; margin: auto auto auto 0;" />

Don't worry! Soon you won't be bored anymore!!

---
## Totally content?
Then go grab a coffee, lean back and enjoy the rest of the day...!

<img src="img/Comic_hammock.png" title="plot of chunk unnamed-chunk-44" alt="plot of chunk unnamed-chunk-44" width="600px" style="display: block; margin: auto;" />


--- &thankyou
