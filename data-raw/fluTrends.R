# https://www.google.org/flutrends/about/data/flu/historic/us-historic-v3.txt

fluTrends = readr::read_csv("us-historic-v3.txt",
                            skip = 15)

usethis::use_data(fluTrends, overwrite = TRUE)
