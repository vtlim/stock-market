
library(stringr) # for str_extract

### first let's check out a single stock
filename <- 'ETFs/aadr.us.txt'
# extract the stock symbol, after / and before 1st .
filesym = str_extract(filename, "(?<=\\/)(.*?)(?=\\.)")
d1 <- read.csv(filename)
# create a new column for stock symbol
d1$Symbol = filesym
# plot high and low versus time


# now load in all data to analyze in aggregate
dataFiles <- lapply(Sys.glob("ETFs/*.txt"), read.csv)
dataFiles

