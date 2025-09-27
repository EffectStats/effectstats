# app.R
library(shiny)
library(rhandsontable)

ui <- fluidPage(
  titlePanel("Wide Editable Table (20 Columns)"),

  sidebarLayout(
    sidebarPanel(
      helpText("Scroll right to see all columns. Edits will not reset scroll position."),
      actionButton("reset", "Reset Data")
    ),
    mainPanel(
      rHandsontableOutput("hot", height = 400)
    )
  )
)

server <- function(input, output, session) {
  # make 20 fake columns
  make_data <- function(n = 10) {
    df <- as.data.frame(matrix(
      data = sample(1:100, n * 20, replace = TRUE),
      nrow = n,
      ncol = 20
    ))
    names(df) <- paste0("Col", 1:20)
    df
  }

  # reactive value for table
  rv <- reactiveVal(make_data())

  # render handsontable
  output$hot <- renderRHandsontable({
    rhandsontable(rv(), rowHeaders = NULL) %>%
      hot_cols(columnSorting = TRUE) %>%
      hot_table(highlightCol = TRUE, highlightRow = TRUE)
  })

  # capture edits
  observeEvent(input$hot, {
    if (!is.null(input$hot)) {
      rv(hot_to_r(input$hot))
    }
  })

  # reset button
  observeEvent(input$reset, {
    rv(make_data())
  })
}

shinyApp(ui, server)
