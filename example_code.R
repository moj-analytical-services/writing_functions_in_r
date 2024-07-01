## ----purl=purl_example_code---------------------------------------------------------------------------------------------
x <- c(1, 2, 3, 4, 5) # Create a vector of numbers to sum
sum(x) # Sum the numbers contained in 'x'


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# Comment describing what the function does
function_name <- function(arg1, arg2) {
  # function body, e.g. 
  paste(arg1, arg2, "!")
}


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# This function takes the argument 'x', and adds 2 to it
add_two <- function(x) {
  
  x + 2
  
}


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# Calling the function by itself prints the result to the console
add_two(3)

# Alternatively the result can be saved as a new variable
result <- add_two(3) 
result


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# This function sums the squares of two numbers
sum_squares <- function(x, y) {
  
  x^2 + y^2
  
}

sum_squares(3, y = 5)


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# Good
sum_squares(3, y = 5)

# Acceptable
sum_squares(y = 5, x = 3)

# Bad
sum_squares(3, 5)






## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# This function returns the absolute value of a number
abs_x <- function(x) {
  if (x >= 0) {
    x
  } else {
    -x
  }
}

abs_x(-5)
abs_x(4)


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# why does this function always return -x?
abs_x_v2 <- function(x) {
  
  if (x >= 0) {
    x
  } 
  
  -x
  
}

abs_x_v2(-5)
abs_x_v2(4)


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# We can fix it by using an early return
abs_x_v3 <- function(x) {
  
  if (x >= 0) {
    return(x)
  } 
  
  -x
  
}

abs_x_v3(-5)
abs_x_v3(4)


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# This function lets you know whether a number is odd or even
odd_or_even <- function(x) {
  
  if ((x %% 2) == 0) {
    message("The number is even.")
  } else if ((x %% 2) == 1) {
    message("The number is odd.")
  }
  
}

odd_or_even(x = 4)


## ----error = TRUE, purl=purl_example_code-------------------------------------------------------------------------------
odd_or_even(x = 1.5)
odd_or_even(x = "a")
odd_or_even(x = c(1, 2, 3))


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# This function lets you know whether a number is odd or even
odd_or_even <- function(x) {
  if (length(x) > 1) {
    stop("x must have length 1.")
  } else if (!is.numeric(x)) {
    stop("x must be a number.")
  } else if ((x %% 2) == 0) {
    print("The number is even.")
  } else if ((x %% 2) == 1) {
    print("The number is odd.")
  } else if((x %% 2) != 0 && (x %% 2) != 1) {
    stop("x must be an integer.")
  }
  
}


## ----error = TRUE, purl=purl_example_code-------------------------------------------------------------------------------
odd_or_even(x = 1.5)
odd_or_even(x = "a")
odd_or_even(x = c(1, 2, 3))


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# This function either returns the sum of two numbers, or returns the argument if only one is supplied
add_a_number <- function(x, y = NULL) {
  
  if (!is.null(y)) {
    x + y
  } else {
    x
  }
  
}

add_a_number(x = 6)
add_a_number(x = 6, y = 7)


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# This function demonstrates the difference between NULL, NA and "missing"
return_x <- function(x) {
  if (missing(x)) {
    message("x is missing")
  } 
  if (is.null(x)) {
    message("x is null")
  }
  if (is.na(x)) {
    message("x is NA")
  }
  x
}

return_x(5)


## ----purl=purl_example_code, error = TRUE-------------------------------------------------------------------------------
return_x()
return_x(NULL)
return_x(NA)


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# This function returns the sum of two numbers raised to a particular power (with a default of 2)
sum_powers <- function(x, y, z = 2) {
  
  x ^ z + y ^ z
  
}

sum_powers(x = 3, y = 5)
sum_powers(x = 3, y = 5, z = 3)












## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# This function produces a plot of x vs y
plot_x_and_y <- function(x, y, ...) {
  
  plot(x, y, ...)
  
}

