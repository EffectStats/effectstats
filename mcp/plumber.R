# plumber.R
#* @post /generate_code
function(req, res){
  body <- jsonlite::fromJSON(rawToChar(req$postBody))
  code <- body$text
  outfile <- file.path(getwd(), "mcp_output.R")
  writeLines(code, outfile)
  list(status = "ok", message = sprintf("Wrote %s", outfile))
}