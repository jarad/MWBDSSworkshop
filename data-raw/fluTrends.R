# https://www.google.org/flutrends/about/data/flu/historic/us-historic-v2.txt

fluTrends = readr::read_csv("us-historic-v2.txt",
                            skip = 8)[,c(1,3:53)]

usethis::use_data(fluTrends, overwrite = TRUE)
