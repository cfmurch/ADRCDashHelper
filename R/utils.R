

# UI ----------------------------------------------------------------------

#' Color palette
#'
#' UAB color palette. Primarily used for static UI elements.
#'
#' Sourced from https://www.uab.edu/toolkit/brand-basics/colors#digital
#'
#' @export
#' @return list of color hexes
#' @author Joseph Marlo, \email{support@landeranalytics.com}
#'
#' @examples
#' color_palette$green
#' scales::show_col(unlist(color_palette))
color_palette <- list(
  green = "#88C408",
  green_light = "#a5e6cd",
  green_medium = '#007348',
  green_dark = "#144B39",
  green_dark_dark = "#152e24",
  yellow = "#FFD602",
  gold = "#A69363",
  grey = "#808285",
  grey_light = "#c7c7c7",
  grey_dark = "#2d3338"
)


#' Add red "beta" ribbon to the bottom left of the UI
#'
#' To be used within Shiny UI
#'
#' @export
#' @return html
#' @author Joseph Marlo, \email{support@landeranalytics.com}
#'
#' @examples
#' htmltools::html_print(add_beta_ribbon())
add_beta_ribbon <- function(){

  # inline CSS
  style <- "
    width: 200px;
    background: #b81b11;
    position: fixed;
    bottom: 25px;
    left: -50px;
    text-align: center;
    line-height: 50px;
    letter-spacing: 3px;
    font-size: 1.5em;
    font-weight: 700;
    color: #f0f0f0;
      -webkit-transform: rotate(45deg);
      -moz-transform: rotate(45deg);
    transform: rotate(45deg);
      -webkit-box-shadow: 0 0 15px rgba(0,0,0,0.5);
      -moz-box-shadow: 0 0 15px rgba(0,0,0,0.5);
    box-shadow: 0 0 15px rgba(0,0,0,0.5);
    z-index: 9999;
    "

  beta_div <- htmltools::tags$div(
    class = 'corner-ribbon',
    style = style,
    'BETA'
  )

  return(beta_div)
}

#' @title Establish the UAB theme for bs4Dash
#'
#' @description Creates a base UAB theme. It writes out a CSS style sheet to the /www directory. This should be used in the R console when starting a new dashboard project.
#'
#' @param output_dir Directory in which to write the style sheet
#'
#' @export
#' @return Creates or overrides a style sheet at `output_dir`
#' @author Joseph Marlo, \email{support@landeranalytics.com}
#'
#' @seealso [fresh::search_vars_bs4dash()]
#' @seealso [https://dreamrs.github.io/fresh/articles/vars-bs4dash.html](https://dreamrs.github.io/fresh/articles/vars-bs4dash.html)
#' @examples
#' \dontrun{
#' write_uab_bs4_theme()
#' }
write_uab_bs4_theme <- function(output_dir = "inst/app/www"){

  output_file <- file.path(output_dir, "ADRC-theme.css")

  # use SCSS bsf4dash variables where possible
  css_content <- fresh::create_theme(
    fresh::bs4dash_vars(
      # sidebar_light_active_color = "#FFF",
      # sidebar_dark_active_color = "#FFF"
    ),
    fresh::bs4dash_yiq(
    ),
    fresh::bs4dash_layout(
      # control_sidebar_width = "600px"
    ),
    fresh::bs4dash_sidebar_light(
      bg = ADRCDashHelper::color_palette$green_dark,
      submenu_active_bg = ADRCDashHelper::color_palette$green_medium
    ),
    fresh::bs4dash_sidebar_dark(
      bg = ADRCDashHelper::color_palette$green_dark,
      submenu_active_bg = ADRCDashHelper::color_palette$green_medium,
    ),
    fresh::bs4dash_status(
      # this controls the active nav pill for some reason
      primary = ADRCDashHelper::color_palette$green_medium,
      danger = "#BF616A"
    ),
    fresh::bs4dash_color(
    ),
    fresh::bs4dash_font(
      weight_normal = 300
    )
  )

  # additional CSS that can't be handled by create_theme
  css_additional <- "
/* ADDITIONAL CUSTOM CSS */
/* limit the width of the dashboard on ultrawide monitors */
.content {
  max-width: 1400px;
}

/* main sidebar */
#sideBarMenu .nav-link {
  color: #fff !important;
}
#sideBarMenu .control-label {
  color: #fff;
  font-weight: 500;
}

/* footer copyright */
footer {
  padding: 0.6em !important;
}
footer > a{
  color: #a1a1a1;
}
footer > a:hover{
  filter: brightness(70%);
  color: #a1a1a1 !important;
}

