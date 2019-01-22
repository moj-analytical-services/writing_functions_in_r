# This R script demos a few examples of R functions

# ----- Example 1 -----

# R already has lots of built-in functions. An example of one of these is the 'sum' function:

x <- c(1,2,3,4,5) # Create an array of numbers to sum
sum_x <- sum(x) # Sum the numbers contained in 'x', and save the result as a new variable 'sum_x'


# ----- Example 2 -----

# Here's an example of a very basic custom function:

add_two <- function(x){ # On this line we've named our function 'add_two', and have included 'x' as an input variable
  
  # This function takes the input variable 'x', and adds 2 to it
  result <- x + 2
  return(result) # The output of the function
  
}

# Let's try using the function 'add_two'

x <- 3
add_two(x) # Calling the function by itself prints the result to the console
result <- add_two(x) # Alternatively the result can be saved as a new variable


# ----- Example 3 -----

# Functions can accept as many input variables as you like (but can only output one object)
sum_squares <- function(x, y){
  
  result <- x^2 + y^2
  return(result)
  
}

x <- 3
y <- 5
z <- sum_squares(x, y)


# ----- Example 4 -----

# Functions can return different outputs depending on some condition:

mod_x <- function(x){
  
  if(x < 0){
    return(-x)
  }
  else{
    return(x)
  }
  
}

x <- -5
mod_x(x)


# ----- Example 5 -----

# Depending on the purpose of the function, it doesn't need to return an output at all:

odd_or_even <- function(x){
  
  if (length(x) > 1){
    print("Please input a single number.")
  }
  else if((x %% 2) == 0){
    print("The number is even.")
  }
  else if((x %% 2) == 1) {
    print("The number is odd.")
  }
  else{
    print("The number is not an integer.")
  }

}

x <- 4
odd_or_even(x)


# ----- Example 6 -----

# Here's a less trivial example - this function takes a string array as the input, and ensures all letters
# are lower-case, and all spaces and punctuation marks are replaced with an underscore:

generalise_names <- function(names){
  
  library(stringr)
  
  names <- tolower(names) # Converts any uppercase letters to lowercase
  names <- stringr::str_trim(names) # Trim any blank spaces at the start or end of each string
  names <- stringr::str_replace_all(names, " ", "_") # Replaces spaces with an underscore
  names <- stringr::str_replace_all(names, "[^A-Za-z0-9]", "_") # Replaces anything that isn't a letter or number with an underscore
  names <- stringr::str_replace_all(names, "([_])\\1+", "\\1") # Replaces repeated underscores with a single underscore
  names <- stringr::str_replace_all(names, "^\\_+|\\_+$", "") # Removes any underscores at the beginning or end of the string
  
  return(names)
}

names <- c("Option 1", "   Option (1)", "Option: 1", "option 1", "OPTION - 1")

names <- generalise_names(names)
