---
title       : Data Analysis with R
subtitle    : 8 - Intro2Visualization - Part 1
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
--- &slide_no_footer .segue bg:grey






# Recap ...

--- 
## Visualization is one of the corner stones of data science

<div style="position: absolute; left: 100px; top: 200px ">
    <img src="img/Data_science_1.png" alt="" width=400px>
</div>

<div class="img-with-text" style="position: absolute; left: 500px; top: 400px; z-index:100">
    <img src="img/Data_wrangling_2.png" alt="" width=500px/>
 <p><span class="source-img" style = "float:right">source: 
    <a href='http://r4ds.had.co.nz/wrangle-intro.html' title=''>R for Data Science</a> by Wickam & Grolemund, 2017 (licensed under <a href='https://creativecommons.org/licenses/by-nc-nd/3.0/us/' title=''>CC-BY-NC-ND 3.0 US</a>)</span></p>
</div>

<kbd>p</kbd>

*** =pnotes
<small> "Once you made your data tidy data with the variables you need, there are two main engines of knowledge generation: visualisation and modelling. These have complementary strengths and weaknesses so they should always go together and any real analysis will iterate between them many times.

A good visualisation will show you things that you did not expect, or raise new questions about the data. A good visualisation might also hint that you’re asking the wrong question, or you need to collect different data. Visualisations can surprise you, but don’t scale particularly well because they require a human to interpret them." (from R for Data Science) </small>

--- &slide_no_footer .segue bg:url(img/ggplot_examples.png);background-size:cover

## Visualization with ggplot2

--- &mytwocol1
## A system for creating graphics 

<div style="position: absolute; left: 550px; top: 30px; z-index:100">
    <img src="img/Logo_ggplot2.png" alt="" width=75px height=75px>
</div>

