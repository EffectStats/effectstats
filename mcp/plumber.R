# plumber.R
#* @post /chat_openai
function(req, res) {
  body <- jsonlite::fromJSON(rawToChar(req$postBody))
  user_input <- body$text

  api_key <- Sys.getenv("OPENAI_API_KEY")

  resp <- httr2::request("https://api.openai.com/v1/chat/completions") |>
    httr2::req_headers(
      "Authorization" = paste("Bearer", api_key),
      "Content-Type" = "application/json"
    ) |>
    httr2::req_body_json(list(
      model = "gpt-4.1-mini",
      messages = list(list(role="user", content=user_input))
    )) |>
    httr2::req_perform()

  out <- httr2::resp_body_json(resp)
  list(reply = out$choices[[1]]$message$content)
}
