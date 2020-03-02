## ------------------------------------------------------------------------

x <- c(1, 2, 3, 4, 5) # Create a vector of numbers to sum
sum_x <- sum(x) # Sum the numbers contained in 'x', and save the result as a new variable 'sum_x'



## ------------------------------------------------------------------------
function_name <- function(arg1, arg2) {
        # function body, e.g. 
        print(paste(arg1, arg2))
}



## ------------------------------------------------------------------------
# This function takes the argument 'x', and adds 2 to it
add_two <- function(x) {
  
  result <- x + 2
  return(result)
  
}


## ------------------------------------------------------------------------
# Calling the function by itself prints the result to the console
add_two(3)

# Alternatively the result can be saved as a new variable
result <- add_two(3) 


## ------------------------------------------------------------------------

# This function sums the squares of two numbers
sum_squares <- function(x, y) {
  
  result <- x^2 + y^2
  return(result)
  
}

sum_squares(3, 5)



## ------------------------------------------------------------------------

sum_squares(x = 3, y = 5)
sum_squares(y = 5, x = 3)







## ------------------------------------------------------------------------

# This function returns the absolute value of a number
abs_x <- function(x) {
  if (x < 0) {
    return(-x)
  } else {
    return(x)
  }
}

abs_x(-5)



## ------------------------------------------------------------------------
# This function lets you know whether a number is odd or even
odd_or_even <- function(x) {

  if ((x %% 2) == 0) {
    print("The number is even.")
  } else if ((x %% 2) == 1) {
    print("The number is odd.")
  }
  
}

odd_or_even(x = 4)



## ----error = TRUE--------------------------------------------------------
odd_or_even(x = 1.5)
odd_or_even(x = "a")
odd_or_even(x = c(1, 2, 3))



## ------------------------------------------------------------------------
# This function lets you know whether a number is odd or even
odd_or_even <- function(x) {
  
  if (length(x) > 1){
    stop("x must have length 1.")
  } else if (!is.numeric(x)){
    stop("x must be a number.")
  } else if ((x %% 2) == 0) {
    print("The number is even.")
  } else if ((x %% 2) == 1) {
    print("The number is odd.")
  } else if((x %% 2) != 0 & (x %% 2) != 1){
    stop("x must be an integer.")
  }

}



## ----error = TRUE--------------------------------------------------------
odd_or_even(x = 1.5)
odd_or_even(x = "a")
odd_or_even(x = c(1, 2, 3))



## ------------------------------------------------------------------------
# This function either returns the sum of two numbers, or returns the argument if only one is supplied
add_a_number <- function(x, y = NULL) {
  
  if (!is.null(y)) {
    return(x + y)
  } else {
    return(x)
  }
  
}

add_a_number(x = 6)
add_a_number(x = 6, y = 7)



## ------------------------------------------------------------------------
# This function returns the sum of two numbers raised to a particular power (with a default of 2)
sum_powers <- function(x, y, z = 2) {
  
  result <- x ^ z + y ^ z
  return(result)
  
}

sum_powers(x = 3, y = 5)
sum_powers(x = 3, y = 5, z = 3)











## ------------------------------------------------------------------------
# This function produces a plot of x vs y
plot_x_and_y <- function(x, y, ...) {
  
  plot(x, y, ...)
  
}

x <- 1:10
y <- (1:10) * 2



## ------------------------------------------------------------------------

plot_x_and_y(x, y)



## ------------------------------------------------------------------------

plot_x_and_y(x, y, col='red', type='l')



## ----message=F, warning=F------------------------------------------------
# Load packages
library(s3tools)
library(dplyr)
library(stringr)
library(purrr)
library(lubridate)


## ----message=F, warning=F------------------------------------------------
prosecutions_and_convictions <- s3tools::s3_path_to_full_df(
  "alpha-r-training/writing-functions-in-r/prosecutions-and-convictions-2018.csv")

# Filter for Magistrates Court to extract the prosecutions
prosecutions <- prosecutions_and_convictions %>%
  filter(`Court.Type` == "Magistrates Court")


## ------------------------------------------------------------------------
glimpse(prosecutions)


## ------------------------------------------------------------------------
# This function standardises strings contained in a vector
generalise_names <- function(names) {
  
  # Convert any uppercase letters to lowercase
  names <- tolower(names)
  # Trim any blank spaces at the start or end of each string
  names <- stringr::str_trim(names)
  # Replace spaces with an underscore
  names <- stringr::str_replace_all(names, " ", "_")
  # Replace anything that isn't a letter or number with an underscore
  names <- stringr::str_replace_all(names, "[^A-Za-z0-9]", "_")
  # Replace repeated underscores with a single underscore
  names <- stringr::str_replace_all(names, "([_])\\1+", "\\1")
  # Remove any underscores at the beginning or end of the string
  names <- stringr::str_replace_all(names, "^\\_+|\\_+$", "")
  
  return(names)
  
}



## ------------------------------------------------------------------------

names <- c("Option 1", "   Option (1)", "Option: 1", "option 1", "OPTION - 1")
generalise_names(names)





