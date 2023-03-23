## this is a meta script to log the commands that create the package ##

# package setup
# install.packages('devtools')
usethis::create_package('ADRCDashHelper')
usethis::git_vaccinate()

# imports
usethis::use_package("htmltools", min_version = '0.5.4')
usethis::use_package("data.table", min_version = '1.14.6')
usethis::use_package('dplyr', min_version = '1.1.0')
usethis::use_package('tidyr', min_version = '1.3.0')
usethis::use_package('lubridate', min_version = '1.9.1')
usethis::use_package('glue', min_version = '1.6.2')
usethis::use_package('cli', min_version = '3.6.0')
usethis::use_package('testthat', min_version = '3.1.6', type = 'Suggests')

# usethis::use_data_table()
# usethis::use_github_action()

# create function files
usethis::use_r('utils')

# create tests
usethis::use_testthat()
usethis::use_test('utils')

# github pages

# other
# devtools::load_all()
# devtools::document()

# build package
usethis::use_build_ignore('dev')
devtools::check()
devtools::build()