*** =left
- Based on "The Grammar of Graphics"
- The fundament for plotting in R nowadays
- Well documented
  - http://ggplot2.tidyverse.org
  - http://ggplot2.org
  - complete book [(online version)](http://ggplot2.org/book/)
- Getting help: [ggplot2 mailing list](https://groups.google.com/forum/?fromgroups#!forum/ggplot2)
- An increasing number of [ggplot2 extensions](http://www.ggplot2-exts.org) developed by R users in the community


*** =right
<div style="position: absolute; left: 650px; top: 150px; z-index:100">
    <img src="img/Grammar_of_graphics.jpg" alt="" width=200px height=200px>
</div>

<div style="position: absolute; left: 800px; top: 300px; z-index:100">
    <img src="img/Book_ggplot2.jpg" alt="" width=200px height=200px>
</div>


--- bg:url(img/ggplot_extensions.png);background-size:cover

--- &mytwocol1 #slide1a
### Creating plots in a stepwise process
<div style="position: absolute; left: 720px; top: 30px; z-index:100">
    <img src="img/ggplot2_grammar_principle.png" alt="" width=380px height=300px>
</div>

*** =left
- Start with `ggplot(data, mapping = aes())` where you supply a *dataset* and (default) **aesthetic mapping**
- Add a **layer** by calling a `geom_function`
- Then add on (not required as defaults supplied)  
  - **scales** like `xlim()`
  - **faceting** like `facet_wrap()`  
  - **coordinate systems** like `coord_flip()`
  - **themes** like `theme_bw()`
- *Save* a plot to disk with `ggsave()` 

<p><span class="source-img" style="position: absolute; left: 400px; top: 600px">source of image (topright): older version of <a href='https://github.com/rstudio/cheatsheets/raw/master/data-visualization-2.1.pdf' title=''>Data Visualization with ggplot</a> cheat sheet (licensed under CC-BY-SA)</span>
</p>




--- &mytwocol1 #slide1b
### Creating plots in a stepwise process
<div style="position: absolute; left: 720px; top: 30px; z-index:100">
    <img src="img/ggplot2_grammar_principle.png" alt="" width=380px height=300px>
</div>

*** =left
- Start with `ggplot(data, mapping = aes())` where you supply a *dataset* and (default) **aesthetic mapping**
- Add a **layer** by calling a `geom_function`
- Then add on (not required as defaults supplied)  
  - **scales** like `xlim()`
  - **faceting** like `facet_wrap()`  
  - **coordinate systems** like `coord_flip()`
  - **themes** like `theme_bw()`
- *Save* a plot to disk with `ggsave()` 

<div class="boxgreen1" style="position: absolute; left: 640px; top: 180px;">
    <h3>aesthetic mapping:</h3><p>to display values, variables in the data need to be mapped to <strong>visual properties</strong> of the geom (aesthetics) like size, color, and x and y locations. <code>aes()</code> mappings within <code>ggplot()</code> represent default settings for all layers (typically x and y), otherwise map variables within geom-functions. 
    </p></div>



--- &mytwocol1 #slide1c
### Creating plots in a stepwise process
<div style="position: absolute; left: 720px; top: 30px; z-index:100">
    <img src="img/ggplot2_grammar_principle.png" alt="" width=380px height=300px>
</div>

*** =left
- Start with `ggplot(data, mapping = aes())` where you supply a *dataset* and (default) **aesthetic mapping**
- Add a **layer** by calling a `geom_function`
- Then add on (not required as defaults supplied)  
  - **scales** like `xlim()`
  - **faceting** like `facet_wrap()`  
  - **coordinate systems** like `coord_flip()`
  - **themes** like `theme_bw()`
- *Save* a plot to disk with `ggsave()` 

<div class="boxgreen1" style="position: absolute; left: 640px; top: 205px">
  <h3>geom_function:</h3><p> combines a geometric object representing the observations with aesthetic mapping, a stat, and a position adjustment, e.g., <code>geom_point()</code> or <code>geom_histogram()</code></p>
</div>



--- &mytwocol1 #slide1d
### Creating plots in a stepwise process
<div style="position: absolute; left: 720px; top: 30px; z-index:100">
    <img src="img/ggplot2_grammar_principle.png" alt="" width=380px height=300px>
</div>

*** =left
- Start with `ggplot(data, mapping = aes())` where you supply a *dataset* and (default) **aesthetic mapping**
- Add a **layer** by calling a `geom_function`
- Then add on (not required as defaults supplied)  
  - **scales** like `xlim()`
  - **faceting** like `facet_wrap()`  
  - **coordinate systems** like `coord_flip()`
  - **themes** like `theme_bw()`
- *Save* a plot to disk with `ggsave()` 

<div class="boxgreen1" style="position: absolute; left: 640px; top: 300px">
  <h3>scales:</h3><p> control the details of how data values are translated to visual properties (override the default scales)</p>
</div>



--- &mytwocol1 #slide1e
### Creating plots in a stepwise process
<div style="position: absolute; left: 720px; top: 30px; z-index:100">
    <img src="img/ggplot2_grammar_principle.png" alt="" width=380px height=300px>
</div>

*** =left
- Start with `ggplot(data, mapping = aes())` where you supply a *dataset* and (default) **aesthetic mapping**
- Add a **layer** by calling a `geom_function`
- Then add on (not required as defaults supplied)  
  - **scales** like `xlim()`
  - **faceting** like `facet_wrap()`  
  - **coordinate systems** like `coord_flip()`
  - **themes** like `theme_bw()`
- *Save* a plot to disk with `ggsave()` 

<div class="boxgreen1" style="position: absolute; left: 640px; top: 360px">
  <h3>facetting:</h3><p> smaller plots that display different subsets of the data; also useful for exploring conditional relationships.</p>
</div>



--- &mytwocol1 #slide1f
### Creating plots in a stepwise process
<div style="position: absolute; left: 720px; top: 30px; z-index:100">
    <img src="img/ggplot2_grammar_principle.png" alt="" width=380px height=300px>
</div>

*** =left
- Start with `ggplot(data, mapping = aes())` where you supply a *dataset* and (default) **aesthetic mapping**
- Add a **layer** by calling a `geom_function`
- Then add on (not required as defaults supplied)  
  - **scales** like `xlim()`
  - **faceting** like `facet_wrap()`  
  - **coordinate systems** like `coord_flip()`
  - **themes** like `theme_bw()`
- *Save* a plot to disk with `ggsave()`  

<div class="boxgreen1" style="position: absolute; left: 640px; top: 415px">
  <h3>coordinate system:</h3><p> determines how the x and y aesthetics combine to position elements in the plot</p>
</div>


--- &mytwocol1 #slide1g
### Creating plots in a stepwise process
<div style="position: absolute; left: 720px; top: 30px; z-index:100">
    <img src="img/ggplot2_grammar_principle.png" alt="" width=380px height=300px>
</div>

*** =left
- Start with `ggplot(data, mapping = aes())` where you supply a *dataset* and (default) **aesthetic mapping**
- Add a **layer** by calling a `geom_function`
- Then add on (not required as defaults supplied)  
  - **scales** like `xlim()`
  - **faceting** like `facet_wrap()`  
  - **coordinate systems** like `coord_flip()`
  - **themes** like `theme_bw()`
- *Save* a plot to disk with `ggsave()`  

<div class="boxgreen1" style="position: absolute; left: 640px; top: 475px">
  <h3>themes:</h3><p> control the display of all non-data elements of the plot. You can override all settings with a complete theme like <code>theme_bw()</code>, or choose to tweak individual settings</p>
</div>


--- &mytwocol1 #slide1h
### Creating plots in a stepwise process
<div style="position: absolute; left: 720px; top: 30px; z-index:100">
    <img src="img/ggplot2_grammar_principle.png" alt="" width=380px height=300px>
</div>

*** =left
- Start with `ggplot(data, mapping = aes())` where you supply a *dataset* and (default) **aesthetic mapping**
- Add a **layer** by calling a `geom_function`
- Then add on (not required as defaults supplied)  
  - **scales** like `xlim()`
  - **faceting** like `facet_wrap()`  
  - **coordinate systems** like `coord_flip()`
  - **themes** like `theme_bw()`
- *Save* a plot to disk with `ggsave()`  

<div class="boxgreen1" style="position: absolute; left: 640px; top: 530px">
  <h3>ggsave("plot.png", width = 5, height = 5):</h3><p>  Saves last plot as 5’ x 5’ file named "plot.png" in working directory. Matches file type to file extension.</p>
</div>



---
## A demonstration with the internal iris data 

<a href="https://en.wikipedia.org/wiki/Iris_flower_data_set">
  <img src="https://upload.wikimedia.org/wikipedia/commons/5/56/Kosaciec_szczecinkowaty_Iris_setosa.jpg" alt="Iris setosa"style="width:300px;height:300px;border:0;" >
  <img src="https://upload.wikimedia.org/wikipedia/commons/4/41/Iris_versicolor_3.jpg" alt="Iris versicolor", style="width:300px;height:300px;border:0;">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Iris_virginica.jpg/1920px-Iris_virginica.jpg" alt="Iris virginica", style="width:300px;height:300px;border:0;">
</a>

<p><span class="source-img" style="position: absolute; left: 150px; top: 600px">Photos taken by Radomil Binek, Danielle Langlois, and Frank Mayfield (from left to right); accessed via <a href='https://en.wikipedia.org/wiki/Iris_flower_data_set' title=''>Wikipedia</a> (all photos under <a href='https://creativecommons.org/licenses/by-sa/3.0/' title=''>CC-BY-SA 3.0</a> license)</span></p>




--- &twocol
### Step 1 - start a plot with `ggplot()`

*** =left

```r
ggplot(iris, aes(x = Sepal.Length, 
    y = Petal.Length))
```

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" width="504" />

--- &twocol
### Step 2 - add layers: `geom_point()`

*** =left

```r
ggplot(iris, aes(x = Sepal.Length, 
    y = Petal.Length)) +
  geom_point()
```

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-6-1.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" width="504" />

--- &twocol
### Step 2 - add layers: `geom_point()`

*** =left

```r
ggplot(iris, aes(x = Sepal.Length, 
    y = Petal.Length)) +
  geom_point(aes(col = Species))
```
<div class="alert alert-green", style="width: 440px">
  <h4>aes(col = Species)</h4> Show points in species-specific colours.
</div>

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-8-1.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="504" />

--- &twocol
### Step 2 - add layers: `geom_smooth()`  

*** =left

```r
ggplot(iris, aes(x = Sepal.Length, 
    y = Petal.Length)) +
  geom_point(aes(col = Species)) +
  geom_smooth()
```

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-10-1.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" width="504" />

--- &twocol
### Step 2 - add layers: `geom_smooth()` 

*** =left

```r
ggplot(iris, aes(x = Sepal.Length, 
    y = Petal.Length)) +
  geom_point(aes(col = Species)) +
  geom_smooth(aes(col = Species), 
    method = "lm")
```
<div class="alert alert-green", style="width: 440px">
  <h4>aes(col = Species), method = "lm"</h4> Make smoother species-specific and linear.
</div>

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-12-1.png" title="plot of chunk unnamed-chunk-12" alt="plot of chunk unnamed-chunk-12" width="504" />

--- &twocol
### Step 2 - add layers

*** =left

```r
ggplot(iris, aes(x = Sepal.Length, 
    y = Petal.Length, col = Species)) +
  geom_point() +
  geom_smooth(method = "lm")
```
<div class="alert alert-green", style="width: 440px">
 <size=4> Move species-specific colour aesthetics to <code>ggplot()</code> (so it becomes the default setting for all added layers).</size=4> 
</div>

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-14-1.png" title="plot of chunk unnamed-chunk-14" alt="plot of chunk unnamed-chunk-14" width="504" />

--- &twocol
### Step 3 - add scales: `scale_colour_brewer()`

*** =left

```r
ggplot(iris, aes(x = Sepal.Length, 
    y = Petal.Length, col = Species)) +
  geom_point() +
  geom_smooth(method = "lm") +
  scale_colour_brewer() 
```

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-16-1.png" title="plot of chunk unnamed-chunk-16" alt="plot of chunk unnamed-chunk-16" width="504" />

--- &twocol
### Step 4 - add facets: `facet_wrap()`

*** =left

```r
ggplot(iris, aes(x = Sepal.Length, 
    y = Petal.Length, col = Species)) +
  geom_point() +
  geom_smooth(method = "lm") +
  scale_colour_brewer() +
  facet_wrap(~Species, nrow=3)
```
<div class="alert alert-green", style="width: 440px">
  <h4>facet_wrap(~Species, nrow=3)</h4> Divide the species-specific observations into different panels.
</div>

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-18-1.png" title="plot of chunk unnamed-chunk-18" alt="plot of chunk unnamed-chunk-18" width="504" />

--- &twocol
### Step 5 - modify coordinate system: `coord_polar()`

*** =left

```r
ggplot(iris, aes(x = Sepal.Length, 
    y = Petal.Length, col = Species)) +
  geom_point() +
  geom_smooth(method = "lm") +
  scale_colour_brewer() +
  facet_wrap(~Species, nrow=3) +
  coord_polar()
```

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-20-1.png" title="plot of chunk unnamed-chunk-20" alt="plot of chunk unnamed-chunk-20" width="504" />

--- &twocol
### Step 6 - change the look of non-data elements: `theme_dark()`

*** =left

```r
ggplot(iris, aes(x = Sepal.Length, 
    y = Petal.Length, col = Species)) +
  geom_point() +
  geom_smooth(method = "lm") +
  scale_colour_brewer() +
  facet_wrap(~Species, nrow=3) +
  coord_polar() +
  theme_dark()
```

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-22-1.png" title="plot of chunk unnamed-chunk-22" alt="plot of chunk unnamed-chunk-22" width="504" />

---
### Step 7 - save the plot: `ggsave()`


```r
ggplot(iris, aes(x = Sepal.Length, 
    y = Petal.Length, col = Species)) +
  geom_point() +
  geom_smooth(method = "lm") +
  scale_colour_brewer() +
  facet_wrap(~Species, nrow=3) +
  coord_polar()

ggsave("Iris_length_relationships.pdf", width = 4, height = 4)
```
The last plot displayed is saved (as default).

--- &slide_no_footer .segue bg:#1874CD

# <small>ggplot</small> - geom_functions
<img src="img/Data_science_1b.png" style="height:150px;border:0;position: absolute; left: 900px; top: 50px" </img> 


---
## When to use which function?

That depends on 
- what you want to display (your question) 
- and the type of data

Common plots are ...


--- &twocol
### Visualize frequency distributions

*** =left
BARPLOTS -  
<small>are used for **categorical** or **discrete** variables. Bars do not touch each other; there are no ‘in-between’ values.</small>

<img src="lecture08_plotting_files/unnamed-chunk-24-1.png" title="plot of chunk unnamed-chunk-24" alt="plot of chunk unnamed-chunk-24" width="360" style="display: block; margin: auto;" />

*** =right
HISTOGRAMS and DENSITY PLOTS (can be combined)
<small>are used for **continuous** variables and are often used to check whether variables are normally distributed. Bars touch each other in histograms.</small>

<img src="lecture08_plotting_files/unnamed-chunk-25-1.png" title="plot of chunk unnamed-chunk-25" alt="plot of chunk unnamed-chunk-25" width="360" style="display: block; margin: auto;" />


--- &mytwocol2
### Compare groups

BOXPLOTS - <small>are used to compare two or more groups in terms of their *distributional center and spread*. They transport a lot of information and should be computed in every data exploration! You can check,</small>

*** =left
- <small>**differences in average y values** between groups and whether these might be significant,</small> 
- <small>if group **variances differ**,</small> 
- <small>whether individual groups are **normally distributed**</small>
- <small>identify **outlier**</small>

<a class="btn btn-small btn-danger" rel="popover" data-content="If boxes do not overlap, significance test will most likely confirm a significant difference. Are box sizes and whisker lengths different between groups? This is an indication of 'homogeneity', which is a problem for some statistical tests. If the lengths of lower and upper whisker/hinge differ is this an indication for non-normality. CLICK TO CLOSE AGAIN!" data-original-title="" id='example'>Click here to read how</a>



*** =right
<img src="img/Boxplot_ai.png" title="plot of chunk unnamed-chunk-27" alt="plot of chunk unnamed-chunk-27" width="600px" style="display: block; margin: auto;" />

--- &twocol
### Show relationship between 2 variables

*** =left
SCATTERPLOTS -  
<small>are the most basic plots for **continuous** variables. They are also the least interpreting plots as they show every observation in the 2-dimensional space.</small>
<img src="lecture08_plotting_files/unnamed-chunk-28-1.png" title="plot of chunk unnamed-chunk-28" alt="plot of chunk unnamed-chunk-28" width="360" style="display: block; margin: auto;" />

*** =right
<small>Another useful feature is that they can be **combined with other plotting elements**: defining *aesthetics for a 3rd variable* (e.g. colours of points) or adding *regression or smoothing lines* to help visualise the relationship:</small>
<img src="lecture08_plotting_files/unnamed-chunk-29-1.png" title="plot of chunk unnamed-chunk-29" alt="plot of chunk unnamed-chunk-29" width="360" style="display: block; margin: auto;" />

---
<q> An overview of core *geom_functions* depending on the type of data:</q>

--- &slide_no_footer bg:url(img/geom_flowchart_1.png);background-size:cover

<p><span class="source-img" style="position: absolute; left: 650px; top: 25px;">Elements taken from older version of 
    <a href='https://github.com/rstudio/cheatsheets/raw/master/data-visualization-2.1.pdf' title=''>ggplot</a> cheat sheet </span></p>

--- &slide_no_footer bg:url(img/geom_flowchart_2.png);background-size:cover

--- &slide_no_footer bg:url(img/geom_flowchart_3.png);background-size:cover

--- &slide_no_footer .segue bg:#FF8C00

# Some examples with the ICES hydro data
<img src="img/Data_science_1b.png" style="height:150px;border:0;position: absolute; left: 900px; top: 50px" </img> 

--- &twocol
### A barplot to see the frequency of monthly samplings 

*** =left

```r
hydro_sub <- hydro %>%
 select(fmonth, station, date_time) %>%
  # (fmonth = month as factor)
 distinct()

ggplot(hydro_sub,aes(x=fmonth)) +
  geom_bar()
```
<div class="alert alert-green", style="width: 440px">
  <h4>Note</h4> For barplots (or boxplots) <strong>x</strong> must be <strong>categorical</strong>, hence, we use here month as a factor! 
</div>

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-31-1.png" title="plot of chunk unnamed-chunk-31" alt="plot of chunk unnamed-chunk-31" width="360" style="display: block; margin: auto;" />

--- &twocol
### A scatterplot to see all stations, coloured by month
<div class="alert alert-orange">
  <h4>Note:</h4> To get a <strong>discrete scale</strong> we use again <strong>fmonth</strong>.
</div>

*** =left

```r
hydro_sub <- hydro %>%
 select(fmonth,station,lat,long) %>%
 distinct()

ggplot(hydro_sub, aes(x = long,  
    y = lat, col = fmonth)) +
  geom_point() 
```

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-33-1.png" title="plot of chunk unnamed-chunk-33" alt="plot of chunk unnamed-chunk-33" width="504" style="display: block; margin: auto;" />

--- &twocol
### A histogram to see the distribution of (all) temperature values
<div class="alert alert-orange">
  <h4>Note:</h4> You can use the <strong>pipe operator</strong> also when plotting and saving ggplot as an object!
</div>

*** =left

```r
p <- hydro %>% ggplot(aes(x = temp)) +
  geom_histogram()
p
```

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-35-1.png" title="plot of chunk unnamed-chunk-35" alt="plot of chunk unnamed-chunk-35" width="504" style="display: block; margin: auto;" />

---
### A boxplot to compare the surface temp between months

```r
hydro %>% filter(pres < 5) %>%
  group_by(fmonth, station, date_time, cruise) %>%
  summarise(mean_sst = mean(temp)) %>% ungroup() %>%
ggplot(aes(x = fmonth, y = mean_sst)) +
  geom_boxplot(outlier.colour = "red", outlier.alpha = 0.2)
```

<img src="lecture08_plotting_files/unnamed-chunk-36-1.png" title="plot of chunk unnamed-chunk-36" alt="plot of chunk unnamed-chunk-36" width="504" style="display: block; margin: auto;" />

---
### Correlation plot between temperature and salinity

```r
ggplot(hydro, aes(x = psal, y = temp, col = day)) +
  geom_point()
```

<img src="lecture08_plotting_files/unnamed-chunk-37-1.png" title="plot of chunk unnamed-chunk-37" alt="plot of chunk unnamed-chunk-37" width="576" style="display: block; margin: auto;" />

--- &mytwocol2
### .. now separated by month

*** =left

```r
ggplot(hydro, 
  aes(x = psal, 
    y = temp, 
    col = day)) +
  geom_point() +
  facet_wrap(
    ~fmonth, 
    nrow = 3)
```

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-39-1.png" title="plot of chunk unnamed-chunk-39" alt="plot of chunk unnamed-chunk-39" width="720" style="display: block; margin: auto auto auto 0;" />

--- &twocol
### Depth profile at one station in July

*** =left

```r
hydro_sub <- hydro %>% 
  filter(station=="0403",fmonth==7,day==11) 
p_temp <- ggplot(hydro_sub, aes(y=pres)) +
  geom_point(aes(x = temp), col="red") +
  ylim(70, 0)
p_sal <- ggplot(hydro_sub, aes(y=pres)) +
  geom_point(aes(x = psal)) +
  ylim(70, 0)
p_oxy <- ggplot(hydro_sub, aes(y=pres)) +
  geom_point(aes(x = doxy), col="blue") +
  ylim(70, 0)
gridExtra::grid.arrange(grobs = list(
  p_temp, p_sal, p_oxy), nrow=1)
```
<div class="alert alert-green", style="width: 440px">
  <h4>Note</h4> The colour specification is <strong>outside</strong> the <strong>aesthetic mapping</strong>: because we want the same colour for all observations.
</div>

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-41-1.png" title="plot of chunk unnamed-chunk-41" alt="plot of chunk unnamed-chunk-41" width="504" />

--- &twocol
### Some extension examples: `ggridges` 

*** =left

```r
library(ggridges)
hydro %>% filter(pres < 10) %>%
  group_by(station, fmonth, day) %>%
  summarise(
    sst = mean(temp, na.rm = TRUE)) %>%
  group_by(station, fmonth) %>%
  summarise(
    sst = mean(sst, na.rm = TRUE)) %>%
  ungroup() %>%
  ggplot(aes(x = sst, y = fmonth, 
    fill = fmonth)) +
  geom_density_ridges(scale = 12, 
    rel_min_height = 0.005) +
  scale_fill_cyclical(
    values = c("blue", "green")) +
  theme_ridges()
```

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-43-1.png" title="plot of chunk unnamed-chunk-43" alt="plot of chunk unnamed-chunk-43" width="504" style="display: block; margin: auto;" />

---&twocol
### Some extension examples: `ggmap`

*** =left

```r
library(ggmap)
b <- matrix(c(
  min(hydro$long), 
  max(hydro$long), 
  min(hydro$lat), 
  max(hydro$lat) ), byrow=T,nrow=2)
colnames(b) <- c("min","max")
rownames(b) <- c("x","y")
map_bs <- ggmap(get_map(location = b, 
  zoom = 5))
map_bs + geom_point(data=hydro, 
  aes(long,lat), size=0.5, 
  color="red")
```

*** =right


<img src="img/ggmap_baltic.png" title="plot of chunk unnamed-chunk-46" alt="plot of chunk unnamed-chunk-46" width="400px" style="display: block; margin: auto;" />

---&twocol
### Some extension examples: `ggmap`

*** =left

```r
baltic <- c(left = min(hydro$long), 
            bottom = min(hydro$lat),
            right = max(hydro$long), 
            top = max(hydro$lat))
map_stamen <- get_stamenmap(baltic, 
  zoom = 5, maptype = "toner-lite")
ggmap(map_stamen) + 
  geom_point(data=hydro, 
  aes(long,lat), size=0.5, 
  color="red") + theme_linedraw()
```

*** =right
<img src="lecture08_plotting_files/unnamed-chunk-48-1.png" title="plot of chunk unnamed-chunk-48" alt="plot of chunk unnamed-chunk-48" width="504" />


--- &slide_no_footer .segue bg:#EEC900

# Your turn...

--- &multitext bg:#EEC900
# Quiz 1: Syntax
  
Complete the following code snippet (fill in the ... gaps)  to create the plot you need 
for answering the question below. 

```r
library(ggplot2)

p <- ...(... = mtcars, ...(wt, mpg, label = rownames(mtcars)))
... + geom_point(...(size = gear)) ...
geom_text(...(colour = factor(cyl)), hjust = 0, nudge_... = 0.05)
```

1. Find the car model in the 'mtcars' dataset with the lowest mpg (=Miles per(US) gallon) value in its 4 cyl(inder) class that also has the lowest number of (forward) gears. Which position in the alphabet has the first letter of this model?

*** .hint
<small>You have to fill in 4 times a function name, 2 times a (partial) argument, 1 symbol (which is in fact also a function), and 1 object name. </small>

*** .explanation
1. <span class='answer'>20</span>


--- &radio bg:#EEC900
# Quiz 2: Get to know geom_functions

Which of these function is NOT a `geom_function`?

1. geom_hex
2. geom_linerange
3. geom_label
4. geom_ribbon
5. _geom_trend_
6. geom_sf
7. geom_crossbar

*** .hint
<small>The webside http://ggplot2.tidyverse.org/reference/ provides an overview of all geom_functions</small>

--- &exercise
# Small exercises with the ICES hydro dataset

1. What happens if you make a scatterplot of station (x) vs temp (y)? Why is the plot not useful? What would be a better plot?
2. What happens if you make a boxplot of cruise (x) vs psal (y)? Why is this plot less suitable? What could be an alternative?


--- &slide_no_footer .segue bg:#CD2626

# How do you feel now.....?

--- &vcenter
## Totally confused?
                
<img src="img/Comic_confused.png" title="plot of chunk unnamed-chunk-50" alt="plot of chunk unnamed-chunk-50" width="400px" style="display: block; margin: auto;" />

Try to reproduce some of the plots in this presentation and the quiz and
read [chapter 3] (http://r4ds.had.co.nz/data-visualisation.html) on data visualization in 'R for Data Science' .

--- &vcenter
## Totally bored?
                
<img src="img/Comic_bored.png" title="plot of chunk unnamed-chunk-51" alt="plot of chunk unnamed-chunk-51" width="800px" style="display: block; margin: auto auto auto 0;" />

Then figure out how to get a CTD profile in ONE panel!

---
## Totally content?
Then go grab a coffee, lean back and enjoy the rest of the day...!

<img src="img/Comic_hammock.png" title="plot of chunk unnamed-chunk-52" alt="plot of chunk unnamed-chunk-52" width="600px" style="display: block; margin: auto;" />


--- &thankyou

