

library(dplyr)
library(tibble)
library(haven)
library(readr)

if (!dir.exists("data") | !dir.exists("data/device-testing")) {
  stop("The data directory or the device-testing directory does not exist.")
}

data_directory <- list.dirs(path = "data/device-testing", full.names = TRUE)
data_directory <- data_directory[data_directory != "data/device-testing"]  # remove the "data/device-testing" directory
timestamps <- basename(data_directory)
latest_timestamp <- max(timestamps)
latest_directory <- file.path("data/device-testing", latest_timestamp)
responses_filepath <- file.path(latest_directory, "Responses.csv")

responses <- read_csv(responses_filepath)


write.csv(responses, "data/survey_responses.csv")