## ---- echo=FALSE---------------------------------------------------------
glimpse(prosecutions[,1:10])


## ------------------------------------------------------------------------
# This function identifies and removes 1 or 2 digits followed by a colon or a space
remove_numbering <- function(x) {

  x <- stringr::str_replace(x, "^[:digit:]{1,2}[:blank:]*:[:blank:]*|^[:digit:]{1,2}[:blank:]", "")
  
  return(x)
  
}



## ------------------------------------------------------------------------
prosecutions <- purrr::modify_if(prosecutions, is.character, remove_numbering)
glimpse(prosecutions)


## ------------------------------------------------------------------------

clean_not_known <- function(x,
                            not_known_phrase = "Not known",
                            values_to_change = c("n/a", "not known", "unknown", "not stated")) {
  
  # Replace any missing (NA) values
  x <- replace(x, is.na(x), not_known_phrase)
  
  # Remove any white space that might cause the strings to not match
  x <- stringr::str_trim(x)
  
  # Replace strings in the data that refer to a missing or unknown value
  x <- ifelse(tolower(x) %in% values_to_change, not_known_phrase, x)
  
  return(x)

}



## ------------------------------------------------------------------------
prosecutions <- purrr::modify_if(prosecutions, is.character, clean_not_known)
glimpse(prosecutions)






## ------------------------------------------------------------------------
# Note: if you are running this code from 'example_code.R', then Exercise 1 must be completed first

prosecutions_grouped <- prosecutions %>%
  dplyr::group_by(age_range) %>%
  dplyr::summarise(counts = sum(count))


## ------------------------------------------------------------------------
prosecutions_grouped


## ----error = TRUE--------------------------------------------------------
# This function produces a summary table based on a dataset
sum_group <- function(df, group_cols, sum_col) {
  
  summary <- df %>%
    dplyr::group_by(group_cols) %>%
    dplyr::summarise(counts = sum(sum_col))
  
  return(summary)
  
}


## ----error = TRUE--------------------------------------------------------
prosecutions_grouped <- sum_group(df = prosecutions, group_cols = "age_range", sum_col = "count")


## ------------------------------------------------------------------------
# This function produces a summary table based on a dataset
sum_group <- function(df, group_cols, sum_col) {
  
  summary <- df %>%
    dplyr::group_by_at(group_cols) %>%
    dplyr::summarise_at(sum_col, sum)
  
  return(summary)
  
}



## ------------------------------------------------------------------------
prosecutions_grouped <- sum_group(df = prosecutions, group_cols = "age_range", sum_col = "count")
prosecutions_grouped


## ------------------------------------------------------------------------

prosecutions_grouped <- sum_group(df = prosecutions, 
                                  group_cols = c("year", "offence_group"), 
                                  sum_col = "count")

head(prosecutions_grouped, 15)



## ------------------------------------------------------------------------
# This function produces a plot of the number of prosecutions over time
plot_prosecutions <- function(df, breakdown = "offence_type") {

  grouping_variables <- c(breakdown, "year")
  
  # Group and summarise data by year and breakdown variable
  df_grouped <- sum_group(df = df, 
                          group_cols = grouping_variables, 
                          sum_col = "count")

  # Produce the plot
  plot <- df_grouped %>%
    ggplot2::ggplot(ggplot2::aes_string(x = "year", y = "count", group = breakdown, col = breakdown)) +
    ggplot2::geom_line() +
    ggplot2::scale_x_continuous(breaks = 0:2100) +
    ggplot2::theme_grey()

  return(plot)
  
}



## ----fig.width=10--------------------------------------------------------
# Call function
plot_prosecutions(prosecutions, breakdown = "offence_type")






## ------------------------------------------------------------------------
# This function extracts the prosecutions from a particular year
extract_year <- function(data, end_date) {
  
  # Ensure the date is a date-time object
  if (is.character(end_date)) { end_date <- lubridate::dmy(end_date) }
  
  # Find end of quarter dates for the past year
  quarters_to_include <- end_date %m-% months(c(0, 3, 6, 9))
  
  # Format the dates to years and quarters
  years <- lubridate::year(quarters_to_include)
  quarters <- quarters(quarters_to_include)

  # Combine into a unique set of year-quarters
  yearquarters <- str_c(years, " ", quarters)
  
  # Filter data based on these years and quarters
  data <- data %>%
    dplyr::mutate(year_quarter = paste(year, quarter)) %>%
    dplyr::filter(year_quarter %in% yearquarters)
  
  return(data)
}



## ------------------------------------------------------------------------
prosecutions_extract <- extract_year(prosecutions, "31-Mar-2018")
glimpse(prosecutions_extract)


## ------------------------------------------------------------------------
source("functions.R")


## ------------------------------------------------------------------------
# Create a list of colours to provide to the function
colours <- c("Red", "Blue", "Green", "Magenta", "Cyan", "Yellow", "Purple", "Pink")
pick_a_colour(colours)


## ------------------------------------------------------------------------
pick_a_colour

