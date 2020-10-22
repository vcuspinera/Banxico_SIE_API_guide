#' SIE function for plotting and whowing metadata
#'
#' @param my_series A list with the SIE series code
#' @param my_names A list with the SIE's names of the series
#' @param my_title A string with the name of the plot
#' @param x_lab A string with the name of the x-axis
#' @param y_lab A string with the name of the y-axis
#' @param my_start The beginning of the requested data
#' @param my_end The ending of the requested data
#'
#' @return Prints the metadata and plot, and returns the dataframe with the series
#' @export
#'
#' @examples 
#' sie_function(series_NIC, names_NIC, title_NIC, y_lab="Millions of pieces")
#'
sie_function <- function(my_series, my_names, my_title="", x_lab="", y_lab="", my_start='2016-01-01', my_end=Sys.Date()){
  
  # get series data from 'siebanxicor'
  series <- getSeriesData(my_series, my_start, my_end)
  
  # names of series
  names(my_series) <- my_names
  
  # arranging the data
  df <- data.frame()
  n=1
  for (i in my_series){
    aux <- getSerieDataFrame(series, i)
    aux$serie <- i
    aux$serie_name <- names(my_series)[n]
    df = rbind(df, aux)
    n = n+1
  }
  
  # sort by specific order
  df$serie_name <- factor(df$serie_name, levels=names(my_series))
  
  # plot
  plot <- df %>% #filter(!(denom %in% c("total", 10))) %>% 
    ggplot(aes(x=date, y=value, color=serie_name)) + 
    geom_line(size=1, alpha=0.8) + #, linetype = "twodash") + 
    labs(title=my_title,# subtitle="(2016-2020)",
         x=x_lab, y=y_lab, colour = 'Series') +
    scale_color_brewer(palette="Set1") +
    #scale_color_hue(l=40, c=35) 
    #scale_color_manual(values=wes_palette(n=3, name="Royal1")) +
    #scale_color_manual(values=c("dodgerblue4", "salmon", "red", "darkgreen", "darkorange4", "purple")) +
    theme_bw()
  
  # metadata
  my_metadata <- my_series %>% getSeriesMetadata(locale='en')
  print(my_metadata)
  print(plot)
  
  return(df)
}