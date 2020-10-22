# SIE API use

## Overview

The [Economic Information System](https://www.banxico.org.mx/SieInternet/), known as __SIE__, was developed by the [Banco de Mexico](https://www.banxico.org.mx/indexen.html) to share the archive of different databases gathered by this Central Bank.  

Additionally, Banco de Mexico has developed an API that allows people to consult the different time series published in the SIE. You can have access to this API with this computational langugages: Javascript, Java, C#, and R. 

The aim of this repository is to show __how to use SIE's API in R__. More details of the API can be found in the [official webpage](https://www.banxico.org.mx/SieAPIRest/service/v1/?locale=en).

## Getting prepared
As mentioned before, in this repository we will focus in how to use SIE API with R.

### Request for the API's token
The first is to get your Bmx-Token. You can request you 64-alphanumeric token in [this link](https://www.banxico.org.mx/SieAPIRest/service/v1/token), which would be requiered to use the API.

### Intro to `siebanxicor` R-package

Banco de Mexico develop a package for R called as `siebanxicor`. Install it runing:
```{r}
install.packages("siebanxicor")
```

After installed, you can call it in R or RStudio as follows
```{r}
library("siebanxicor")
```

## Examples



## License
If you use Banco de Mexico's SIE API, you must clearly state the source and include a reference to Banco de México's URL address so as to enable third parties to verify the information's accuracy. For more details, I recommend to look into the [Disclaimer](https://www.banxico.org.mx/footer-en/disclaimer-usage-policies-ban.html) shared by the Central Bank.

Additionally, the materials of this repository are of public domain. If re-using/re-mixing the material, please provide attribution and link to the repository webpage.

## References


