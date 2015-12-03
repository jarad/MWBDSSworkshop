packages = c("ggplot2", "gridExtra", "knitr", "maps", "mapproj", "MMWRweek",
             "plyr", "RColorBrewer", "reshape2", "rmarkdown", "SpatialEpi", "xtable")
install.packages(packages)

download.file("http://www.jarad.me/ISDSWorkshop_0.2.tar.gz", "ISDSWorkshop.tar.gz", mode="wb")
install.packages("ISDSWorkshop.tar.gz", repos = NULL, type = "source")

installed = packages %in% installed.packages()[,1]

if (any(!installed)) warning("These packages are missing: ", packages[!installed])

if (require(ISDSWorkshop)) message("\n    ISDS R Workshop installed succesfully!\n")

