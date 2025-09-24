.libPaths("~/R/library")

library(mcpr)

# Create an HTTP client (pointing at your server)
cli <- mcpr:::new_client_http("http://127.0.0.1:3000/mcp", name = "r-mcp-client")

# Call the "generate_code" tool with some R code
res <- tools_call(
  cli,
  params = list(
    name = "generate_code",
    arguments = list(
      text = "x <- 42\nprint(x)\n"
    )
  ),
  id = 1L
)

print(res$result$content[[1]]$text)
