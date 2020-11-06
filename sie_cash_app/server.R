# Load libraries
library("siebanxicor")
library("tidyverse")
library("reshape2")
library("shinydashboard")

# Define server logic ----
server <- function(input, output, session) {
  # SERIES
  output$selectOut <- renderText({ input$select_series })
  
  ## bring and set token
  token_file <- read.csv("../token/SIE_Token.csv", header=FALSE)
  setToken(token_file$V2)
  
  # variables for the SIE API
  series <- reactive({ input$select_multiple_series })
  start_date <- reactive({ input$select_dates[1] })
  end_date <- reactive({ input$select_dates[2] })
  plot_title <- reactive({ input$text1 })
  x_lab <- reactive({ input$text2 })
  y_lab <- reactive({ input$text3 })
  show_data_op <- reactive({ input$show_data_op })
  
  # get series data from 'siebanxicor'
  series_data <- reactive({ getSeriesData(series(), start_date(), end_date()) })
  
  # get a data.frame for each serie
  df <- reactive({ data.frame() }) #reactive({ data.frame(col.names = c('date', 'value', 'series')) })
  n <- reactive({ 1 })
  
  df_1 <- reactive({ getSerieDataFrame(series_data(), series()[1]) %>%
      mutate(series = series()[1]) })

  df_2 <- reactive({ getSerieDataFrame(series_data(), series()[2]) %>%
      mutate(series = series()[2]) })

  df_3 <- reactive({ getSerieDataFrame(series_data(), series()[3]) %>%
      mutate(series = series()[3]) })
  
  df_4 <- reactive({ getSerieDataFrame(series_data(), series()[4]) %>%
      mutate(series = series()[4]) })
  
  df_5 <- reactive({ getSerieDataFrame(series_data(), series()[5]) %>%
      mutate(series = series()[5]) })
  
  df_6 <- reactive({ getSerieDataFrame(series_data(), series()[6]) %>%
      mutate(series = series()[6]) })
  
  df_7 <- reactive({ getSerieDataFrame(series_data(), series()[7]) %>%
      mutate(series = series()[7]) })
  
  df_8 <- reactive({ getSerieDataFrame(series_data(), series()[8]) %>%
      mutate(series = series()[8]) })
  
  df_9 <- reactive({ getSerieDataFrame(series_data(), series()[9]) %>%
      mutate(series = series()[9]) })
  
  df_10 <- reactive({ getSerieDataFrame(series_data(), series()[10]) %>%
      mutate(series = series()[10]) })
  
  # merge the ten data.frame series
  df <- reactive({ rbind(df_1(), df_2(), df_3(), df_4(), df_5(),
                         df_6(), df_7(), df_8(), df_9(), df_10() ) })

  # PLOT
  output$plot_series <- renderPlot({
    ggplot(data = df(), aes(x=date, y=value, color=series)) +
      geom_line(size=1, alpha=0.8) + 
      labs(title = plot_title(),
           x = x_lab(), y = y_lab(),
           colour = 'Series') +
      # scale_color_brewer(palette="Set1") +
      theme_bw()
  }, height = 340, width = 500)
  
  # METADATA
  my_header <- c("Series", "Description", "Start", "End", "Frequency", "Data type", "Units")
  output$meta_data <- renderTable({
    series() %>%
      getSeriesMetadata(locale='en') %>% 
      mutate(startDate = as.character(startDate)) %>% 
      mutate(endDate = as.character(endDate)) %>% 
      rename_all(~my_header)
  })
  
  #selectInput
  output$selectOut <- renderText({ input$select_series })
  
  #selectInput
  output$selectOutMultiple <- renderPrint({ input$select_multiple_series }) #renderPrint
  
  # dateRangeInput
  output$datesOut <- renderText({ paste("from", input$select_dates[1], "to", input$select_dates[2]) })
  
  # textInput
  output$textOut1 <- renderText({ input$text1 })
  output$textOut2 <- renderText({ input$text2 })
  output$textOut3 <- renderText({ input$text3 })
  
  # DATABASE
  output$show_data <- renderText({ paste("(Showing data in ", input$show_data_op, "format)") })
  my_df <- reactive({ 
    if (show_data_op() == "wide"){
      df() %>% mutate(date = as.character(date)) %>% dcast(date~series)
    }else{
      df() %>% mutate(date = as.character(date))
    }
  })
  output$df_series <- renderTable({ my_df() })

  # DOWNLOAD DATA
  output$downloadData <- downloadHandler(
    # function that returns a string which tells the client
    # browser what name to use when saving the file.
    filename = function() {
      paste(input$text1, "csv", sep = ".")
    },
    # function that writes the file
    content = function(file) {
      write.csv(my_df(), file)
    }
  )
}
