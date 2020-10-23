#' SIE customed function that easily explores the time series
#'
#' @param series A list with the SIE series code
#' @param series_names A list with the SIE's names of the series
#' @param title_plot A string with the name of the plot
#' @param x_lab A string with the name of the x-axis
#' @param y_lab A string with the name of the y-axis
#' @param startDate The starting date of the requested data
#' @param endDate The ending date of the requested data
#' @param route Route to save the plot
#'
#' @return Prints the metadata, prints and save the plot, and returns a tidy dataframe with the series.
#' @export
#'
#' @examples 
#' sie_function(series_NIC, names_NIC, title_NIC, y_lab="Millions of pieces")
#'
sie_function <- function(series, series_names, title_plot="", x_lab="", y_lab="", startDate='2016-01-01', endDate=Sys.Date(), route=""){
    
  # get series data from 'siebanxicor'
  series_data <- getSeriesData(series, startDate, endDate)
  
  # names of series
  names(series) <- series_names
  
  # arranging the data
  df <- data.frame()
  n=1
  for (i in series){
    aux <- getSerieDataFrame(series_data, i)
    aux$serie <- i
    aux$serie_name <- names(series)[n]
    df = rbind(df, aux)
    n = n+1
  }
  
  # sort by specific order
  df$serie_name <- factor(df$serie_name, levels=names(series))
  
  # plot
  plot <- df %>%
    ggplot(aes(x=date, y=value, color=serie_name)) + 
    geom_line(size=1, alpha=0.8) + #, linetype = "twodash") + 
    labs(title=title_plot,
         x=x_lab, y=y_lab, colour = 'Series') +
    scale_color_brewer(palette="Set1") +
    theme_bw()
  
  # save plot
  if (title_plot==""){
    file_name <- "example"
  } else {
    file_name <- title_plot
  }

  # print and save plot
  ggsave(paste0(route, title_plot, ".png"), plot = plot)
  print(plot)
  
  # get and print metadata
  my_metadata <- series %>% getSeriesMetadata(locale='en')
  print(my_metadata)
  
  # returns a tidy data frame with the requested series
  return(df)
}