
Exercises
----------
  
### Exercise 1
Write a function that takes a number as an input and gives a string as an output where if the number is over a million, for example 1,200,000, then the returned string says "1.2 million", and similar for over a billion.
Hints: combine two strings together using the `paste()` function - eg. `paste("a", "b")`.


``` r

# Simple version:
format_mil_bil <- function(x) {
  if (x > 1.E9) {
    x <- paste(x/1.E9, "billion")
  } else if (x > 1.E6) {
    x <- paste(x/1.E6, "million")
  }
  
  return(x)
}

# Let's try a number
format_mil_bil(146476897)

# Version with extra formatting of the numbers:
format_mil_bil <- function(x) {
  if (x > 1.E9) {
    x <- paste(formatC(x/1.E9, digits=2, big.mark=",", format="f"), "billion")
  } else if (x > 1.E6) {
    x <- paste(formatC(x/1.E6, digits=2, big.mark=",", format="f"), "million")
  } else {
    x <- paste(formatC(x, big.mark=",", format="f"))
  }
  
  return(x)
}

# Let's try a number
format_mil_bil(146476897)

```