x <- 1:10
y <- (1:10) * 2


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
plot_x_and_y(x, y)


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
plot_x_and_y(x, y, col='red', type='l')


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
iris_by_species_1 <- function(species) {
  datasets::iris |> filter(iris[[5]] == species) |> dplyr::glimpse()
}

iris_by_species_2 <- function(species) {
  datasets::iris |> dplyr::filter(iris[[5]] == species) |> dplyr::glimpse()
}

iris_by_species_1("setosa")
iris_by_species_2("setosa")


## ----message=F, warning=F, purl=purl_example_code-----------------------------------------------------------------------
prosecutions_and_convictions <- Rs3tools::read_using(
  FUN = read.csv,
  s3_path = "s3://alpha-r-training/writing-functions-in-r/prosecutions-and-convictions-2018.csv"
)

# Filter for Magistrates Court to extract the prosecutions
prosecutions <- prosecutions_and_convictions |>
  dplyr::filter(`Court.Type` == "Magistrates Court")


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
dplyr::glimpse(prosecutions)


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# This function standardises strings contained in a vector
generalise_names <- function(names) {
  
  names |> 
    # Convert any uppercase letters to lowercase
    tolower() |> 
    # Trim any blank spaces at the start or end of each string
    stringr::str_trim() |> 
    # Replace anything that isn't a letter or number with an underscore
    stringr::str_replace_all(pattern = "[^A-Za-z0-9]", replacement = "_") |> 
    # Remove repeated underscores
    stringr::str_remove_all(pattern = "(?<=_)_+") |> 
    # Remove any underscore at the beginning or end of the string
    stringr::str_remove_all(pattern = "^_|_$")
  
}


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
names <- c("Option 1", "   Option (1)", "Option: 1", "option 1", "OPTION - 1")
generalise_names(names)




## ----echo=FALSE, purl=purl_example_code---------------------------------------------------------------------------------
dplyr::glimpse(prosecutions[, 1:10])


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# This function removes patterns at the start of a string that are: 
# 1 or 2 digits followed by any number of colons and/or spaces

remove_numbering <- function(x) {
  stringr::str_remove(x, pattern = "^\\d{1,2}\\s*:*\\s*")
}


## ----purl=purl_example_code---------------------------------------------------------------------------------------------

some_strings <- c("01 :foo", "01 foo", "01: foo", "01  :  foo", "foo", "bar foo")
remove_numbering(some_strings)



## ----purl=purl_example_code---------------------------------------------------------------------------------------------
prosecutions <- dplyr::mutate(prosecutions, across(where(is.character), remove_numbering)) 
dplyr::glimpse(prosecutions)


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
clean_not_known <- function(x,
                            not_known_phrase = "Not known",
                            values_to_change = c("n/a", "not known", "unknown", "not stated")) {
  
  # Replace any missing (NA) values
  x <- replace(x, list = is.na(x), values = not_known_phrase)
  
  # Remove any white space that might cause the strings to not match
  x <- stringr::str_trim(x)
  
  # Replace strings in the data that refer to a missing or unknown value.
  dplyr::if_else(tolower(x) %in% values_to_change, true = not_known_phrase, false = x)
  
}


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
prosecutions <- dplyr::mutate(
  prosecutions, 
  dplyr::across(
    .cols = tidyselect::where(is.character), 
    .fns = clean_not_known
  )
)

dplyr::glimpse(prosecutions)






## ----include=FALSE, purl=purl_example_code------------------------------------------------------------------------------
# Solution to exercise 3 - must run before the next section
colnames(prosecutions) <- colnames(prosecutions) |> generalise_names()


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
prosecutions_grouped <- prosecutions |>
  dplyr::group_by(age_range) |>
  dplyr::summarise(counts = sum(count))


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
prosecutions_grouped


## ----purl=purl_example_code, fig.height = 3-----------------------------------------------------------------------------
foo <- 1:10
bar <- 10:1
plot(foo, bar)


