# Load libraries
library("shiny")
library("shinydashboard")
library("shinyWidgets")

# call the list of cash time series
source("cash_list_series.R")


# Define UI ----
ui <- fluidPage(
  
  ###########################
  ##### Head of the app #####
  ###########################
  
  titlePanel("Banknotes and coins series"),
  h5("Dashboard that explores Cash time series published \
     by Banco de Mexico and retrieved with the ",
     a("SIE API.", href = "https://www.banxico.org.mx/SieAPIRest/service/v1/?locale=en")
     ),
  br(),
  
  # use a gradient in background
  setBackgroundColor(
    color = c("#f2f2f2", "#e4ebf2"),
    gradient = "linear",
    direction = "bottom"
  ),
  
  
  # body
  sidebarLayout(position="left",
                
                ###############################
                ##### Left side bar-panel #####
                ###############################
                
                sidebarPanel(
                  tags$style(".well {background-color:#fff;}"), #fbe3df;}"),

                  # select series, multiple selection
                  fluidRow(
                    column(12,
                           selectizeInput(
                             'select_multiple_series',
                              label = h4("Select series:"),
                              choices = choices_series,#NULL,
                              multiple = TRUE,
                              # options = list(create = TRUE),
                              options = list(create = TRUE, maxItems = 10),
                              selected =c("SM1472", "SM1478")
                             ),
                           p("🔎 Select up to 10 time series. These options are some of the cash time series, ",
                             a("click here", href = "https://www.banxico.org.mx/SieAPIRest/service/v1/doc/catalogoSeries#"),
                             " to see the complete catalog.",
                             style = "color:gray; font-size:12px")
                           )
                    ),
                  
                  # range of dates.
                  # note: by default it returns information from last 5 years.
                  fluidRow(
                    column(12,
                           dateRangeInput("select_dates", h4("Date range:"),
                                          start = Sys.Date() - (365.25*5),
                                          end   =  Sys.Date()
                                          )
                           )
                    ),
                  
                  # change the title of the plot
                  fluidRow(
                    column(12,
                           h4("Change title and labels:"),
                           textInput("text1", h5("Plot's title"), value = "SIE Cash Series")
                           )
                    ),
                  
                  #  change the `x` and `y` labels
                  fluidRow(
                    column(6,
                           textInput("text3", h5("x-axis label"), value = "Values")
                           ),
                    column(6,
                           textInput("text2", h5("y-axis label"), value = "Date")
                           )
                    ),
                  
                  # select the format to show the data
                  fluidRow(
                    column(6,
                           h4("Database options"),
                           )
                    ),
                  
                  fluidRow(
                    column(6,
                           radioButtons("show_data_op", h5("Showing data"),
                                        choices=list("Wide format"="wide",
                                        "Tidy format" = "tidy"
                                        ),
                                        selected = "wide")
                           ),
                    
                    column(4,
                           br(),
                           br(),
                           # actionButton("save_button", label = "📥 Save series",
                           #              # icon("paper-plane"), 
                           #              style="color: #fff; background-color: #7faad7; border-color: #2e6da4")
                   
                           # downloadButton('downloadData', 'Download'),
                                          # style="color: #fff; background-color: #7faad7; border-color: #2e6da4")
                           downloadButton('downloadData', 'Download', class = "butt"),
                           tags$head(tags$style(".butt{background-color:#7faad7;} .butt{color: #fdfdfd;}"))
                           )
                    ),
                  
                  br(), 
                  hr(),
                  
                  # Bottom of the side bar panel
                  fluidRow(
                    column(5,
                           # banknotes image with hyperlink
                           a(img(src = "billetes.png", height = 70, width = 100, align ="center"),
                             href = "https://vcuspinera.github.io/projects/2020/sie-api-guide"),
                           # text "App by vcuspinera" with hyperlink
                           p("App by ",
                             a("vcuspinera", href = "https://vcuspinera.github.io/projects/2020/sie-api-guide"),
                             style = "font-size:14px"),
                           align ="center"
                    ),
                    
                    column(6, 
                           p("⚠️ The views and conclusions presented in this Repository 
                             are exclusively the responsibility of the author and do not 
                             necessarily reflect those of Banco de Mexico.", 
                             style = "color:gray; font-size:12px"))
                    )
                  ),
                
                
                ##############################
                ##### Main panel (right) #####
                ##############################
                
                mainPanel(
                  # selected series, with multiple selection
                  fluidRow(
                      h4("Selected series:"),
                      box(
                        verbatimTextOutput("selectOutMultiple"),
                        width=11
                        )
                      ),
                  hr(),
                  
                  # Plot
                  fluidRow(
                    h4("Plot:"),
                    plotOutput('plot_series', width = "100%")
                    ),
                  hr(),
                  
                  # Metadata
                  #box(
                  fluidRow(
                    # box(
                      h4("Metadata:"),
                      # ),
                      uiOutput('meta_data')
                    ),
                  hr(),
                  
                  # Database
                  fluidRow(
                    h4("Database:"),
                    # box(
                      p(textOutput("show_data")),
                      uiOutput('df_series')
                      # )
                    )
                  )
                )
  )
