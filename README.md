# Guide and tips to use SIE API

Banco de Mexico has developed an API for developers, analysts and researchers for automatically retrieve the databases from the SIE. In this repository I share tips to use R tools to use this useful API.

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview

The [Economic Information System](https://www.banxico.org.mx/SieInternet/), known as __SIE__, was developed by the [Banco de Mexico](https://www.banxico.org.mx/indexen.html) to share the archive of different databases gathered by this Central Bank.  

Additionally, Banco de Mexico has developed an API that allows people to consult the different time series and indices published in the SIE. You can have access to this API with this computational languages: JavaScript, Java, C#, and R. 

The aim of this repository is to show __how to use SIE's API in R__. More details of the API can be found in the [official webpage](https://www.banxico.org.mx/SieAPIRest/service/v1/?locale=en).

## Getting prepared
As mentioned before, in this repository we will focus in how to use SIE API with R.  

### Request a token
The first step is to get a Bmx-Token. You can request a 64-alphanumeric token in [this link](https://www.banxico.org.mx/SieAPIRest/service/v1/token), which would be required to use the API.  

### Intro to the R-package
Banco de Mexico developed a package for R called `siebanxicor` for developers, analysts and researchers for automatically retrieve economic databases published in the SIE by Banco de Mexico. You can install it by running the next line:
```{r}
install.packages("siebanxicor")
```

After installed, you can call this package in R or RStudio as follows:
```{r}
library("siebanxicor")
```

More details of the `siebanxicor` R-package can be found [here](https://cran.r-project.org/web/packages/siebanxicor/siebanxicor.pdf).

## Features of `siebanxicor` package

The `siebanxicor` R-package has five utility functions to retrieve the information. 

- `setToken` - while the Bnx-Token is the key to access SIE API, this function is the knob that opens the channel to and connects to this API. This utility function should be called before any other function from the siebanxicor package.  

- `getSeriesData` - requests the time series data from the SIE, up to 100 series at a time. It returns a vector with the requested information.  

- `getSeriesCurrentValue` - this is a function similar to `getSeriesData`, but it returns a vector with only the last value of the requests time series.  

- `getSeriesMetadata` - retrieve [metadata](https://en.wikipedia.org/wiki/Metadata) for the requested series.  

- `getSerieDataFrame` - allows to get a data.frame from only ONE time series of the vector returned by the `getSeriesData` utility function.  

_Note: In some cases, to use one of these functions you should previously use another(s) of the mentioned functions; for example, to use `getSeriesMetadata` you should previously call `setToken` and `getSeriesData`._  
  
Additionally, I have created a customed support function that can be found in the __src__ folder of this repo, for helping analysts and researchers to easily explore the time series:  

- `SIE_function` - when giving the names of the code of different series, prints a plot of the series and metadata, and returns [tidy data](https://www.jstatsoft.org/article/view/v059i10) in data.frame format of the requested series.

## Usage


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

