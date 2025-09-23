.libPaths("~/R/library")
library(mcpr)

# client.R — using mcpr client
library(mcpr)

cli <- MCPClient$new(name = "r-mcp-client")
# connect to local server (adjust host/port if needed)
cli$connect("http://127.0.0.1:8000")

res <- cli$call("generate_code", list(text = "print('Hello from mcpr client!')"))
print(res)