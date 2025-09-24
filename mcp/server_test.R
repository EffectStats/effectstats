.libPaths("~/R/library")


library(mcpr)

# Define a tool
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

# Create the server
srv <- new_server(
  name = "r-mcp-server",
  description = "A minimal MCP server in R",
  version = "0.1.0"
)

# Register the tool
srv <- add_capability(srv, generate_code)

# Run it (stdin/stdout loop)
serve_http(srv, path = "/mcp")
