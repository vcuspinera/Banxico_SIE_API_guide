## Dashboard

### Description

The goal of this dashboard is to help users to easily explore time series from [SIE API](https://www.banxico.org.mx/SieAPIRest/service/v1/). In this case, the app is focus on currency series, but it could be expanded in the future.

It includes different options to select up to 10 series, in a given date range, with the possibility of changing the title and label of the plot, select a format to present the database, and a button to download the series' database in the select format.

### Sketch

<center><img src="..\img\sie_app - sketch.png" width="100%" height="80%"></center>

### Run it!

There are different options to run this app:

- __App file__: Open the file `app.R` located in the [sie_app folder](https://github.com/vcuspinera/SIE_API_guide/tree/main/sie_app), and click on `▶️ Run App`.

- __R project__: Open the R project of this repository named as `SIE_API_guide.Rproj`, and run in the console:
```r
shiny::runApp("sie_app")
```

- __Terminal__: Open the terminal and, from the main folder of this repository, run the following line:
```
Rscript -e 'library(methods); shiny::runApp("sie_app/", launch.browser = TRUE)'
```