transformar_em_flextable <- function(base_de_dados){
  base_de_dados |>
    flextable::flextable() |>
    flextable::autofit()  |>
    flextable::fontsize(size = 9)  |>
    ftExtra::colformat_md()  |>
    flextable::theme_zebra() |>
    ftExtra::span_header()  |>
    flextable::align(align = "center", part = "all")
}
