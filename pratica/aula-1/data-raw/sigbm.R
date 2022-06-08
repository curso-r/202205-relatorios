## code to prepare `sigbm` dataset goes here

url_request <- "https://app.anm.gov.br/SIGBM/Publico/ClassificacaoNacionalDaBarragem/ExportarExcel"
httr::POST(url_request, httr::write_disk("data-raw/sigbm.xlsx"))


sigbm <- readxl::read_xlsx("data-raw/sigbm.xlsx", skip = 4) |>
  janitor::clean_names()


usethis::use_data(sigbm, overwrite = TRUE)
