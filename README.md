# Guide and tips to use SIE API

Banco de Mexico has developed an API for developers, analysts and researchers for automatically retrieve the databases from the SIE. In this repository I share tips to use R tools to use this useful API.

```diff
# ⚠️ The views and conclusions presented in this Repository are exclusively  #
#     the responsibility of the author and do not necessarily reflect those  #
#     of Banco de México.                                                    #
```

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview

The [Economic Information System](https://www.banxico.org.mx/SieInternet/), known as __SIE__, is published by the [Banco de Mexico](https://www.banxico.org.mx/indexen.html) to share the archive of different economic databases gathered by this Central Bank.  

Additionally, Banco de Mexico has developed an API that allows people to consult the different time series and indices published in the SIE. You can have access to this API with this computational languages: JavaScript, Java, C#, and R. 

The aim of this repository is to show __how to use SIE's API in R__. More details of the API can be found in the [official webpage](https://www.banxico.org.mx/SieAPIRest/service/v1/?locale=en).

## Getting prepared
As mentioned before, in this repository we will focus in how to use SIE API with R.  

#### Request a token
The first step is to get a Bmx-Token. You can request a 64-alphanumeric token in [this link](https://www.banxico.org.mx/SieAPIRest/service/v1/token), which would be required to use the API.  

#### Installation of R-package
Banco de Mexico developed a package for R called `siebanxicor` for developers, analysts and researchers for automatically retrieve economic databases published in the SIE by Banco de Mexico. You can install it by running the next line:
```{r}
install.packages("siebanxicor")
```

More details of the `siebanxicor` R-package can be found [here](https://cran.r-project.org/web/packages/siebanxicor/siebanxicor.pdf).

## Features of `siebanxicor`

The `siebanxicor` R-package has five utility functions to retrieve information from the databases published by the Mexican Central Bank: 

- `setToken` - while the Bnx-Token is the key to access SIE API, the `setToken` function is the knob that opens the channel to and connects to this API. This utility function should be called before any other function from the siebanxicor package.  

- `getSeriesData` - requests the time series data from the SIE, up to 100 series at a time. It returns a vector with the requested information.  

- `getSeriesMetadata` - retrieves [metadata](https://en.wikipedia.org/wiki/Metadata) for the requested series.  

- `getSerieDataFrame` - allows to get a data.frame from <u>only one</u> time series of the vector returned by the `getSeriesData` utility function.  

- `getSeriesCurrentValue` - requests the time series data from the SIE, up to 100 series at a time, returning a data.frame with only the <u>last value</u> of the requests time series.  

_Note: In some cases, to use one of these functions you should previously use another(s) of the mentioned functions; for example, to use `getSeriesMetadata` you should previously call `setToken` and `getSeriesData`._  

<br>

Additionally, I have created a customed support function that can be found in the __src__ folder of this repo, for helping analysts and researchers to easily explore the time series:  

- `SIE_function` - when giving the names of the code of different series, prints a plot of the series and metadata, and returns [tidy data](https://www.jstatsoft.org/article/view/v059i10) in data.frame format of the requested series.

## Usage

To show the usage of the SIE API with `siebanxicor` R-package, we will go through an example using the time series for the of the __Annual counterfeit domestic banknotes detected for the current denomination in circulation__: 20, 50, 100, 200, 500 and 1000 pesos  (series __SM1249__, __SM1250__, __SM1251__, __SM1252__, __SM1253__, __SM1254__).

[⭐️ Click here](https://www.banxico.org.mx/SieAPIRest/service/v1/doc/catalogoSeries) to look for the complete catalogue of the SIE's time series published by Banco de Mexico.

#### 1. Load library

After the `siebanxicor` package is installed, load this library and also the tidyverse library.
```{r load libraries}
library("siebanxicor")
library("tidyverse")
```

#### 2. Use `setToken(token)`

Bring your token and open the SIE API channel with the `setToken` utility function.
```{r bring and set token, warning=FALSE}
# bring the token
token_file <- read.csv("../token/SIE_Token.csv", header=FALSE)

# set the token
setToken(token_file$V2)
```
_Notes:_  
- _If you don't have a token to use SIE API, [**click here**](https://www.banxico.org.mx/SieAPIRest/service/v1/token) to access the official website and obtain one._  
- _I add a csv file where users should paste and save their token to run this example._  


#### 3. Get data with `getSeriesData(series, startDate, endDate)`

Get the time series of interest, in this case the series of the annual counterfeit of mexican banknotes per denomination, using the `getSeriesData` function.
```{r getting series}
# setting the variables
my_series <- c("SM1249", "SM1250", "SM1251", "SM1252", "SM1253", "SM1254")
my_start <- '2015-01-01'
my_end <- Sys.Date() #looks for today's date

# getting the series
series <- getSeriesData(my_series, my_start, my_end)
```
_Note: to use the `getSeriesData` function, you should previously call `setToken`._


#### 4. Get the metadata with `getSeriesMetadata(series, locale)`

This function returns the general information of series. To select the language of the metadata, set the _locale_ variable as "en" for English, and "es" for Spanish.

```{r getting metadata}
# getting the metadata
metadata <- getSeriesMetadata(my_series, locale="en")
```

_Note: to use the `getSeriesMetadata` function, you should previously call `setToken`._


#### 5. Get a data frame of one series using `getSerieDataFrame(series, idSerie)`

This function will be helpful to get a data frame for the annual counterfeit number of 500 pesos banknotes (__SM1253__ series), from the vector returned by the `getSerieDataFrame` in the previous point #3.

```{r get SM1255 df}
# getting the series
df_SM1255 <- getSerieDataFrame(series, "SM1255")
```
_Note: to use the `getSerieDataFrame` function, you should previously call `setToken` and `getSerieData`._


#### 6. Get the last value of one or more series with `getSeriesCurrentValue(series)`

To get the last value of the annual counterfeit banknotes per denomination series, we will use the `getSeriesCurrentValue` function.

```{r last value}
df_last_value <- getSeriesCurrentValue(my_series)
```
_Note: to use the `getSeriesCurrentValue` function, you should previously call `setToken`._


#### 7. Use the customed function `SIE_function(series_codes, series_names, title_plot, x_lab, y_lab, startDate, endDate, route)`

This function prints the metadata for the Annual Counterfit Banknotes series, prints and saves and their plot, and returns a data frame with these series in tidy format.

```{r custome function}
# call the customed function from an RScript
source("SIE_function.R")

# setting the variables
my_series <- c("SM1249", "SM1250", "SM1251", "SM1252", "SM1253", "SM1254")
my_names <- c("20", "50", "100", "200", "500", "1000")
my_title <- "Annual Counterfeit Banknotes per Denomination"
my_start <- '2010-01-01'
my_end <- Sys.Date() #looks for today's date

# run the function
df <- sie_function(my_series, my_names, my_title, route="../img/",
             y_lab="Number of Pieces", x_lab="Year", startDate=my_start)
```

In this case, the function plots the series for the Annual Counterfeit of Banknotes per denomination as follows.

<center><img class="center" src="img\Annual Counterfeit Banknotes per Denomination.png" width="65%" height="65%" class="center"></center>

## License
If you use Banco de Mexico's SIE API, you must clearly state the source and include a reference to Banco de México's URL address to enable third parties to verify the information's accuracy. For more details, look into the [Disclaimer](https://www.banxico.org.mx/footer-en/disclaimer-usage-policies-ban.html) shared by the Central Bank.

Additionally, the materials of this repository are of public domain. If re-using/re-mixing the material, please provide attribution and link to the repository webpage.

## References

<div id="refs" class="references">

<div id="ref-sie">
Banco de Mexico. 2020. Economic Information System (SIE).
<https://www.banxico.org.mx/SieInternet/>
</div>
<br>
<div id="ref-sie_api">
Banco de Mexico. 2020. SIE API.
<https://www.banxico.org.mx/SieAPIRest/service/v1/?locale=en>
</div>
<br>
<div id="ref-tidydata">
Wickham, Hadley. 2014. "Tidy Data". Journal of Statistical Software, Articles. Volume 59, number 10. DOI: 10.18637/jss.v059.i10
<https://www.jstatsoft.org/article/view/v059i10>
</div>

</div>

