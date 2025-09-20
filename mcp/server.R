.libPaths("~/R/library")
library(mcpr)

# server.R — using mcpr (if the API matches devOpifex/mcpr)
library(mcpr)

# A simple tool function that mcpr will expose
generate_code <- function(params) {
  # params might be a list with $text
  code <- if (is.list(params) && !is.null(params$text)) params$text else as.character(params)
  out_file <- file.path(getwd(), "mcp_output.R")
  writeLines(code, out_file)
  list(status = "ok", path = out_file, message = sprintf("Wrote %d bytes", nchar(code)))
}

# Create and start server
srv <- MCPServer$new(name = "r-mcp-server", tools = list(generate_code = generate_code))
# try common start methods — some versions expose start() or run()
if ("start" %in% ls(srv)) srv$start()
else if ("run" %in% ls(srv)) srv$run()
else message("Server object created; consult mcpr docs for start method")
