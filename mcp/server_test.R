.libPaths("~/R/library")


library(mcpr)
library(httr2)
library(jsonlite)

# Tool 1: Generate R code
generate_code <- new_tool(
  name = "generate_code",
  description = "Writes R code to a file",
  input_schema = schema(
    properties = properties(
      text = property_string("Code text", "The R code to write", required = TRUE)
    )
  ),
  handler = function(params) {
    out_file <- file.path(getwd(), "mcp_output.R")
    writeLines(params$text, out_file)
    response_text(sprintf("Wrote %d bytes to %s", nchar(params$text), out_file))
  }
)

# Tool 2: Calculator
calculator <- new_tool(
  name = "calculator",
  description = "Performs a basic math operation (add, subtract, multiply, divide)",
  input_schema = schema(
    properties = properties(
      a = property_number("First number", "the a term", required = TRUE),
      b = property_number("Second number","the b term" , required = TRUE),
      op = property_string(
        "Operation",
        "add, 'subtract', 'multiply', 'divide'",
        required = TRUE
      )
    )
  ),
  handler = function(params) {
    result <- switch(
      params$op,
      add = params$a + params$b,
      subtract = params$a - params$b,
      multiply = params$a * params$b,
      divide = if (params$b == 0) NA else params$a / params$b,
      NA
    )
    response_text(sprintf("Result of %s(%s, %s) = %s", params$op, params$a, params$b, result))
  }
)

# Tool 3: IP Finder
ip_finder <- new_tool(
  name = "ip_finder",
  description = "Fetches the public IP address of the current machine",
  input_schema = schema(
    properties = properties()
  ),
  handler = function(params) {
    res <- request("https://api.ipify.org?format=json") |> req_perform()
    data <- res |> resp_body_json()
    response_text(sprintf("Your IP address is %s", data$ip))
  }
)


# Create the server
srv <- new_server(
  name = "r-mcp-server",
  description = "A minimal MCP server in R",
  version = "0.1.0"
)

# Register the tool
srv <- add_capability(srv, generate_code)
srv <- add_capability(srv, calculator)
srv <- add_capability(srv, ip_finder)

# Run it (stdin/stdout loop)
serve_http(srv, path = "/mcp")
