
# Writing functions in R

This repository is for the April 2019 [Coffee &
Coding](https://github.com/moj-analytical-services/Coffee-and-Coding)
session on writing functions in R:

> Knowing how to write your own functions is a great skill to add to
> your R toolbox. Writing functions can save you time, reduce the risk
> of errors, and make your code easier to understand. In this sesssion
> we’ll cover why, when and how to write your own functions, sharing
> plenty of examples to help you get started.

We are planning to use this material to develop a training session
offered by the ASD R Training Group so if you’d be interested in
attending or have any feedback on the content, please get in touch\!

All the notes for the session are available below.

## Pre-material

If you want to try running the example code during or after the session,
you can clone this repository.

  - If you have used GitHub and the Analytical Platform before, follow
    the instructions in [section 4.2.1 of the Platform User
    Guidance](https://moj-analytical-services.github.io/platform_user_guidance/using-github-with-the-platform.html#step-1-navigate-to-your-platform-r-studio-and-make-a-copy-of-the-github-project-in-your-r-studio).

  - If you have not used GitHub with the analytical platform before, you
    might need to set this up using the instructions in [section 2.3 of
    the Platform User
    Guidance](https://moj-analytical-services.github.io/platform_user_guidance/using-github-with-the-platform.html),
    before following the instructions in section 4.2.1 as above.

All the examples in the presentation/README are available in the R
script example\_code.R.

This isn’t necessary for the session so don’t worry if you’re not able
to do this\!

## What is a function?

Functions are a way to package up bits of code to make them easy to
reuse. Base R includes numerous built-in functions and there are
thousands more R functions in packages available on CRAN and elsewhere.

Here is an example of one of the built-in R functions, `sum()`:

``` r
x <- c(1, 2, 3, 4, 5) # Create a vector of numbers to sum
sum_x <- sum(x) # Sum the numbers contained in 'x', and save the result as a new variable 'sum_x'
```

You can also write your own functions, called “user-defined functions”.

Functions in a package are the same thing as functions you define
yourself, they’re just stored in a different way.

You can see the code underlying a function by typing its name (without
brackets) in the console and hitting “enter”.

## Why use functions?

### Code maintenance

Generally functions are used to automate common tasks, to avoid copying
and pasting the same code multiple times with minor alterations. While
writing a function has a small up front cost, you’ll reap the benefits
when you need to make changes to your code, and your QA’er will also
thank you, as they’ll only need to check your function works once\!

### Abstraction

One of the benefits of functions is they abstract away the details of
*how* the code works. To use a function, all you need to understand is
*what* the function is designed to do. You’ll need to understand how
your function works when you’re writing it of course, but you won’t need
to think about it everytime you use it.

### Code legibility

You can use functions to make your code better structured and easier to
read - done well, this can make your code a lot easier to understand for
someone unfamiliar with it, or even yourself a few months down the line.

## How to write a function

The syntax for creating a function is:

``` r
function_name <- function(arg1, arg2){
        # function body, e.g. 
        print(paste(arg1, arg2))
}
```

We use `function()` to create a function and assign it to the object
`function_name`.

A function is made up of three components:

  - Its **arguments** (in this example, `arg1` and `arg2`) - these are
    variables used inside the function body which we can set each time
    we call the function.

  - The function **body** (everything between the curly brackets) - this
    is where we put the code.

  - And the function **environment** (where the function was created) -
    this determines what variables and other functions it has access to
    - you can find out more about environments
    [here](https://r4ds.had.co.nz/functions.html#environment).

# Examples of functions

## Example 1: a basic function

Here’s an example of a very basic user-defined function:

``` r
# We've named our function 'add_two' and have included 'x' as an input variable (a function argument)
add_two <- function(x){
  # This function takes the argument 'x', and adds 2 to it
  result <- x + 2
  return(result)
}
```

Let’s try using the function `add_two()`:

``` r
# Calling the function by itself prints the result to the console
add_two(3)
```

    ## [1] 5

``` r
# Alternatively the result can be saved as a new variable
result <- add_two(3) 
```

## Example 2: multiple inputs

Functions can accept as many arguments as you like, but can only output
one object (if it is necessary to output more than one object, then the
desired outputs can be combined together into a list, and the list can
be returned). Here’s a function that requires two input variables:

``` r
sum_squares <- function(x, y){
  result <- x^2 + y^2
  return(result)
}

sum_squares(3, 5)
```

    ## [1] 34

Arguments can be specified by position or name. In the above example,
the function accepts arguments called `x` and `y`, with the order
specified as `x` then `y` in the function definition. Therefore when
`sum_squares(3, 5)` is called, the arguments are interpreted as `x = 3`
and `y = 5`. Alternatively, if we called `sum_squares(5, 3)` then the
arguments would be interpreted as `x = 5` and `y = 3`.

-----

For more complicated functions with lots of arguments, specifying the
arguments by position becomes more error-prone. Therefore it is often
desirable to specify the arguments by name, then the order of the
arguments doesn’t matter:

``` r
sum_squares(x = 3, y = 5)
```

    ## [1] 34

``` r
sum_squares(y = 5, x = 3)
```

    ## [1] 34

## Example 3: conditional statements in functions

Functions can return different outputs depending on some condition,
using the `return()` command:

``` r
mod_x <- function(x){
  if(x < 0){
    return(-x)
  }
  else{
    return(x)
  }
}

mod_x(-5)
```

    ## [1] 5

As soon as a `return()` statement is encountered in a function, the
function finishes and returns the variable in the `return()` statement.
In the above example, `return()` is used twice as there is a condition
with two possibilities. Either the input argument `x` is less than zero,
in which case the function ends with the `return(-x)` statement,
otherwise if `x` is not less than zero then the function continues to
the `return(x)` statement. Without a `return()` statement, a function
written in R will automatically return whatever variable is on the last
line of the function body.

## Example 4: functions without outputs

Depending on the purpose of the function, it doesn’t need to return an
output at all:

``` r
odd_or_even <- function(x){
  
  if((x %% 2) == 0){
    print("The number is even.")
  }
  else if((x %% 2) == 1) {
    print("The number is odd.")
  }

}

odd_or_even(x=4)
```

    ## [1] "The number is even."

## Example 5: errors and warnings

Sometimes it can be useful to include helpful error messages in
functions, by anticipating the sorts of variables that could input. What
happens if you try to use a non-integer or a string as an argument in
the above example? Try the running the function with the following
arguments:

``` r
odd_or_even(x=1.5)
odd_or_even(x="a")
```

    ## Error in x%%2: non-numeric argument to binary operator

``` r
odd_or_even(x=c(1,2,3))
```

    ## Warning in if ((x%%2) == 0) {: the condition has length > 1 and only the
    ## first element will be used

    ## Warning in if ((x%%2) == 1) {: the condition has length > 1 and only the
    ## first element will be used

    ## [1] "The number is odd."

-----

Here is an adapted version of the function, with some more informative
error messages built in using the `stop()` function:

``` r
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
```

-----

Now try passing some incompatible arguments to the function:

``` r
odd_or_even(x=1.5)
```

    ## Error in odd_or_even(x = 1.5): The number is not an integer.

``` r
odd_or_even(x="a")
```

    ## Error in odd_or_even(x = "a"): The argument is not a number.

``` r
odd_or_even(x=c(1,2,3))
```

    ## Error in odd_or_even(x = c(1, 2, 3)): The argument is not a single number.

`stop()` halts execution of the function and prints an error message to
the console; alternatively you can use `warning()`, which prints a
warning message to the console but does not stop execution of the
function.

## Example 6: optional arguments

Here’s an example of how to include optional arguments:

``` r
add_a_number <- function(x, y = NULL){ # y is the optional input, with a default value of NULL
  
  if(!is.null(y)){
    return(x + y)
  }
  else{
    return(x)
  }
  
}

add_a_number(x = 6)
```

    ## [1] 6

``` r
add_a_number(x = 6, y = 7)
```

    ## [1] 13

## Example 7: arguments with default values

Any value can be used as a default value for an argument. For example,
we can generalise the `sum_squares()` function by allowing it to sum
together two numbers raised to any power, but have a default power of 2:

``` r
sum_powers <- function(x, y, z = 2){
  
  result <- x ^ z + y ^ z
  return(result)
  
}

sum_powers(x = 3, y = 5)
```

    ## [1] 34

``` r
sum_powers(x = 3, y = 5, z = 3)
```

    ## [1] 152

## Example 8: the ellipsis argument

Sometimes being able to pass an arbitrary number of arguments can be
useful, especially when another function is called within a wrapper
function. This requires the ellipsis construct, `...`, which is designed
to pass a variable number of arguments to a function. Here’s an example:

``` r
plot_x_and_y <- function(x, y, ...){
  
  plot(x, y, ...)
  
}

x <- 1:10
y <- (1:10) * 2
```

-----

The function can be called with only the required arguments:

``` r
plot_x_and_y(x, y)
```

![](README_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->

-----

Or the function can be called with any optional arguments accepted by
the plot function:

``` r
plot_x_and_y(x, y, col='red', type='l')
```

![](README_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->

# “Real-world” example functions

This section builds on material covered in the [Intro R
Training](https://github.com/moj-analytical-services/IntroRTraining)
course and makes use of the `dplyr` package, which is a commonly used R
package for data manipulation. In the following examples we’ll see how
user-defined functions can be used to help with cleaning, summarising,
and plotting data. The data we’ll use is from the Criminal Justice
System Statistics quarterly publication: December 2018 (published in May
2019), which can be found
[here](https://www.gov.uk/government/statistics/criminal-justice-system-statistics-quarterly-december-2018).

-----

## Loading packages and data

First of all we need to load a few packages: • `s3tools` is an MoJ
package designed to interact with Amazon s3 - we will need this to help
read in some data from an s3 bucket.  
• `dplyr` is the package we’ll use to create summary tables from the
data. • `stringr` provides functions that can be used to manipulate
strings.  
• `purrr` provides functions to make the use of vectors and user-defined
functions easier.

``` r
# Load packages
library(s3tools)
library(dplyr)
library(stringr)
library(purrr)
```

Here we are reading in a copy of the `Prosecutions and Convictions`
dataset from s3 and storing the dataframe as a variable called
`prosecutions_and_convictions`. In the second step we’re filtering the
dataset to extract only the prosecutions and saving to another variable,
named `prosecutions`.

``` r
prosecutions_and_convictions <- s3tools::s3_path_to_full_df(
  "alpha-everyone/r_functions_training/prosecutions-and-convictions-2018.csv")

# Filter for Magistrates Court to extract the prosecutions
prosecutions <- prosecutions_and_convictions %>%
  filter(`Court.Type` == "Magistrates Court")
```

-----

Here’s a preview of the data stored in `prosecutions`:

``` r
glimpse(prosecutions)
```

    ## Observations: 107,493
    ## Variables: 16
    ## $ Year                      <int> 2008, 2008, 2008, 2008, 2008, 2008, 20…
    ## $ Quarter                   <chr> "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q…
    ## $ Sex                       <chr> "01: Male", "01: Male", "01: Male", "0…
    ## $ Type.of.Defendent         <chr> "01: Person", "01: Person", "01: Perso…
    ## $ Age.Group                 <chr> "01: Juveniles", "01: Juveniles", "01:…
    ## $ Age.Range                 <chr> "01: 10-11", "01: 10-11", "01: 10-11",…
    ## $ Ethnicity                 <chr> "N/A", "N/A", "N/A", "N/A", "N/A", "N/…
    ## $ Court.Type                <chr> "Magistrates Court", "Magistrates Cour…
    ## $ Offence.Type              <chr> "01 Indictable only", "01 Indictable o…
    ## $ Offence.Group             <chr> "02 Sexual offences", "03 Robbery", "0…
    ## $ Tried                     <chr> "5: Not tried", "01: Tried at magistra…
    ## $ Plea.at.the.Crown.Court   <chr> "N/A", "N/A", "N/A", "N/A", "N/A", "N/…
    ## $ Convicted..Not.convicted  <chr> "02: Not convicted", "01: Convicted", …
    ## $ Sentenced...Not.sentenced <chr> "02: Not sentenced", "01: Sentenced", …
    ## $ Outcome                   <chr> "01: Proceedings terminated early", "0…
    ## $ Count                     <int> 1, 6, 1, 1, 10, 1, 1, 1, 31, 1, 3, 15,…

## Cleaning data

After reading in a dataframe it can often be helpful to standardise the
column headings. Below is an example of a function that could be used
for this purpose. It takes a vector of strings as the argument, ensures
all letters in the string vector are lower-case, and makes use of
“regular expressions” or “regex” to find and replace all spaces and
punctuation marks with an underscore:

``` r
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
```

-----

Here is a demonstration of how functions such as this can be useful:

``` r
names <- c("Option 1", "   Option (1)", "Option: 1", "option 1", "OPTION - 1")
generalise_names(names)
```

    ## [1] "option_1" "option_1" "option_1" "option_1" "option_1"

### Exercise 1

Use the `generalise_names()` function defined above to clean the column
headings of this dataset (Hint: use the function `colnames()` to
retrieve the column headings of the dataset as a vector).

-----

-----

In this dataframe, some of the columns contain values with a number
along with a category; for example, the `age_group` column contains
categories like “01: Juveniles” rather than just “Juveniles”. These
numbers might be undesirable, so we can write a function to remove
these:

``` r
remove_numbering <- function(x) {
  
  # Remove 1 or 2 digits followed by a semicolon
  x <- stringr::str_replace(x,"^[:digit:]{1,2}[:blank:]*:[:blank:]*", "")
  # Remove 1 or 2 digits followed by a space
  x <- stringr::str_replace(x,"^[:digit:]{1,2}[:blank:]*", "")
  
  return(x)
}
```

-----

Then we can use the `map_if()` function from `purrr` to apply the
`remove_numbering()` function to all columns in the `prosecutions`
dataframe, with the condition that the column must contain strings.

``` r
prosecutions_cleaned <- purrr::map_if(prosecutions, is.character, remove_numbering) %>% as.data.frame()
glimpse(prosecutions)
```

    ## Observations: 107,493
    ## Variables: 16
    ## $ year                    <int> 2008, 2008, 2008, 2008, 2008, 2008, 2008…
    ## $ quarter                 <chr> "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1"…
    ## $ sex                     <chr> "01: Male", "01: Male", "01: Male", "01:…
    ## $ type_of_defendent       <chr> "01: Person", "01: Person", "01: Person"…
    ## $ age_group               <chr> "01: Juveniles", "01: Juveniles", "01: J…
    ## $ age_range               <chr> "01: 10-11", "01: 10-11", "01: 10-11", "…
    ## $ ethnicity               <chr> "N/A", "N/A", "N/A", "N/A", "N/A", "N/A"…
    ## $ court_type              <chr> "Magistrates Court", "Magistrates Court"…
    ## $ offence_type            <chr> "01 Indictable only", "01 Indictable onl…
    ## $ offence_group           <chr> "02 Sexual offences", "03 Robbery", "03 …
    ## $ tried                   <chr> "5: Not tried", "01: Tried at magistrate…
    ## $ plea_at_the_crown_court <chr> "N/A", "N/A", "N/A", "N/A", "N/A", "N/A"…
    ## $ convicted_not_convicted <chr> "02: Not convicted", "01: Convicted", "0…
    ## $ sentenced_not_sentenced <chr> "02: Not sentenced", "01: Sentenced", "0…
    ## $ outcome                 <chr> "01: Proceedings terminated early", "07:…
    ## $ count                   <int> 1, 6, 1, 1, 10, 1, 1, 1, 31, 1, 3, 15, 1…

-----

For the final stage of data cleaning, we can make missing and unknown
values more consistent using a function such as the following:

``` r
clean_not_known <- function(x,
                            not_known_phrase = "Not known",
                            change_na = TRUE,
                            values_to_change = c("n/a", "not known", "unknown", "not stated")) {
  
  # Replace any missing (NA) values
  if(change_na){
    x <- replace(x, is.na(x), not_known_phrase)
  }
  
  # Remove any white space that might cause the strings to not match
  x <- stringr::str_trim(x)
  
  # Replace strings in the data that refer to a missing or unknown values
  x <- ifelse(tolower(x) %in% values_to_change, not_known_phrase, x)
  
  return(x)

}
```

In this function we’ve included some default values, so by default
missing/NA values are replaced, and any strings that match “n/a”, “not
known”, “unknown”, or “not stated” are replaced. The default replacement
value is “Not known”.

-----

``` r
prosecutions <- purrr::map_if(prosecutions, is.character, clean_not_known) %>% as.data.frame()
glimpse(prosecutions)
```

    ## Observations: 107,493
    ## Variables: 16
    ## $ year                    <int> 2008, 2008, 2008, 2008, 2008, 2008, 2008…
    ## $ quarter                 <fct> Q1, Q1, Q1, Q1, Q1, Q1, Q1, Q1, Q1, Q1, …
    ## $ sex                     <fct> 01: Male, 01: Male, 01: Male, 01: Male, …
    ## $ type_of_defendent       <fct> 01: Person, 01: Person, 01: Person, 01: …
    ## $ age_group               <fct> 01: Juveniles, 01: Juveniles, 01: Juveni…
    ## $ age_range               <fct> 01: 10-11, 01: 10-11, 01: 10-11, 01: 10-…
    ## $ ethnicity               <fct> Not known, Not known, Not known, Not kno…
    ## $ court_type              <fct> Magistrates Court, Magistrates Court, Ma…
    ## $ offence_type            <fct> 01 Indictable only, 01 Indictable only, …
    ## $ offence_group           <fct> 02 Sexual offences, 03 Robbery, 03 Robbe…
    ## $ tried                   <fct> 5: Not tried, 01: Tried at magistrates c…
    ## $ plea_at_the_crown_court <fct> Not known, Not known, Not known, Not kno…
    ## $ convicted_not_convicted <fct> 02: Not convicted, 01: Convicted, 02: No…
    ## $ sentenced_not_sentenced <fct> 02: Not sentenced, 01: Sentenced, 02: No…
    ## $ outcome                 <fct> 01: Proceedings terminated early, 07: Fo…
    ## $ count                   <int> 1, 6, 1, 1, 10, 1, 1, 1, 31, 1, 3, 15, 1…

-----

### Exercise 2

Write a wrapper function to apply `generalise_names()`,
`remove_indices_from_columns()`, and `clean_not_known()` to the dataset.

-----

## Summarising data

Let’s say we wanted to create a summary table showing the number of
people prosecuted in different age bands. We could do:

``` r
prosecutions_grouped <- prosecutions %>%
  dplyr::group_by(age_range) %>%
  dplyr::summarise(counts = sum(count))
```

In the above code we are grouping the `prosecutions` dataframe by the
categories in the `age_range` column, then summarising the number of
prosecutions in each of those categories by summing the `count` column.

The resulting dataframe is saved as a variable called
`prosecutions_grouped`.

Notice how the `dplyr` functions `group_by()` and `summarise()` require
that the column names are not enclosed in quotation marks: this
behaviour is known as non-standard evalution, and will be important
later.

-----

``` r
prosecutions_grouped
```

    ## # A tibble: 14 x 2
    ##    age_range                           counts
    ##    <fct>                                <int>
    ##  1 01: 10-11                             3324
    ##  2 02: 12-14                           113960
    ##  3 03: 15-17                           570275
    ##  4 04: 18-20                          1302589
    ##  5 05: 21-24                          2131033
    ##  6 06: 25+ (prior to 2017)           10209264
    ##  7 07: 25-29 (2017 onwards)            447108
    ##  8 08: 30-39 (2017 onwards)            758230
    ##  9 09: 40-49 (2017 onwards)            477217
    ## 10 10: 50-59 (2017 onwards)            261626
    ## 11 11: 60+ (2017 onwards)              101554
    ## 12 12: Not known (Juvenile)               150
    ## 13 13: Not known (Adult)               195459
    ## 14 14: Companies, public bodies etc.   114771

-----

What if we wanted to create several different summary tables? We could
write a function to avoid writing this out each time. Following the
previous examples in this course, you might expect this function to
work:

``` r
sum_group <- function(df, group_cols, sum_col) {
  
  summary <- df %>%
    dplyr::group_by(group_cols) %>%
    dplyr::summarise(counts = sum(sum_col))
  
  return(summary)
  
}
```

However trying to use this function results in an error.

``` r
prosecutions_grouped <- sum_group(df = prosecutions, group_cols = "age_range", sum_col = "count")
```

    ## Error: Column `group_cols` is unknown

-----

This is because of the non-standard evalutation (NSE) mentioned above.
The `dplyr` functions don’t recognise `group_cols` and `sum_col` as
column names, because they can’t see that these are variables containing
the actual column names. While the NSE usually makes the `dplyr`
functions more convenient to use, it makes them slightly trickier to use
in user-defined functions.

Fortunately to get around the NSE problem, functions have been added to
the `dplyr` package that accept variables instead of straight column
names. The function below shows an example of how the functions
`group_by_at` and `summarise_at` can replace `group_by` and `summarise`.

The way that the tidyverse packages handle NSE is still evolving, so new
methods of addressing this issue may be introduced in the future. See
the appendix for some examples of alternative methods to tackle this
problem.

``` r
sum_group <- function(df, group_cols, sum_col) {
  
  summary <- df %>%
    dplyr::group_by_at(group_cols) %>%
    dplyr::summarise_at(sum_col, sum)
  
  return(summary)
  
}
```

-----

``` r
prosecutions_grouped <- sum_group(df = prosecutions, group_cols = "age_range", sum_col = "count")
prosecutions_grouped
```

    ## # A tibble: 14 x 2
    ##    age_range                            count
    ##    <fct>                                <int>
    ##  1 01: 10-11                             3324
    ##  2 02: 12-14                           113960
    ##  3 03: 15-17                           570275
    ##  4 04: 18-20                          1302589
    ##  5 05: 21-24                          2131033
    ##  6 06: 25+ (prior to 2017)           10209264
    ##  7 07: 25-29 (2017 onwards)            447108
    ##  8 08: 30-39 (2017 onwards)            758230
    ##  9 09: 40-49 (2017 onwards)            477217
    ## 10 10: 50-59 (2017 onwards)            261626
    ## 11 11: 60+ (2017 onwards)              101554
    ## 12 12: Not known (Juvenile)               150
    ## 13 13: Not known (Adult)               195459
    ## 14 14: Companies, public bodies etc.   114771

-----

The `sum_group()` function also allows us to add any number of grouping
columns:

``` r
prosecutions_grouped <- sum_group(df = prosecutions, 
                                  group_cols = c("year", "offence_group"), 
                                  sum_col = "count")

glimpse(prosecutions_grouped)
```

    ## Observations: 133
    ## Variables: 3
    ## Groups: year [11]
    ## $ year          <int> 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 20…
    ## $ offence_group <fct> 01 Violence against the person, 02 Sexual offences…
    ## $ count         <int> 45119, 8353, 13096, 146304, 11278, 56953, 17968, 1…

## Plotting data

Let’s say we want to produce some plots, and want them all to have the
same style. We can define the style of the plot in a function, then we
only have to change the styling in one place if it needs changing. Here
we’ve gone for a line chart with a red line.

``` r
make_line_chart <- function(df, x_col, y_col) {
  
  # The `pull()` function extracts the contents of a single column as a vector.
  x <- df %>% dplyr::pull(x_col)
  y <- df %>% dplyr::pull(y_col)
  
  plot(x, y, col='red', type='l', xlab=x_col, ylab=y_col)
  
}
```

-----

Let’s use the `sum_group()` and `make_line_chart()` functions to produce
a plot of the total number of prosecutions in each year.

``` r
time_series <- sum_group(df = prosecutions, group_cols = "year", sum_col = "count")

make_line_chart(time_series, x="year", y="count")
```

![](README_files/figure-gfm/unnamed-chunk-36-1.png)<!-- -->

## Extracting a subset of the data

Often processing data requires manipulating dates and times. For
example, if we wanted to extract the prosecutions in a particular
year/quarter based on a given date, we could use a function like:

``` r
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
```

-----

``` r
prosecutions_extract <- extract_quarter(prosecutions, "31-Mar-2018")
glimpse(prosecutions_extract)
```

    ## Observations: 3,675
    ## Variables: 16
    ## $ year                    <int> 2018, 2018, 2018, 2018, 2018, 2018, 2018…
    ## $ quarter                 <fct> Q1, Q1, Q1, Q1, Q1, Q1, Q1, Q1, Q1, Q1, …
    ## $ sex                     <fct> 01: Male, 01: Male, 01: Male, 01: Male, …
    ## $ type_of_defendent       <fct> 01: Person, 01: Person, 01: Person, 01: …
    ## $ age_group               <fct> 01: Juveniles, 01: Juveniles, 01: Juveni…
    ## $ age_range               <fct> 01: 10-11, 01: 10-11, 01: 10-11, 01: 10-…
    ## $ ethnicity               <fct> 01: White, 01: White, 01: White, 02: Bla…
    ## $ court_type              <fct> Magistrates Court, Magistrates Court, Ma…
    ## $ offence_type            <fct> 01 Indictable only, 02 Triable either wa…
    ## $ offence_group           <fct> 03 Robbery, 04 Theft Offences, 05 Crimin…
    ## $ tried                   <fct> 01: Tried at magistrates court, 5: Not t…
    ## $ plea_at_the_crown_court <fct> Not known, Not known, Not known, Not kno…
    ## $ convicted_not_convicted <fct> 01: Convicted, 02: Not convicted, 02: No…
    ## $ sentenced_not_sentenced <fct> 01: Sentenced, 02: Not sentenced, 02: No…
    ## $ outcome                 <fct> 07: Found guilty, 01: Proceedings termin…
    ## $ count                   <int> 1, 2, 1, 1, 1, 1, 7, 11, 1, 5, 6, 1, 2, …

# Hints and tips

## When to write a function

### When you’ve copied and pasted three times

There is a principal in software engineering called Don’t Repeat
Yourself (DRY) - which basically states that you should avoid
duplication wherever possible. A good rule of thumb is whenever you find
you’ve copied and pasted the same code three times, it’s time to
consider replacing that code with a function.

### To structure your code

You may also sometimes want to write a function for code you’re only
planning to use once as a way of structuring your code and “hiding” some
of it to make your main script easier to read.

### When someone hasn’t already written one for you

The R ecosystem is full of high quality packages designed to solve all
kinds of problems - it’s generally best to make sure that a function
doesn’t already exist before writing your own.

## Best practice

Writing a function is easy, writing a really good function can be a lot
harder\! Here are a few things to consider:

### Give your function a good name

The name of a function should give you a good idea of what it does.
Generally function names should be concise and use verbs rather than
nouns.

### Document your code

You should have comments explaining what your function does, what each
argument is, and what it returns.

### Keep it short

A rule of thumb is if all the code for your function doesn’t fit on your
screen at the same time, it’s probably too complicated. Consider
splitting it up into multiple functions.

-----

### Generalise

Think about whether there are ways you can make your function usable in
more situations. For example, is there anything you’re hard-coding which
you could set as an argument instead?

### Vectorise by default

R is designed to work well with vectors (e.g. columns of a dataframe).
Where possible you should write your function so it can take a vector as
input and apply the transformation to each element. The
`generalise_names()` function we looked at is a good example of this\!

## How to organise your code

Whenever you’re working on something in R it’s generally best to create
an R project and version control your code on GitHub. There’s
information on how to do this in the Analytical Platform guidance.

It’s also best to keep your functions separate from the rest of your
code to make them easier to find.

### Storing your functions in your project

The easiest way to store your functions is just to create a folder in
your project called “functions” and save your functions there.

You could either put each function in its own R script with the same
name, or you could group related functions into clearly named scripts.

Then just use `source("my_functions_script.R")` (with
`"my_functions_script.R"` replaced with the name of your script) to run
the code and make your functions available to you in the current
session. As with loading libraries, it’s best to do this at the top of
your script.

-----

Here’s an example of calling a script that contains a new function,
called `pick_a_colour`:

``` r
source("functions.R")
```

Now the function is ready to use:

``` r
# Create a list of colours to provide to the function
colours <- c("Red", "Blue", "Green", "Magenta", "Cyan", "Yellow", "Purple", "Pink")
pick_a_colour(colours)
```

    ## [1] "Green"

## Writing a package

An alternative is to make your own package to store your functions which
you can then use like any other R package. There are a few advantages to
this:

  - It means you (and others) can access your functions from different
    projects
  - There are certain requirements for making R packages which enforce
    good practice, such as including documentation

This comes at the cost of slightly higher overheads.

A few examples of packages written by people in MoJ are:

  - [s3tools](https://github.com/moj-analytical-services/s3tools)
  - [asdrap](https://github.com/moj-analytical-services/asdrap)

To find out more about writing packages, check out the links under
further reading.

## Further reading

### On functions

  - [DataCamp writing functions in R
    course](https://www.datacamp.com/courses/writing-functions-in-r)
  - [Functions chapter](https://adv-r.hadley.nz/functions.html) of
    Hadley’s Advanced R book
  - [Tidy Evaluation](https://tidyeval.tidyverse.org/introduction.html)
    (useful for writing functions which behave like Tidyverse functions)

### On packages

  - [Writing an R package from
    scratch](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)
  - Hadley’s [R packages](http://r-pkgs.had.co.nz/) book

### Misc

  - [Tidyverse style guide](https://style.tidyverse.org/) (has some
    guidance on choosing function and argument names)
  - [Scoping/environments](https://bookdown.org/rdpeng/rprogdatascience/scoping-rules-of-r.html)

# Appendix

## Additional NSE examples

Below are more examples of how to handle `dplyr()`’s non-standard
evaluation. If you wanted to use the `group_by()` and `summarise()`
functions in a user-defined function, then one option is to have
variables containing the column names as strings, and including these
variables as function arguments. In the function these variables can be
enclosed by `!!as.name()` to convert them into names, like so:

``` r
sum_group_alt1 <- function(df, group_cols, sum_col) {

  summary <- df %>%
    dplyr::group_by(!!as.name(group_cols)) %>%
    dplyr::summarise(counts = sum(!!as.name(sum_col))) %>%
    janitor::adorn_totals("row")

  return(summary)

}

prosecutions_grouped <- sum_group_alt1(df = prosecutions, group_cols = "age_range", sum_col = "count")

prosecutions_grouped
```

    ##                          age_range   counts
    ##                          01: 10-11     3324
    ##                          02: 12-14   113960
    ##                          03: 15-17   570275
    ##                          04: 18-20  1302589
    ##                          05: 21-24  2131033
    ##            06: 25+ (prior to 2017) 10209264
    ##           07: 25-29 (2017 onwards)   447108
    ##           08: 30-39 (2017 onwards)   758230
    ##           09: 40-49 (2017 onwards)   477217
    ##           10: 50-59 (2017 onwards)   261626
    ##             11: 60+ (2017 onwards)   101554
    ##           12: Not known (Juvenile)      150
    ##              13: Not known (Adult)   195459
    ##  14: Companies, public bodies etc.   114771
    ##                              Total 16686560

Alternatively, this version of the function means the column names can
be input as function arguments directly (rather than needing to enclose
them in quote marks to turn them into strings).

``` r
sum_group_alt2 <- function(df, group_cols, sum_col) {

  summary <- df %>%
    dplyr::group_by(!!enquo(group_cols)) %>%
    dplyr::summarise(counts = sum(!!enquo(sum_col))) %>%
    janitor::adorn_totals("row")

  return(summary)

}

prosecutions_grouped <- sum_group_alt2(df = prosecutions, group_cols = age_range, sum_col = count)

prosecutions_grouped
```

    ##                          age_range   counts
    ##                          01: 10-11     3324
    ##                          02: 12-14   113960
    ##                          03: 15-17   570275
    ##                          04: 18-20  1302589
    ##                          05: 21-24  2131033
    ##            06: 25+ (prior to 2017) 10209264
    ##           07: 25-29 (2017 onwards)   447108
    ##           08: 30-39 (2017 onwards)   758230
    ##           09: 40-49 (2017 onwards)   477217
    ##           10: 50-59 (2017 onwards)   261626
    ##             11: 60+ (2017 onwards)   101554
    ##           12: Not known (Juvenile)      150
    ##              13: Not known (Adult)   195459
    ##  14: Companies, public bodies etc.   114771
    ##                              Total 16686560

## Adding an optional total row

We can extend the `sum_group()` function by having the option to add a
row with the total across all categories. Note that this requires the
`janitor` package.

``` r
library(janitor)

sum_group <- function(df, group_cols, sum_col, add_total=F) {
  
  summary <- df %>%
    dplyr::group_by_at(group_cols) %>%
    dplyr::summarise_at(sum_col, sum)
  
  if (add_total == T) {
    summary <- summary %>% janitor::adorn_totals("row")
  }
  
  return(summary)
  
}
```
