# csv ------------------
dados_covid <- readr::read_csv("https://covid.ourworldindata.org/data/owid-covid-data.csv")

dplyr::glimpse(dados_covid)

# xlsx ---------
# usei o import dataset
library(readxl)
url <- "https://covid.ourworldindata.org/data/owid-covid-data.xlsx"
destfile <- "~/Desktop/owid_covid_data.xlsx"
curl::curl_download(url, destfile)
owid_covid_data <- read_excel(destfile)
View(owid_covid_data)

# versao com openxlsx - MUITO MUITO LENTO!!!!
install.packages("openxlsx")
dados_com_openxlsx <- openxlsx::read.xlsx("https://covid.ourworldindata.org/data/owid-covid-data.xlsx")


# json ---
url_json <- "https://covid.ourworldindata.org/data/owid-covid-data.json"

dados_covid_json <- jsonlite::read_json(url_json, simplifyVector  = TRUE) |>
  dplyr::bind_rows(.id = "codigo_pais") |>
  tidyr::unnest("data")

