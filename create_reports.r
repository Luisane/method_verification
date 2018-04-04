library("rmarkdown")
library("shiny")

Rmd_template <- "./src/Method_validation_report.Rmd"
pdf_output <- "./src/Method_validation_report.pdf"

render_document <- function(analyte, file) {
    rmarkdown::render(Rmd_template,
                      params = list(
                          analyte = analyte,
                          file = file))
}

render_query <- function() {
    rmarkdown::render(Rmd_template, params = "ask")}

rename_document <- function(analyte){
    file.rename(from = pdf_output,
                to = paste0("./reports/", analyte, "_GSP_Method_Validation", ".pdf"))
}

create_report <- function(analyte, file){
    render_document(analyte, file)
    rename_document(analyte)
}

create_report(analyte = "TSH", file = "../data/TSH_GSP_validation.xls")
create_report(analyte = "N17P", file = "../data/N17P_GSP_validation.xls")
create_report(analyte = "IRT", file = "../data/N17P_GSP_validation.xls")

## params = list(analyte = "TSH", file = "TSH_lot_validation_2017-04-05.xls",
##                 recommendation = "This reagent lot is acceptable for use")

## rmarkdown::render(Rmd_template,
##                   params = list(analyte = "TSH", file = "TSH_lot_validation_2018-02-27.xls",
##                                 recommendation = "accepted"))

