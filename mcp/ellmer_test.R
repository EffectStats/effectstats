library(ellmer)
library(dotenv)

dotenv::load_dot_env() # make sure .env is in the root of the directory



chat <- chat_openai(model = "gpt-4.1")
. <- chat$chat("Who created R?", echo = FALSE)
print(chat)

print(token_usage())