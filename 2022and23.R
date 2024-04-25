library(shiny)
library(readr)
library(ggplot2)
library(dplyr)
library(tidyr)
library(shinythemes)

# Define the UI
ui <- fluidPage(
  theme = shinytheme("spacelab"),  # Apply a theme
  titlePanel("Explorer of 2023 Our Wisconsin Survey 1&2"),
  
  sidebarLayout(
    sidebarPanel(
      wellPanel(
        selectInput("survey_selection", 
                    "Select a Survey:", 
                    choices = c("Survey 1", "Survey 2")),
        uiOutput("question_selection"),
        selectInput("group_selection", 
                    "Select a Group:", 
                    choices = c("All"))  # Temporarily hardcoded
      ),
      actionButton("analyze_button", "Analyze Question", class = "btn-primary")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Frequency Table", tableOutput("freq_table")),
        tabPanel("Distribution Plot", plotOutput("freq_plot"))
      )
    )
  )
)

server <- function(input, output, session) {
  # Load the identity file
  identity_data <- read_csv("identity.csv")
  
  # Update group selection choices dynamically based on identity file
  observe({
    updateSelectInput(session, "group_selection", 
                      choices = c("All", names(identity_data)[-1]),  # Exclude 'id' column
                      selected = "All")
  })
  
  # Simplified data loading logic (remains the same as before)
  survey_data <- reactive({
    survey_file <- if (input$survey_selection == "Survey 1") {
      "s1.csv"
    } else {
      "s2.csv"
    }
    read_csv(survey_file)
  })
  
  # Dynamic question selection UI (remains the same as before)
  output$question_selection <- renderUI({
    req(survey_data())
    question_choices <- setdiff(names(survey_data()), "id")
    selectInput("question_selection", 
                "Select a question:", 
                choices = question_choices)
  })
  
  # Perform the analysis with identity filtering
  results <- eventReactive(input$analyze_button, {
    req(survey_data(), input$question_selection, input$group_selection)
    
    data <- survey_data()
    # Join survey data with identity data on 'id'
    complete_data <- left_join(data, identity_data, by = "id")
    
    # Filter based on selected identity group if not 'All'
    if (input$group_selection != "All") {
      complete_data <- complete_data %>% 
        filter(.[[input$group_selection]] == 1)
    }
    
    # Example analysis: Count of non-NA responses for the selected question
    non_na_responses <- na.omit(complete_data[[input$question_selection]])
    freq_table <- as.data.frame(table(non_na_responses))
    
    # Calculate percentages
    freq_table$Percentage <- (freq_table$Freq / sum(freq_table$Freq)) * 100
    
    # Simple plot of the frequency table, now including percentages
    plot <- ggplot(data = freq_table, aes(x = non_na_responses, y = Freq)) +
      geom_bar(stat = "identity", fill = "steelblue") +
      xlab(input$question_selection) + ylab("Frequency") +
      geom_text(aes(label = paste0(round(Percentage, 2), "%")), vjust = -0.5)  # Add percentages as text labels
    
    list("FrequencyTable" = freq_table, "Plot" = plot)
  })
  
  # Output the frequency table and plot (remains the same as before)
  output$freq_table <- renderTable({
    req(results())
    results()$FrequencyTable
  })
  
  output$freq_plot <- renderPlot({
    req(results())
    results()$Plot
  })
}


# Run the application 
shinyApp(ui = ui, server = server)
