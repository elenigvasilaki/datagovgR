install.packages("devtools")
install.packages("roxygen2")
install.packages("usethis")
install.packages("curl")
install.packages("httr")
install.packages("jsonlite")
install.packages("attempt")
install.packages("purrr")
install.packages("desc")


library(devtools)
library(usethis)
library(desc)
library(roxygen2)



# Use this
usethis::use_mit_license("Eleni Vasilaki")
usethis::use_lifecycle_badge("Experimental")

usethis::use_package("httr")
usethis::use_package("jsonlite")
usethis::use_package("curl")
usethis::use_package("attempt")

usethis::use_tidy_description()
usethis::use_testthat()
usethis::use_readme_rmd()

