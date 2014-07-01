<!--
%\VignetteEngine{knitr::rmarkdown}
%\VignetteIndexEntry{Introduction to R - Activity}
-->


# Introduction to R activity

Cut-and-paste the following commands into a **new script** and then run those commands directly from the script using `Ctrl-R` (PC) or `Command-Enter` (Mac).


```r
x = 1:10
y = rep(c(1,2), each=5)
m = lm(y~x)
s = summary(m)
s$r.squared
```

```
## [1] 0.7576
```

Now, look at the result of each line


```r
x
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

```r
y
```

```
##  [1] 1 1 1 1 1 2 2 2 2 2
```

```r
m
```

```
## 
## Call:
## lm(formula = y ~ x)
## 
## Coefficients:
## (Intercept)            x  
##       0.667        0.152
```

```r
s
```

```
## 
## Call:
## lm(formula = y ~ x)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -0.424 -0.167  0.000  0.167  0.424 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)   
## (Intercept)   0.6667     0.1880    3.55   0.0076 **
## x             0.1515     0.0303    5.00   0.0011 **
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.275 on 8 degrees of freedom
## Multiple R-squared:  0.758,	Adjusted R-squared:  0.727 
## F-statistic:   25 on 1 and 8 DF,  p-value: 0.00105
```

For those who are familiar with linear regression, this may look familiar. [Back to slide.](../intro.html)
