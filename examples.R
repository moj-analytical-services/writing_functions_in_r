# This R script demos a few examples of R functions

# ----- Example 1 -----

# R already has lots of built-in functions. An example of one of these is the 'sum' function:

x <- c(1,2,3,4,5) # Create an array of numbers to sum
sum_x <- sum(x) # Sum the numbers contained in 'x', and save the result as a new variable 'sum_x'


# ----- Example 2 -----

# Here's an example of a very basic custom function:

add_two <- function(x){ # On this line we've named our function 'add_two', and have included 'x' as an input variable (a function argument)
  
  # This function takes the argument 'x', and adds 2 to it
  result <- x + 2
  return(result) # The output of the function
  
}

# Let's try using the function 'add_two'

add_two(3) # Calling the function by itself prints the result to the console
result <- add_two(3) # Alternatively the result can be saved as a new variable

# The return statement is not always necessary, as R will automatically return the variable on the last line of
# the function body. So this version of the function above would also work:

add_two <- function(x){ 
  
  result <- x + 2
  
}

result <- add_two(3)


# ----- Example 3 -----

# Functions can accept as many arguments as you like, but can only output one object. If it is necessary to output
# more than one object, then the desired outputs can be combined together into a list, and the list can be returned.

sum_squares <- function(x, y){
  
  result <- x^2 + y^2
  return(result)
  
}

z <- sum_squares(3, 5)

# The arguments can also be named when the function is called for clarity, and then the order or the arguments doesn't matter

sum_squares(x=3, y=5)
sum_squares(y=5, x=3)


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

odd_or_even(x=4)


# ----- Example 6 -----

# Here's an example of how to include optional arguments

add_a_number <- function(x, y=NULL){ # y is the optional input, with a default value of NULL
  
  if(!is.null(y)){
    return(x + y)
  }
  else{
    return(x)
  }
  
}

add_a_number(x=6)
add_a_number(x=6, y=7)


# ----- Example 7 -----

# Any value can be used as a default value for an optional argument. For example, we can generalise the
# sum_squares function above by allowing it to sum together two numbers raised to any power, but have a 
# default power of 2

sum_powers <- function(x, y, z=2){
  
  result <- x^z + y^z
  return(result)
  
}

sum_powers(x=3, y=5)
sum_powers(x=3, y=5, z=3)


# ----- Example 8 -----

# Sometimes being able to pass an arbitrary number of arguments can be useful, especially when another function
# is called within a wrapper function. Here's an example:

plot_x_and_y <- function(x, y, ...){
  
  plot(x, y, ...)
  
}

x <- 1:10
y <- (1:10) * 2

# The function can be called with only the required arguments:
plot_x_and_y(x, y)

# Or the function can be called with any optional arguments accepted by the plot function:
plot_x_and_y(x, y, col='red', type='l')


# ----- Example 9 -----

# Here's a less trivial example - this function takes a string array as the argument, and ensures all letters
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


# ----- Example 10 -----

# R scripts can get quite messy and difficult to follow if lots of functions are defined in the main script.
# Therefore it's good practise to keep functions in their own R script, for example in a script called "functions.R".
# To load the functions, so that they're ready to use, we just need to add the following line to the main script:

source("functions.R")
