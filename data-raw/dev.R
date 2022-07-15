

library(devtools)
library(usethis)
library(desc)
library(roxygen2)
library(qpdf)




# Use this
usethis::use_mit_license("Eleni Vasilaki")
usethis::use_lifecycle_badge("Experimental")

usethis::use_package("httr")
usethis::use_package("jsonlite")
usethis::use_package("curl")
usethis::use_package("attempt")



use_testthat()
use_vignette("datagovgR")
use_readme_rmd()
