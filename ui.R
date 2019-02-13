#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shinydashboard)

shinyUI(dashboardPage(
  skin = "yellow",
  # header #####
  dashboardHeader(title = "Rapper Correlations"),
  # sidebar #####
  dashboardSidebar(
    # author #####
    sidebarUserPanel("by Mimi Chung"),
    # sidebar #####
    sidebarMenu(
      menuItem("Project Summary", tabName = "summary", icon = icon("bars")),
      menuItem("Rise", tabName = "rise", icon = icon("chart-line")),
      menuItem("Endorsements", tabName = "endorsements", icon = icon("globe"),
               menuSubItem("Cardi B vs. brands", tabName = "cardibbrands"),
               menuSubItem("Jay Z vs. brands", tabName = "jayzbrands"),
               menuSubItem("Drake vs. brands", tabName = "drakebrands"),
               menuSubItem("Kanye West vs. brands", tabName = "kanyebrands"),
               menuSubItem("21 Savage vs. brands", tabName = "21brands")),
      menuItem("Location", tabName = "location", icon = icon("crosshairs"),
               menuSubItem("Cardi B", tabName = "cardibmap"),
               menuSubItem("Jay Z", tabName = "jayzmap"),
               menuSubItem("Drake", tabName = "drakemap"),
               menuSubItem("Kanye West", tabName = "kanyemap"),
               menuSubItem("21 Savage", tabName = "21map"))
    )),
  # body ####
  dashboardBody(
    # Boxes need to be put in a row (or column)
    tabItems(
      # home page #####
      tabItem(tabName = "summary",
              fluidRow(box(h3("Celebrity endorsements and correlations with USA google search trends"),
                            br(), "Celebrity endorsements and branding through social media are a new age marketing strategy.", br(), br(),
                            "This is a study of the correlations between five rappers and the brands they promote, or simply anything that they mention or are involved in on their social media. Here, we focus on five rappers: Cardi B, Jay Z, Drake, Kanye West, and 21 Savage.",
                           br(),br(),
                           width = 12)
                       )),
      # rise-over-time graphs #####
      tabItem(tabName = "rise",
              fluidRow(box(
                width = 12, (plotlyOutput(
                  "googlesearchesPlot", height = 700, width = 1150
                ))
              ))),
      # cardi b brand searches compared to artist search #####
      tabItem(tabName = "cardibbrands", 
              fluidRow(box(
                width = 12, (plotlyOutput(
                  "cardiendorsementsPlot", height = 700, width = 1150
                ))
              ))),
      # jay z brand searches compared to artist search #####
      tabItem(tabName = "jayzbrands", 
              fluidRow(box(
                width = 12, (plotlyOutput(
                  "jayendorsementsPlot", height = 700, width = 1150
                ))
              ))),
      # drake brand searches compared to artist search #####
      tabItem(tabName = "drakebrands", 
              fluidRow(box(
                width = 12, (plotlyOutput(
                  "drakeendorsementsPlot", height = 700, width = 1150
                ))
              ))),
      # kanye brand searches compared to artist search #####
      tabItem(tabName = "kanyebrands", 
              fluidRow(box(
                width = 12, (plotlyOutput(
                  "kanyeendorsementsPlot", height = 700, width = 1150
                ))
              ))),
      # 21 brand searches compared to artist search #####
      tabItem(tabName = "21brands", 
              fluidRow(box(
                width = 12, (plotlyOutput(
                  "savageendorsementsPlot", height = 700, width = 1150
                ))
              ))),
      # map USA #####
      tabItem(tabName = "cardibmap",
              # gvisGeoChart
              fluidRow(box(h3("Cardi B searches in the US"),
                width = 12, htmlOutput("map"))
              )
      ),
      tabItem(tabName = "jayzmap",
              # gvisGeoChart
              fluidRow(box(h3("Jay Z searches in the US"),
                           width = 12, htmlOutput("map2"))
              )
      ),
      tabItem(tabName = "drakemap",
              # gvisGeoChart
              fluidRow(box(h3("Drake searches in the US"),
                           width = 12, htmlOutput("map3"))
              )
      ),
      tabItem(tabName = "kanyemap",
              # gvisGeoChart
              fluidRow(box(h3("Jay Z searches in the US"),
                           width = 12, htmlOutput("map4"))
              )
      ),
      tabItem(tabName = "21map",
              # gvisGeoChart
              fluidRow(box(h3("21 Savage searches in the US"),
                           width = 12, htmlOutput("map5"))
              )
      )
    )
  )
)
)

