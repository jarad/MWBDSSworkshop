ISDSWorkshop
============

An R package for the Introduction to R for Biosurveillance [pre-conference training](http://www.syndromic.org/annual-conference/2015-isds-conference/pre-conference-trainings) for the [International Society for Disease Surveillance](http://www.syndromic.org/).

Prior to the conference, please install R, Rstudio (not required, but highly recommended), and the ISDSWorkshop R package. 
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
It provides an improved interface to R, but has [projects](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects) which help to quickly switch between (oddly enough) projects. 
Go to <http://www.rstudio.com/products/rstudio/download/> and choose the correct platform under **Installers for ALL Platforms**. 
Install like any other program. 


## Install the ISDSWorkshop R package (should not require administrator privileges)

Start RStudio (or R GUI if you did not install RStudio). 
At the command prompt (`>`) in the Console window of R, copy-paste the following code. This will download and install a number of packages that we will need and create vignettes (this could take a while). 

    install.packages("devtools")
    devtools::install_github("jarad/ISDSWorkshop")

If asked to create a `personal library`, please say `yes`. 

### Exit R

Regardless of which method above you used. You can exit out of R by copy-pasting the following command. 

    q("no")



