

library(devtools)
library(usethis)
library(desc)
library(roxygen2)
library(qpdf)

# Remove default DESC
unlink("DESCRIPTION")
# Create and clean desc
my_desc <- description$new("!new")

# Set your package name
my_desc$set("Package", "datagovgR")

#Set your name
my_desc$set("Authors@R", "person('Eleni', 'Vasilaki', email = 'eleni.gvasilaki@gmail.com', role = c('cre', 'aut'))")

# Remove some author fields
my_desc$del("Maintainer")

# Set the version
my_desc$set_version("0.0.1")

# The title of your package
my_desc$set(Title = "R wrapper for data.gov.gr API")
# The description of your package
my_desc$set(Description = "The goal of datagovgR is to enable R users, data analysts, academics and students to work with the Greek open governmental data programmatically using their favourite language, R.")
# The urls
my_desc$set("URL", "https://github.com/hypnicjerk91/datagovgR")
my_desc$set("BugReports", "https://github.com/hypnicjerk91/datagovgR")
# Save everyting
my_desc$write(file = "DESCRIPTION")


# Use this
usethis::use_mit_license("Eleni Vasilaki")
usethis::use_lifecycle_badge("Experimental")

usethis::use_package("httr")
usethis::use_package("jsonlite")
usethis::use_package("curl")
usethis::use_package("attempt")

use_testthat()

