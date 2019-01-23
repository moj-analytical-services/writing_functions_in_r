# This file is where we are keeping our functions


# This function adds 2 to the input variable
add_two <- function(x){ # On this line we've named our function 'add_two', and have included 'x' as an input variable
  
  # This function takes the input variable 'x', and adds 2 to it
  result <- x + 2
  return(result) # The output of the function
  
}

# Sums the squares of two input variables
sum_squares <- function(x, y){
  
  result <- x^2 + y^2
  return(result)
  
}

# Returns the modulus/absolute value of the input variable
mod_x <- function(x){
  
  if(x < 0){
    return(-x)
  }
  else{
    return(x)
  }
  
}

# Prints a statement saying whether the input variable is odd, even, or non-integer
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

# Adds two numbers together
add_a_number <- function(x, y=NULL){ # y is the optional input, with a default value of NULL
  
  if(!is.null(y)){
    return(x + y)
  }
  else{
    return(x)
  }
  
}

# Plots 2 numerical arrays against each other
plot_x_and_y <- function(x, y, ...){
  
  plot(x, y, ...)
  
}

# Generalises input strings by making all letters lowercase, and replacing all spaces and punctuation marks with an underscore
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