/* buttons */
.button-path {
  margin-left: 0.5em;
  background-color: rbga(79, 79, 79, 1) !important;
  border: rbga(79, 79, 79, 1) !important;
  color: #fff !important;
}
.button-path:hover {
  filter: brightness(0.8);
}
.button-path:active {
  filter: brightness(0.6);
}

/* calendar colors */
.month.active, .day.active {
  background-color: rbga(79, 79, 79, 1) !important;
}
.datepicker .day.active {
  background-color: rgba(79, 79, 79, 1) !important;
}

/* selectize item colors and box shadow */
.item.active {
  background: rbga(79, 79, 79, 1) !important;
}
.selectize-input.focus {
  box-shadow: 0px 0px 5px rgba(79, 79, 79, 0.8);
  border-color: rgba(79, 79, 79, 0.8);
}
.selectize-dropdown-content > .active {
  background: #a1a1a1;
}

/* checkboxes */
.shiny-input-checkboxgroup > label {
  margin: 1em 0 1em 0;
}
.checkbox span {
  font-weight: 500;
}

/* tabs on tabset panels */
.tabbable > .nav {
  margin-bottom: 0.25rem !important;
}
.tabbable .nav-link.active {
  border-bottom: 3px solid #007348 !important;
}

/* reactable */
.ReactTable {
  padding: 1em;
  border-radius: 0.25em;
  font-size: 0.95em;
}
.card-body .ReactTable {
  padding: 0;
}
.reactable {
  margin: auto; /* centers table */
}

/* bs4dash cards */
.card-body {
  margin-bottom: 1em;
}

/* dropdown */
.selected.active {
  color: #fff !important;
}
.dropdown-item:active {
  color: #fff !important;
}

/* mobile popup warning */
.modal-footer > .btn {
  padding: 0.5rem;
  border: 2px #007348 solid;
  background: #007348;
  color: #fff;
  text-transform: uppercase;
  font-size: 14px;
  font-weight: 500;
  text-decoration: none;
}
.modal-footer > .btn:active {
  background: #fff;
  color: #007348;
  transition-duration: 100ms;
}
  "

  # remove line breaks
  css_additional <- gsub("\n", "", css_additional)

  # combine the css into one text vector
  css_content <- paste0(css_content, css_additional)

  xfun::write_utf8(css_content, output_file)
}


#' Show warning popup if user is on mobile
#'
#' To be used within Shiny server
#'
#' @param session A Shiny session object
#'
#' @author Joseph Marlo, \email{support@landeranalytics.com}
#' @export
#'
#' @return called for side effect
#' @examples
#' \dontrun{
#' observe(if(isTRUE(shinybrowser::is_device_mobile())) ADRCDashHelper::show_popup_mobile(session))
#' }
show_popup_mobile <- function(session = shiny::getDefaultReactiveDomain()){
  content <- htmltools::p(
    htmltools::strong("ADRC Dash"),
    " is best experienced on a big screen! Please come back on a desktop browser."
  )
  popup <- shiny::modalDialog(
    content,
    title = NULL,
    footer = shiny::modalButton("I'll check it out anyway"),
    size = 's',
    easyClose = FALSE,
    fade = TRUE
  )
  shiny::showModal(ui = popup, session = session)
}


# other -------------------------------------------------------------------

#' Check if a value is truthy
#'
#' A value is generally truthy unless it is FALSE, NA, NULL, an empty data.frame, or empty list.
#'
#' Modified from shiny::isTruthy
#'
#' @param x An expression whose truthiness value we want to determine
#'
#' @return boolean
#' @export
#'
#' @author Joseph Marlo, \email{support@landeranalytics.com}
#' @seealso [shiny::isTruthy()]
#'
#' @examples
#' is_truthy(TRUE)
#' is_truthy(FALSE)
#' is_truthy(1)
#' is_truthy(0)
#' is_truthy(NULL)
#' is_truthy(NA)
#' is_truthy(data.frame())
#' is_truthy(data.frame(x = 1))
is_truthy <- function(x){

  ##### additions
  if (inherits(x, "data.frame") && nrow(x) == 0)
    return(FALSE)
  if (inherits(x, "list") && length(x) == 0)
    return(FALSE)

  ##### shiny::isTruthy
  if (inherits(x, "try-error"))
    return(FALSE)
  if (!is.atomic(x))
    return(TRUE)
  if (is.null(x))
    return(FALSE)
  if (length(x) == 0)
    return(FALSE)
  if (all(is.na(x)))
    return(FALSE)
  if (is.character(x) && !any(nzchar(stats::na.omit(x))))
    return(FALSE)
  if (inherits(x, "shinyActionButtonValue") && x == 0)
    return(FALSE)
  if (is.logical(x) && !any(stats::na.omit(x)))
    return(FALSE)
  return(TRUE)
}
