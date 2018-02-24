# Stock Market Exploratory Analysis
Version: 2018 Feb 23

## Resources
* Introductory R material: `intro.R` and related data sets from [UCI data science course][1]
* [Stock market data set from Kaggle][2]
* [R reference sheet][3]
* [R forecast documentation][6]

## Contents
* `data_files`
* `intro.R` - Simple, commented script on getting acquainted with R.
* `work.R` - Analysis work.

## Details on stock market data set
* There are two categories of data: exchange-traded funds (ETFs) and stocks.
* The information on each company or exchange is listed in its own text file, labeled as `[stock-symbol].us.txt`.
* Each text file lists the following information:
   * Date
   * Open - opening price of the day
   * High - highest price of the day
   * Low - lowest price of the day
   * Close - closing price of the day
   * Volume - amount traded that day
   * OpenInt - open interest (total number of trades that have not yet been liquidated) [see Investopedia][4]
* A representative text file is structured as comma-separated values in this order:
   |Date      |Open  |High  |Low   |Close |Volume|OpenInt|
   |----------|------|------|------|------|------|-------|
   |2011-02-01|24.092|24.226|24.092|24.226|827   |0      |
   |2011-02-02|23.934|23.934|23.759|23.759|827   |0      |
   |2011-02-04|23.739|23.739|23.724|23.724|22177 |0      |
   |2011-02-08|24.064|24.074|24.064|24.074|1886  |0      |

* Numerical details on the data set:
   * 8539 total entries
   * 1344 ETFs
   * 7195 stocks
   * Dates range from: XXXX to 2017-11-10.
   * XXX-XXX lines per text file



## Potential questions to probe
* What is the average trend of the stock market? (should be upwards) (validate with online stock trends)
* What stock has the best forecast outlook? (maybe measured in magnitude of difference from Nov 2017 to forecast end)
* What are the best/worst performers? (most upwards/downwards trend)
* What sectors performs best/worst? (will need to obtain sector information)
* What day and stock had the highest close-minus-open difference? (is there related news coverage)
*  What day and stock had the highest high-minus-low difference? (is there related news coverage)
* What is the correlation time in the market? A few days? A couple of weeks?

### Other interesting things:
* [Quantifying correlation between financial news and stocks][5]


[1]: https://ce.uci.edu/courses/sectiondetail.aspx?year=2018&term=WINTER&sid=00133
[2]: https://www.kaggle.com/borismarjanovic/price-volume-data-for-all-us-stocks-etfs
[3]: https://www.rstudio.com/wp-content/uploads/2016/05/base-r.pdf
[4]: https://www.investopedia.com/terms/o/openinterest.asp
[5]: http://ieeexplore.ieee.org/document/7850021/?reload=true
[6]: https://cran.r-project.org/web/packages/forecast/forecast.pdf


