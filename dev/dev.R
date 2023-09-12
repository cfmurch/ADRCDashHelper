## this is a meta script to log the commands that create the package ##

# package setup
# install.packages('devtools')
usethis::create_package('ADRCDashHelper')
usethis::git_vaccinate()

# imports
usethis::use_package("shiny", min_version = '1.7.4')
usethis::use_package("htmltools", min_version = '0.5.4')
usethis::use_package('shinyWidgets', min_version = '0.7.6')
usethis::use_package('reactable', min_version = '0.4.4')
usethis::use_package('echarts4r', min_version = '0.4.5')
usethis::use_package("data.table", min_version = '1.14.6')
usethis::use_data_table()
usethis::use_package('dplyr', min_version = '1.1.0')
usethis::use_package('tidyr', min_version = '1.3.0')
usethis::use_package('lubridate', min_version = '1.9.1')
usethis::use_package('glue', min_version = '1.6.2')
usethis::use_package('cli', min_version = '3.6.0')
usethis::use_package('scales', min_version = '1.2.1')
usethis::use_package('testthat', min_version = '3.1.6', type = 'Suggests')

# create function files
# usethis::use_r('modules')
usethis::use_r('data')
usethis::use_r('utils')

# create tests
usethis::use_testthat()
usethis::use_test('data')
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

# R CMD check on GitHub Actions
usethis::use_github_action_check_standard()

# build package
usethis::use_build_ignore('dev')
usethis::use_build_ignore('.github')
devtools::check()
devtools::build()
