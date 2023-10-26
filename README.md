# R Package for Core ADRC Dashboard Functions

<!-- badges: start -->
[![R-CMD-check](https://github.com/cfmurch/ADRCDashHelper/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/cfmurch/ADRCDashHelper/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Functions to be used within the ADRC Dashboards:  
- [ADRC Dashboard](https://github.com/cfmurch/ADRCDash)  
- [ADRC Dasboard Public](https://github.com/cfmurch/ADRCDashPublic) 

Functions in this package should be general to be used within either dashboard. Good examples are:  
- Data pipeline  
- Data munging  
- Plots used across dashboards  
- Modules used across dashboards  

## Installation

Within R:

```
devtools::install_github('cfmurch/ADRCDashHelper')
```

## TODO 
- Move code over  
- Write tests 
- Review pkgdown deployment 
  - See [token permissions](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#permissions-for-the-github_token) 
  - See {repo}/settings/pages  
- Add testthat GitHub Actions
