## ------------------------------------------------------------------------

x <- c(1, 2, 3, 4, 5) # Create a vector of numbers to sum
sum_x <- sum(x) # Sum the numbers contained in 'x', and save the result as a new variable 'sum_x'



## ------------------------------------------------------------------------
function_name <- function(arg1, arg2){
        # function body, e.g. 
        print(paste(arg1, arg2))
}



## ------------------------------------------------------------------------

# We've named our function 'add_two' and have included 'x' as an input variable (a function argument)
add_two <- function(x){
  # This function takes the argument 'x', and adds 2 to it
  result <- x + 2
  return(result)
}



## ------------------------------------------------------------------------
# Calling the function by itself prints the result to the console
add_two(3)

# Alternatively the result can be saved as a new variable
result <- add_two(3) 



## ------------------------------------------------------------------------

sum_squares <- function(x, y){
  result <- x^2 + y^2
  return(result)
}

sum_squares(3, 5)



## ------------------------------------------------------------------------

sum_squares(x = 3, y = 5)
sum_squares(y = 5, x = 3)



## ------------------------------------------------------------------------

mod_x <- function(x){
  if(x < 0){
    return(-x)
  }
  else{
    return(x)
  }
}

mod_x(-5)



## ------------------------------------------------------------------------

odd_or_even <- function(x){
  
  if((x %% 2) == 0){
    print("The number is even.")
  }
  else if((x %% 2) == 1) {
    print("The number is odd.")
  }

}

odd_or_even(x=4)



## ----error = TRUE--------------------------------------------------------
odd_or_even(x=1.5)
odd_or_even(x="a")
odd_or_even(x=c(1,2,3))



## ------------------------------------------------------------------------

odd_or_even <- function(x){
  
  if (length(x) > 1){
    stop("The argument is not a single number.")
  }
  else if (!is.numeric(x)){
    stop("The argument is not a number.")
  }
  else if((x %% 2) == 0){
    print("The number is even.")
  }
  else if((x %% 2) == 1) {
    print("The number is odd.")
  }
  else if((x %% 2) != 0 & (x %% 2) != 1){
    stop("The number is not an integer.")
  }

}



## ----error = TRUE--------------------------------------------------------
odd_or_even(x=1.5)
odd_or_even(x="a")
odd_or_even(x=c(1,2,3))



## ------------------------------------------------------------------------

add_a_number <- function(x, y = NULL){ # y is the optional input, with a default value of NULL
  
  if(!is.null(y)){
    return(x + y)
  }
  else{
    return(x)
  }
  
}

add_a_number(x = 6)
add_a_number(x = 6, y = 7)



## ------------------------------------------------------------------------

sum_powers <- function(x, y, z = 2){
  
  result <- x ^ z + y ^ z
  return(result)
  
}

sum_powers(x = 3, y = 5)
sum_powers(x = 3, y = 5, z = 3)



## ------------------------------------------------------------------------

plot_x_and_y <- function(x, y, ...){
  
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


## ----message=F, warning=F------------------------------------------------
prosecutions <- s3tools::s3_path_to_full_df(
  "alpha-everyone/r_functions_training/prosecutions-and-convictions-2018.csv")

# Filter for Magistrates Court to extract the prosecutions
prosecutions <- prosecutions %>%
  filter(`Court.Type` == "Magistrates Court")


## ------------------------------------------------------------------------
head(prosecutions)


## ------------------------------------------------------------------------

generalise_names <- function(names){
  
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





## ------------------------------------------------------------------------

remove_indices_from_columns <- function(data){

  # Remove 1 or 2 digits followed by a semicolon for columns that contain strings
  data <- lapply(data, function(x) { if (is.character(x)) gsub("^\\d{1,2}:", "", x) else x })
  # Remove 1 or 2 digits followed by a space
  data <- lapply(data, function(x) { if (is.character(x)) gsub("^\\d{1,2}\\s", "", x) else x })  

  return(data)
  
}



## ------------------------------------------------------------------------
prosecutions[] <- remove_indices_from_columns(prosecutions)
head(prosecutions)


## ------------------------------------------------------------------------

clean_not_known <- function(data, not_known_phrase) {
  
  # Replace any missing (NA) values
  data <- data %>% replace(., is.na(.), not_known_phrase)
  
  # Create a version of the dataframe with all strings converted to lower
  # case and any white space at the start or end trimmed. This will make
  # the following stage easier.
  data_lowercase <- data
  data_lowercase[] <- lapply(data_lowercase, tolower)
  data_lowercase[] <- lapply(data_lowercase, stringr::str_trim)
  
  # Replace strings in the data that refer to a missing or unknown values
  data[data_lowercase == "n/a"] <- not_known_phrase
  data[data_lowercase == "not known"] <- not_known_phrase
  data[data_lowercase == "unknown"] <- not_known_phrase
  data[data_lowercase == "not stated"] <- not_known_phrase
  
  return(data)
  
}



## ------------------------------------------------------------------------
prosecutions <- clean_not_known(prosecutions, "Not known")
head(prosecutions)




## ------------------------------------------------------------------------
prosecutions_grouped <- prosecutions %>%
  dplyr::group_by(age_range) %>%
  dplyr::summarise(counts = sum(count))


## ------------------------------------------------------------------------
prosecutions_grouped


## ----error = TRUE--------------------------------------------------------
sum_group <- function(df, group_cols, sum_col) {
  
  summary <- df %>%
    dplyr::group_by(group_cols) %>%
    dplyr::summarise(counts = sum(sum_col))
  
  return(summary)
  
}


## ----error = TRUE--------------------------------------------------------
prosecutions_grouped <- sum_group(df = prosecutions, group_cols = "age_range", sum_col = "count")


## ------------------------------------------------------------------------

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

head(prosecutions_grouped)



## ------------------------------------------------------------------------
make_line_chart <- function(df, x_col, y_col){
  
  x <- df %>% dplyr::pull(x_col)
  y <- df %>% dplyr::pull(y_col)
  
  plot(x, y, col='red', type='l', xlab=x_col, ylab=y_col)
  
}


## ------------------------------------------------------------------------

time_series <- sum_group(df = prosecutions, group_cols = "year", sum_col = "count")

make_line_chart(time_series, x="year", y="count")



## ------------------------------------------------------------------------

extract_quarter <- function(data, date) {
  
  # Convert the format from a string to a date
  date <- as.Date(date, format="%d-%b-%Y")
  
  # Get the year and quarter based on the date
  this_year <- format(date, "%Y")
  this_quarter <- quarters(date)
  
  data <- data %>%
    dplyr::filter(year == this_year,
                  quarter == this_quarter)
  
}



## ------------------------------------------------------------------------
prosecutions_extract <- extract_quarter(prosecutions, "31-Mar-2018")
head(prosecutions_extract)


## ------------------------------------------------------------------------
source("functions.R")


## ------------------------------------------------------------------------
# Create a list of colours to provide to the function
colours <- c("Red", "Blue", "Green", "Magenta", "Cyan", "Yellow", "Purple", "Pink")
pick_a_colour(colours)

