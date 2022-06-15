library(rmarkdown)
library(readxl)
library(purrr)
# cria o caminho para o arquivo
caminho_rmd <- "relatorio-parte-2.Rmd"

# renderiza o arquivo
render(caminho_rmd) # equivale ao botao KNIT!

# renderizar com parametros!!!

list(estado = "SP")

render(caminho_rmd, params = list(estado = "SP"))

# gerando com parametros e configurando o nome do arquivo gerado
render(caminho_rmd, params = list(estado = "SP"),
       output_file = "SP.html")


# buscar as UFs possiveis!
sigbm <- read_xlsx("dados/sigbm.xlsx", skip = 4) |>
  clean_names()

sigbm$uf

unique(sigbm$uf)

estados_sigbm <- sort(unique(sigbm$uf))

# vamos começar a falar de purrr!!

# criar pasta pra deixar os relatorios
fs::dir_create("relatorios_uf")


# exemplo curto de purr
# 1, 2, 3
sqrt(1)
sqrt(2)
sqrt(3)


vetor_que_quero_repetir <- 1:3


purrr::map(vetor_que_quero_repetir,
           # funcao que eu quero que seja aplicada
           sqrt)

purrr::map(vetor_que_quero_repetir,
           ~ sqrt(.x))        

# funcao <- funcao(.x){
#   sqrt(.x)
# }
      
# map + render

# map(vetor, funcao)

map(estados_sigbm,
    ~ render(
      caminho_rmd,
     # output_format = word_document(),
      output_format = prettydoc::html_pretty(theme = "architect"),
      params = list(estado = .x),
      output_file = glue::glue("relatorios_uf/{.x}")
    ))


# imprime em PDF!
pagedown::chrome_print("relatorio-parte-2.html")

caminhos_html <- fs::dir_ls("relatorios_uf/")

caminhos_html_base <- list.files("relatorios_uf", full.names = TRUE)



# map(vetor, funcao)

map(caminhos_html, pagedown::chrome_print)


