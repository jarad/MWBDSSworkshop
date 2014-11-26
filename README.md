ISDSWorkshop
============

An R package for the Introduction to R for Biosurveillance workshop for the International Society for Disease Surveillance.

Prior to the conference, please install R, Rstudio (not required, but highly recommended) and the ISDSWorkshop R package. 
You will need to have internet access to install everything.

## Install R

Please go to <http://www.r-project.org/> and click on [download R](http://cran.r-project.org/mirrors.html). You will be asked to select a [CRAN mirror](http://cran.r-project.org/mirrors.html). I select <http://streaming.stat.iastate.edu/CRAN/> since it is the location nearest to me geographically. Feel free to select this one or the one nearest to you. In the download and install R section, Click on the correct link depending on your operating system: Linux, (Mac) OS X, or Windows. 

### Windows

Click on **base** and then the link to Download R X.X.X for Windows (where the X will be numbers representing the current version of R). Install this program like any other program on Windows using the all defaults.

### (Mac) OS X

Click on the appropriate **.pkg** file depending on which version of Mac OS X you are using. Install this program like any other program on OS X using the all defaults. 

### Linux

If you are using Linux, then I trust you know what you are doing. You can install R in this fashion or you can use a package manager. 

## Install RStudio

Go to <http://www.rstudio.com/products/rstudio/download/> and choose the correct platform under **Installers for ALL Platforms**. Install like any other program. 


## Install the ISDSWorkshop R package

1. Start RStudio (or R GUI if you did not install RStudio). 
1. At the command prompt (`>`) in the Console window, copy-paste the following code which will install the ISDSWorkshop package as well as a number of other package.

        install.packages(c("ggplot2","gridExtra","knitr","maps",
                           "plyr","reshape2","rmarkdown","xtable"))
        download.file("https://github.com/jarad/ISDSWorkshop/releases/download/v0.1/ISDSWorkshop_0.1.tar.gz",
                      "ISDSWorkshop")
        install.packages("ISDSWorkshop", repos = NULL, type = "source")

1. To check that everything installed properly, type `library(ISDSWorkshop)` at the command prompt. If there is no message, then everything installed properly.



## Start the workshop

To start the workshop (this will be done at the [ISDS pre-conference training](http://www.syndromic.org/annual-conference/2014-isds-conference)), start R, change your working directory, and type

    library(ISDSWorkshop)
    workshop()

