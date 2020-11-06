# NOTES ABOUT THE APP:
#
# (1) INSTALL shiny
#     Before runing this app, you should install 'shiny' as follows
#     > install.packages("shiny")
#
# (2) RUN APP
#     This is a Shiny web application. You can run the application 
#     by clicking the 'Run App' button above.
#
# (3) TOKEN TO RUN THE APP
#     To run this app you will need a SIE API token. If you do not 
#     have it, you can get one in the official website:
#     ⭐️ https://www.banxico.org.mx/SieAPIRest/service/v1/token?locale=en
#
# (4) DISCLOSURE
#     ⚠️The views and conclusions presented in this Repository are 
#     exclusively the responsibility of the author and do not 
#     necessarily reflect those of Banco de Mexico.
#

# Load libraries
library("shiny")
library("tidyverse")
library("shinydashboard")

# Run the app ----
shinyApp(ui = ui, server = server)
