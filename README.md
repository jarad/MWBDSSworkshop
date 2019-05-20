Midwest Big Data Summer School - R Workshop
============

An R package for the [Midwest Big Data Summer School R workshop](http://mbds.cs.iastate.edu/2019/).

Prior to the workshop, please install R, 
RStudio (not required, but highly recommended), 
and the MWBDSSworkshop R package. 
You will need to have internet access and administrator privileges to install everything.

## Install R (may require administrator privileges)

Please go to <http://www.r-project.org/> and click on [download R](http://cran.r-project.org/mirrors.html). You will be asked to select a [CRAN mirror](http://cran.r-project.org/mirrors.html). I select <https://rweb.crmda.ku.edu/cran/> as it is geographically close and uses the secure http protocol (HTTPS). In the download and install R section, Click on the correct link depending on your operating system: Linux, (Mac) OS X, or Windows. 

### Windows

Click on **base** and then the link to Download R X.X.X for Windows (where the X will be numbers representing the current version of R). Install this program like any other program on Windows using all the defaults.

### (Mac) OS X

Click on the appropriate **.pkg** file depending on which version of Mac OS X you are using. Install this program like any other program on OS X using all the defaults. 

### Linux

If you are using Linux, then I trust you know what you are doing. You can install R from source or you can use a package manager. 


## Install RStudio (may require administrator privileges)

The installation of RStudio is optional, but highly recommended. 
It provides an improved interface to R, but has [projects](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects) which help to quickly switch between projects. 
Go to <https://www.rstudio.com/products/rstudio/download/#download> and choose the correct platform under **Installers for ALL Platforms**. 
Install like any other program. 


## Install CRAN packages (should not require administrator privileges)

Start RStudio (or R GUI if you did not install RStudio). 
At the command prompt (`>`) in the Console window of R, copy-paste the following code. This will download and install a number of packages that we will need and create vignettes (this could take a while). 
You will need internet access during this process.

    install.packages(c("devtools","tidyverse"))

If it asks you to choose a repository, 
choose a repository that is geographically close to you.
If asked to create a `personal library`, say `yes`. 

This will install a "large" number of packages as these packages depend on a 
number of other packages. 

### Test your installation

If you want to test that everything is working, in R run 

    library("tidyverse")

which should print out a number of lines that include header lines titled 
"Attaching packages" and "Conflicts".

### Exit R

Regardless of which method above you used, exit R by running

    q("no")

in R.

You should be ready to go. 



# Install MWBDSSworkshop and other packages

To make sure you have the most up to date version of the workshop, 
wait until the day of the workshop to install the Midwest Big Data Summer 
School workshop R package.

## Install the MWBDSSworkshop R package

Start RStudio (or R GUI if you did not install RStudio). 
At the command prompt (`>`) in the Console window of R, copy-paste the following code. This will download and install a number of packages that we will need and create vignettes (this could take a while). 
You will need internet access during this process.

    devtools::install_github("jarad/MWBDSSworkshop")

If it asks you to choose a repository, 
choose a repository that is geographically close to you.
If asked to create a `personal library`, say `yes`. 


### (Optional) Install additional packages

There are a few other packages that will be used lightly or referenced during
the workshop. 
These packages are listed under "Suggests:" in the 
[DESCRIPTION file](https://github.com/jarad/MWBDSSworkshop/blob/master/DESCRIPTION).
To install these packages, in R run

    install.packages(c("xtable","lme4","randomForest",
                       "maps","maptools","mapproj",
                       "gridExtra","RColorBrewer"))
    
A warning will be issued for any packages that could not be installed.


### (Optional) Test your installation

If you want to test that everything is working, in R run 

    MWBDSSworkshop::workshop()

which should open a web-browser with an outline for the workshop. 



### Exit R

Regardless of which method above you used, exit R by running

    q("no")

in R.


