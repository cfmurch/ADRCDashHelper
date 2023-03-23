## this is a meta script to log the commands that create the package ##

# package setup
# install.packages('devtools')
usethis::create_package('ADRCDashHelper')
usethis::git_vaccinate()

# imports
usethis::use_package("htmltools", min_version = '0.5.4')
usethis::use_package("data.table", min_version = '1.14.6')
usethis::use_data_table()
usethis::use_package('dplyr', min_version = '1.1.0')
usethis::use_package('tidyr', min_version = '1.3.0')
usethis::use_package('lubridate', min_version = '1.9.1')
usethis::use_package('glue', min_version = '1.6.2')
usethis::use_package('cli', min_version = '3.6.0')
usethis::use_package('testthat', min_version = '3.1.6', type = 'Suggests')
usethis::use_data_table()

# create function files
usethis::use_r('utils')

# create tests
usethis::use_testthat()
usethis::use_test('utils')

# other
# usethis::use_github_action()
# usethis::use_mit_license()

# pkgdown website
usethis::use_pkgdown()
# created gh-pages branch manually
# created this file manually: .github/workflows/pkgdown.yaml
# site site local using pkgdown::build_site(devel = FALSE)

# testing
# devtools::load_all()
# devtools::document()

# build package
usethis::use_build_ignore('dev')
devtools::check()
devtools::build()