## ----error = TRUE, purl=purl_example_code-------------------------------------------------------------------------------
# This function produces a summary table based on a dataset
sum_group <- function(df, group_col, sum_col) {
  
  df |>
    dplyr::group_by(group_col) |>
    dplyr::summarise(counts = sum(sum_col))
  
}


## ----error = TRUE, purl=purl_example_code-------------------------------------------------------------------------------
prosecutions_grouped <- sum_group(df = prosecutions, group_col = "age_range", sum_col = "count")


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# This function produces a summary table based on a dataset
sum_group <- function(df, group_col, sum_col) {
  
  df |>
    dplyr::group_by(.data[[group_col]]) |>
    dplyr::summarise(counts = sum(.data[[sum_col]]))
  
}


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
prosecutions_grouped <- sum_group(df = prosecutions, group_col = "age_range", sum_col = "count")
prosecutions_grouped


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# This function produces a plot of the number of prosecutions over time
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
    ggplot2::theme_grey()
}


## ----fig.width=10, purl=purl_example_code-------------------------------------------------------------------------------
# Call function
plot_prosecutions(prosecutions, breakdown = "offence_type")






## ----purl=purl_example_code, error = TRUE-------------------------------------------------------------------------------
my_mean <- function(x, y) {
  x + y / 2
}

my_mean(3, 5)



## ----purl=purl_example_code, error = TRUE-------------------------------------------------------------------------------
# Function to calculate the length of a hypotenuse 
pythagoras <- function(a, b) {
  
  c <- sqrt(a^2 + b^2)
  
  paste0("The length of the hypotenuse is ", c)
  
}

pythagoras(2, -3)



## ----purl=purl_example_code, error = TRUE-------------------------------------------------------------------------------
# Function to calculate the length of a hypotenuse 
pythagoras <- function(a, b) {
  
  assertthat::assert_that(a > 0)
  assertthat::assert_that(b > 0)
  
  c <- sqrt(a^2 + b^2)
  
  paste0("The length of the hypotenuse is ", c)
  
}

pythagoras(2, -3)



## ----purl=purl_example_code, error = TRUE-------------------------------------------------------------------------------
# Function to calculate the length of a hypotenuse 
pythagoras <- function(a, b) {
  
  assertthat::assert_that(
    a > 0 && b > 0,
    msg = "both triangle sides must have positive length!")
  
  c <- sqrt(a^2 + b^2)
  
  paste0("The length of the hypotenuse is ", c)
  
}

pythagoras(-2, 1)



## ----purl=purl_example_code, error = TRUE-------------------------------------------------------------------------------
# Function to calculate the length of a hypotenuse 
pythagoras <- function(a, b) {
  
  assertthat::assert_that(
    !missing(a) && !missing(b),
    msg = "you must supply two triangle lengths")
  
  assertthat::assert_that(
    is.numeric(a) && is.numeric(b),
    msg = "both arguments must be of numeric data type")
  
  assertthat::assert_that(
    a > 0 && b > 0,
    msg = "both triangle sides must have positive length!")
  
  sqrt(a^2 + b^2)
  
}



## ----purl=purl_example_code, error = TRUE-------------------------------------------------------------------------------
pythagoras("1", 2)

pythagoras(b = 2)


## ----purl_example_code, error = TRUE, eval = FALSE----------------------------------------------------------------------
## # Exercise 7 assertion statement
## 
## assertthat::assert_that(c %% 1 == 0)
## 






## ----purl=purl_example_code---------------------------------------------------------------------------------------------
source("functions.R")


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
# Create a list of colours to provide to the function
colours <- c("Red", "Blue", "Green", "Magenta", "Cyan", "Yellow", "Purple", "Pink")
pick_a_colour(colours)


## ----purl=purl_example_code---------------------------------------------------------------------------------------------
pick_a_colour

