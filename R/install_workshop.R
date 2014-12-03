# A script to install the ISDSWorkshop. 

# Install packages that ISDSWorkshop depends on
packages = c("ggplot2","gridExtra","knitr","maps", "plyr","reshape2","rmarkdown","xtable", "SpatialEpi", "xtable", "downloader"))
for (package in packages) {
  if (!require(package)) install.packages(package, repos="http://cran.us.r-project.org")
}

# Download and install workshop package
library(downloader)
download("https://github.com/jarad/ISDSWorkshop/releases/download/v0.1/ISDSWorkshop_0.1.tar.gz",
          "ISDSWorkshop.tar.gz", mode="wb")
install.packages("ISDSWorkshop.tar.gz", repos = NULL, type = "source")
