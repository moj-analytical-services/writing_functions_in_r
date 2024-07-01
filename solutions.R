## ----include=show_solution, purl=purl_solutions-------------------------------------------------------------------------
# 1.1 hello_world() solution

hello_world <- function() {
  print("Hello world!")
}

hello_world()


## ----include=show_solution, purl=purl_solutions-------------------------------------------------------------------------
# 1.2 my_mean() solution

my_mean <- function(x, y) {
  (x + y) / 2
}

my_mean(7.5, 16)
























## ----include=show_solution, purl=purl_solutions, eval=TRUE--------------------------------------------------------------
# 2.1 fizz_buzz() solution

fizz_buzz <- function(x) {
  
  if (x %% 3 == 0 && x %% 5 == 0) {
    "fizz buzz"
  } else if (x %% 3 == 0) {
    "fizz"
  } else if (x %% 5 == 0) {
    "buzz"
  } else {
    as.character(x)
  }
  
}


## ----include=show_solution, purl=purl_solutions, eval=FALSE-------------------------------------------------------------
## fizz_buzz(1)  # "1"
## fizz_buzz(2)  # "2"
## fizz_buzz(3)  # "fizz"
## fizz_buzz(5)  # "buzz"
## fizz_buzz(15) # "fizz buzz"


## ----include=show_solution, purl=purl_solutions-------------------------------------------------------------------------
# 2.2 fizz_buzz_vec() solution

fizz_buzz_vec <- function(x) {
  
  dplyr::case_when(
    x %% 3 == 0 & x %% 5 == 0 ~ "fizz buzz",
    x %% 3 == 0 ~ "fizz",
    x %% 5 == 0 ~ "buzz",
    TRUE ~ as.character(x)
  )
  
}

fizz_buzz_vec(1:15)


## ----include=show_solution, purl=purl_solutions-------------------------------------------------------------------------
# 2.3 fizz_buzz_custom() solution

fizz_buzz_custom <- function(x, fizz = 3, buzz = 5) {
  
  if (x %% fizz == 0 & x %% buzz == 0) {
    "fizz buzz"
  } else if (x %% fizz == 0) {
    "fizz"
  } else if (x %% buzz == 0) {
    "buzz"
  } else {
    as.character(x)
  }
  
}


fizz_buzz_custom_vec <- function(x, fizz = 3, buzz = 5) {
  
  dplyr::case_when(
    x %% fizz == 0 & x %% buzz == 0 ~ "fizz buzz",
    x %% fizz == 0 ~ "fizz",
    x %% buzz == 0 ~ "buzz",
    TRUE ~ as.character(x)
  )
  
}


## ----include=show_solution, purl=purl_solutions-------------------------------------------------------------------------
fizz_buzz_custom_vec(1:15)
fizz_buzz_custom_vec(c(1, 2, 3, 7, 15, 21), buzz = 7)


















## ----include=show_solution, purl=purl_solutions-------------------------------------------------------------------------
# Exercise 3 solution
colnames(prosecutions) <- colnames(prosecutions) |> generalise_names()
dplyr::glimpse(prosecutions)














## ----include=show_solution, purl=purl_solutions-------------------------------------------------------------------------
# Exercise 4 solution

clean_not_known <- function(x,
                            not_known_phrase = "Not known",
                            change_na = TRUE,
                            values_to_change = c("n/a", "not known", "unknown", "not stated")) {
  
  # Replace any missing (NA) values
  if (change_na) {
    x <- replace(x, list = is.na(x), values = not_known_phrase)
  }
  
  # Remove any white space that might cause the strings to not match
  x <- stringr::str_trim(x)
  
  # Replace strings in the data that refer to a missing or unknown value.
  dplyr::if_else(tolower(x) %in% values_to_change, true = not_known_phrase, false = x)
  
}


## ----include=show_solution, purl=purl_solutions-------------------------------------------------------------------------
# Exercise 5 solution

clean_dataset <- function(data) {
  
  # Clean the column headings
  colnames(data) <- generalise_names(colnames(data))
  
  # Remove numeric indices from columns
  data <- dplyr::mutate(
    data, 
    dplyr::across(
      .cols = tidyselect::where(is.character), 
      .fns = remove_numbering
    )
  )
  
  # Make missing/unknown value entries more consistent
  dplyr::mutate(
    data, 
    dplyr::across(
      .cols = tidyselect::where(is.character), 
      .fns = clean_not_known
    )
  )
  
}






















## ----include=show_solution, purl=purl_solutions-------------------------------------------------------------------------
# Exercise 6 solution
plot_prosecutions <- function(df, breakdown = "offence_type") {
  
  df_grouped <- df |>
    dplyr::group_by(.data[[breakdown]], year) |>
    dplyr::summarise(counts = sum(count), .groups = "keep")
  
  df_grouped |>
    ggplot2::ggplot(
      ggplot2::aes(x = .data$year, 
                   y = .data$counts, 
                   group = .data[[breakdown]], 
                   col = .data[[breakdown]])
    ) +
    ggplot2::geom_line() +
    ggplot2::scale_x_continuous(breaks = 0:2100) +
    ggplot2::theme_classic()
}


## ----fig.width=10, include=show_solution, purl=purl_solutions-----------------------------------------------------------
# Exercise 6 solution

plot_prosecutions(prosecutions, breakdown = "offence_group")














## ----purl_example_code, error = TRUE, eval = FALSE----------------------------------------------------------------------
## # Exercise 7 assertion statement
## 
## assertthat::assert_that(c %% 1 == 0)
## 


## ----include=show_solution, purl=purl_solutions, error = TRUE-----------------------------------------------------------
# Exercise 7 solution - function to return hypotenuse length rounded to whole number
pythagoras_rounded <- function(a, b) {
  
  assertthat::assert_that(
    !missing(a) && !missing(b),
    msg = "you must supply two triangle lengths")
  
  assertthat::assert_that(
    is.numeric(a) && is.numeric(b),
    msg = "both arguments must be of numeric data type")
  
  assertthat::assert_that(
    a > 0 && b > 0,
    msg = "both triangle sides must have positive length!")
  
  # round the value to ensure it passes the assertion
  c <- round(sqrt(a^2 + b^2))
  
  # assertion statement checks that rounding has occurred
  assertthat::assert_that(
    c %% 1 == 0,
    msg = "calculated answer is not a whole number")
  
  paste0("The rounded length of the hypotenuse is ", c)
}


## ----include=show_solution, purl=purl_solutions, error = TRUE-----------------------------------------------------------
pythagoras_rounded(2, 3)

