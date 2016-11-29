## ---- message=FALSE------------------------------------------------------
library('ggplot2')
library('dplyr')
library('tidyr')
library('RColorBrewer') 
library('ISDSWorkshop')
workshop(launch_index=FALSE)

## ------------------------------------------------------------------------
# Read csv files and create additional variables
icd9df = read.csv("icd9.csv")
GI     = read.csv("GI.csv") %>%
  mutate(
    date      = as.Date(date),
    weekC     = cut(date, breaks="weeks"),
    week      = as.numeric(weekC),
    weekD     = as.Date(weekC),
    facility  = as.factor(facility),
    icd9class = factor(cut(icd9, 
                           breaks = icd9df$code_cutpoint, 
                           labels = icd9df$classification[-nrow(icd9df)], 
                           right  = TRUE)),
    ageC      = cut(age, 
                    breaks = c(-Inf, 5, 18, 45 ,60, Inf)),
    zip3      = trunc(zipcode/100))

## ------------------------------------------------------------------------
ga_l <- GI %>%
  group_by(gender, ageC) %>%
  summarize(count = n())

ga_w <- ga_l %>%
  spread(ageC, count) %>%
  print(row.names = FALSE)

## ------------------------------------------------------------------------
library('xtable')
tab = xtable(ga_w,
             caption = "Total GI cases by Sex and Age Category",
             label   = "myHTMLanchor",
             align   = "ll|rrrrr") # rownames gets a column

## ------------------------------------------------------------------------
print(tab, file="table.html", type="html", include.rownames=FALSE)

## ------------------------------------------------------------------------
print(tab, type="html", include.rownames=FALSE)

## ---- results='asis'-----------------------------------------------------
print(tab, type="html", include.rownames=FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  # Summarize data by facility and age category
#  
#  # Reshape data from long to wide format
#  
#  # Create HTML table
#  
#  # Save HTML to file
#  
#  # Copy-and-paste table into Word

## ------------------------------------------------------------------------
library('maps')
states = map_data("state")
ggplot(states, aes(x = long, y = lat, group = group)) + 
  geom_polygon(color="white")

## ------------------------------------------------------------------------
counties = map_data("county")
ggplot(counties, aes(x = long, y = lat, group = group)) + 
  geom_polygon(color = "white")

## ------------------------------------------------------------------------
ggplot(counties %>% filter(region=="iowa"), 
       aes(x = long, y = lat, group = group)) + 
  geom_polygon(fill = "gray", color = "black")

## ------------------------------------------------------------------------
fluTrends = read.csv("fluTrends.csv", check.names=FALSE)

## ------------------------------------------------------------------------
nr = nrow(fluTrends)
flu_w = fluTrends[(nr-11):nr, c(1,3:53)]
dim(flu_w)

## ------------------------------------------------------------------------
flu_l <- flu_w %>%
  gather(region, index, -Date)

## ------------------------------------------------------------------------
head(unique(states$region))
flu_l$region = tolower(flu_l$region)
states_merged = merge(states, flu_l, sort=FALSE, by='region')

## ------------------------------------------------------------------------
states_merged$Date = as.Date(states_merged$Date)
mx_date = max(states_merged$Date)
ggplot(states_merged %>% filter(Date == mx_date), 
       aes(x = long, y = lat, group = group, fill = index)) + 
  geom_polygon() + 
  labs(title=paste('Google Flu Trends on', mx_date), x='', y='') +
  theme_minimal() + 
  theme(legend.title = element_blank()) +
  coord_map("cylindrical") + 
  scale_fill_gradientn(colours=brewer.pal(9,"Reds")) # Thanks Annie Chen

## ------------------------------------------------------------------------
ggplot(states_merged, 
       aes(x=long, y=lat, group=group, fill=index)) + 
  geom_polygon() + 
  labs(title='Google Flu Trends', x='', y='') +
  theme_minimal() + 
  theme(legend.title = element_blank()) +
  facet_wrap(~Date) + 
  coord_map("cylindrical") + 
  scale_fill_gradientn(colours=brewer.pal(9,"Reds")) 

## ---- eval=FALSE---------------------------------------------------------
#  # Construct Google Flu Trends map

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("ggplot2")

## ---- eval=FALSE---------------------------------------------------------
#  # install.packages("devtools")
#  library('devtools')
#  install_github('nandadorea/vetsyn')

## ---- eval=FALSE---------------------------------------------------------
#  source("http://bioconductor.org/biocLite.R")
#  biocLite()

## ---- eval=FALSE---------------------------------------------------------
#  biocLite("edgeR")

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("ISDSWorkshop_0.3.tar.gz",
#                   repos = NULL,
#                   type  = "source")

## ------------------------------------------------------------------------
library('SpatialEpi')

## Load Pennsylvania Lung Cancer Data
data(pennLC)
data <- pennLC$data

## Process geographical information and convert to grid
geo <- pennLC$geo[,2:3]
geo <- latlong2grid(geo)

## Get aggregated counts of population and cases for each county
population <- tapply(data$population, data$county, sum)
cases      <- tapply(data$cases,      data$county, sum)

## Based on the 16 strata levels, compute expected numbers of disease
n.strata       <- 16
expected.cases <- expected(data$population, data$cases, n.strata)

## Set Parameters
pop.upper.bound <- 0.5
n.simulations   <- 999
alpha.level     <- 0.05
plot            <- TRUE

## ------------------------------------------------------------------------
clr = cases/population
clr = 1-clr/max(clr) # make sure range is (0,1)
plot(pennLC$spatial.polygon, axes=TRUE, col=rgb(1, clr, clr))

## ------------------------------------------------------------------------
## Kulldorff using Binomial likelihoods
binomial <- kulldorff(geo, cases, population, NULL, pop.upper.bound, n.simulations, 
  alpha.level, plot)
cluster <- binomial$most.likely.cluster$location.IDs.included

## plot
plot(pennLC$spatial.polygon,axes=TRUE)
plot(pennLC$spatial.polygon[cluster],add=TRUE,col="red")
title("Most Likely Cluster")

## ---- eval=FALSE---------------------------------------------------------
#  # Install the surveillance package

## ------------------------------------------------------------------------
add = function(a,b) {
  return(a+b)
}
add(1,2)

## ------------------------------------------------------------------------
add_vector = function(v) {
  sum = 0
  for (i in 1:length(v)) sum = sum + v[i]
  return(sum)
}

## ------------------------------------------------------------------------
alert = function(y,threshold=100) {
  # y is the time series 
  # an alert is issue for any y above the threshold (default is 100)
  factor(ifelse(y>threshold, "Yes", "No"))
}

## ------------------------------------------------------------------------
GI_w <- GI %>%
  group_by(weekD) %>%
  summarize(count = n())

GI_w$alert = alert(y = GI_w$count, threshold = 150)

ggplot(GI_w, aes(x = weekD, y = count, color = alert)) + 
  geom_point() + 
  scale_color_manual(values = c("black","red"))

## ---- eval=FALSE---------------------------------------------------------
#  # Read in the data perhaps as a csv file
#  
#  # Create some table and save them to html files
#  
#  # Create some figures and save them to jpegs
#  
#  # Run some outbreak detection algorithms and produce figures

## ---- eval=FALSE---------------------------------------------------------
#  source("script.R")

## ---- eval=FALSE---------------------------------------------------------
#  install.packages('shiny')
#  library('shiny')
#  runGitHub('NLMichaud/WeeklyCDCPlot')

