library(shiny)
library(reticulate)

# tell reticulate to use the Python in your venv
use_virtualenv("venv", required = TRUE)

# define a Python helper function
py_run_string("
import pandas as pd

def add_columns(df):
    df['sum'] = df['a'] + df['b']
    return df
")

ui <- fluidPage(
  titlePanel("Shiny + Python (reticulate) Calculator"),
  sidebarLayout(
    sidebarPanel(
      numericInput("a", "A", value = 1),
      numericInput("b", "B", value = 2),
      actionButton("send", "Compute in Python")
    ),
    mainPanel(
      verbatimTextOutput("result")
    )
  )
)

server <- function(input, output, session) {
  result <- reactiveVal(NULL)

  observeEvent(input$send, {
    # create small R data.frame
    df <- data.frame(a = input$a, b = input$b)

    # R → Python
    py$df <- df
    py$df <- py$add_columns(py$df)

    # Python → R
    r_df <- py_to_r(py$df)

    result(r_df)
  })

  output$result <- renderPrint({
    result()
  })
}

shinyApp(ui, server)
