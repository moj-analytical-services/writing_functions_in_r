Writing functions in R
================

This repository is for Writing Functions in R course offered by the DASD
R Training Group. It was also used for the April 2019 [Coffee &
Coding](https://github.com/moj-analytical-services/Coffee-and-Coding)
session.

Knowing how to write your own functions is a great skill to add to your
R toolbox. Writing functions can save you time, reduce the risk of
errors, and make your code easier to understand. In this course we’ll
cover why, when and how to write your own functions, with plenty of
examples & exercises to help you get started.

The session is intended to be accessible to anyone who is familiar with
the content of the [Introduction to
R](https://github.com/moj-analytical-services/IntroRTraining) training
session & has some experience of using R in their work.

This training session is periodically run in person/over Teams.
Alternatively, you can go through this material in your own time - all
the notes are available below and you can also find the recording of a
previous session
[here](https://web.microsoftstream.com/channel/aa3cda5d-99d6-4e9d-ac5e-6548dd55f52a).
See [Remote learning](#remote-learning) for more tips on going through
this material in your own time. If you work through the material by
youself please leave feedback about the material
[here](https://airtable.com/shr9u2OJB2pW8Y0Af).

If you have any feedback on the content, please get in touch\!

## Contents

  - [Pre-material](#pre-material)
  - [Remote learning](#remote-learning)
  - [Learning outcomes](#learning-outcomes)
  - [What is a function?](#what-is-a-function)
  - [Why use functions?](#why-use-functions)
  - [How to write a function](#how-to-write-a-function)
  - [Examples of basic functions](#examples-of-basic-functions)
  - [“Real-world” example functions](#real-world-example-functions)
  - [When to write a function](#when-to-write-a-function)
  - [Best practice](#best-practice)
  - [How to organise your code](#how-to-organise-your-code)
  - [Writing a package](#writing-a-package)
  - [Further reading](#further-reading)
  - [Appendix](#appendix)

## Pre-material

A few days before the session, please make sure that -

1.  You have access to RStudio on the Analytical Platform
2.  You have access to the [alpha-r-training s3
    bucket](https://cpanel-master.services.alpha.mojanalytics.xyz/datasources/607/)
3.  You have followed the steps in the [Configure Git and Github section
    of the Platform User
    Guidance](https://user-guidance.services.alpha.mojanalytics.xyz/introduction.html#configure-git-and-github)
    to configure Git and GitHub (this only needs doing once)
4.  You have cloned this repository (instructions are in the Analytical
    Platform User Guidance
    [here](https://user-guidance.services.alpha.mojanalytics.xyz/github.html#creating-your-project-repo-on-github))

If you have any problems with the above please get in touch with the
course organisers or ask for help on either the \#analytical\_platform
or \#intro\_r channel on [ASD slack](https://asdslack.slack.com).

All the examples in the presentation/README are available in the R
script example\_code.R.

## Remote learning

Here are a few suggestions if you are going through this material in
your own time:

  - Both the read me and slides contain the same content so you can use
    whichever works best for you - the only difference is the exercise
    solutions are only in the slides
  - To open the slides, first clone the repo (see
    [pre-material](#pre-material)) and then open the file “slides.html”
    from RStudio by clicking “View in web browser”
  - You can find a recording of a previous training session on the R
    training Microsoft Stream channel
    [here](https://web.microsoftstream.com/channel/aa3cda5d-99d6-4e9d-ac5e-6548dd55f52a)
  - If you need any help, the best place to ask is on either the
    [\#intro\_r](https://app.slack.com/client/T1PU1AP6D/CGKSJV9HN) or
    [\#r](https://app.slack.com/client/T1PU1AP6D/C1PUCG719) slack
    channels on ASD slack.

If you have any feedback on the material and/or your experience of
working through it in your own time, please get in touch with a member
of the R training group or leave a review on
[Airtable](https://airtable.com/shr9u2OJB2pW8Y0Af).

## Learning outcomes

### By the end of this session you should know:

  - How to write a basic function.
  - The circumstances when you might want to consider writing a
    function.
  - Why using functions is beneficial.
  - The best practice for writing functions.
  - Where to go for more information on some of the topics touched on in
    this course.

### Before we start

To follow along with the code run during this session and participate in
the exercises, open the script “example\_code.R” in RStudio. All the
code that we’ll show in this session is stored in “example\_code.R”, and
you can edit this script to write solutions to the exercises. You may
also want to have the course
[README](https://github.com/moj-analytical-services/writing_functions_in_r)
open as a reference.

-----

### A note on the examples given in this course

During this session we’ll show lots of examples of functions. Depending
on how experienced you are with using R, some of these examples may
introduce new concepts that are not the focus of this course. It is not
required that you have prior knowledge of these concepts, as they are
included only to demonstrate possible uses for functions when
undertaking typical programming tasks in DASD. One of the purposes of
the examples is to provide a resource that can be referred back to in
the future.

## What is a function?

Functions are a way to bundle up bits of code to make them easy to
reuse. Base R includes numerous built-in functions and there are
thousands more R functions in packages available on CRAN and elsewhere.

Here is an example of one of the built-in R functions, `sum()`:

``` r
x <- c(1, 2, 3, 4, 5) # Create a vector of numbers to sum
sum(x) # Sum the numbers contained in 'x'
```

    ## [1] 15

You can also write your own functions, called “user-defined functions”.

Functions in a package are the same thing as functions you define
yourself, they’re just stored in a different way.

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
to think about it every time you use it.

### Code legibility

You can use functions to make your code better structured and easier to
read - done well, this can make your code a lot easier to understand for
someone unfamiliar with it, or even yourself a few months down the line.

## How to write a function

The syntax for creating a function is:

``` r
# Comment describing what the function does
function_name <- function(arg1, arg2) {
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
    this determines what variables and other functions it has access to.
    You can find out more about environments
    [here](https://r4ds.had.co.nz/functions.html#environment).

# Examples of basic functions

## Example 1: a very basic function

Here’s an example of a very basic user-defined function, called
`add_two()`, that takes `x` as an argument:

``` r
# This function takes the argument 'x', and adds 2 to it
add_two <- function(x) {
  
  result <- x + 2
  return(result)
  
}
```

The `return()` statement can be used to explicitly state that `result`
should be the output of this function. Without a `return()` statement, a
function written in R will automatically return the value of the last
evaluated expression. So while it’s not always essential to use a
`return()` statement, it can make the code more clear and is consistent
with other programming languages.

-----

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

Note: before you can use a function you need to run the code to create
it.

## Example 2: multiple inputs

Functions can accept as many arguments as you like, but can only output
one object (if it is necessary to output more than one object, then the
desired outputs can be combined together into a list, and the list can
be returned). Here’s a function that requires two input variables:

``` r
# This function sums the squares of two numbers
sum_squares <- function(x, y) {
  
  result <- x^2 + y^2
  return(result)
  
}

sum_squares(3, 5)
```

    ## [1] 34

When you call a function, you can specify the arguments by position or
name. In this example, the function accepts arguments called `x` and
`y`, with the order specified as `x` then `y` in the function
definition. Therefore when `sum_squares(3, 5)` is called, the arguments
are interpreted as `x = 3` and `y = 5`. Alternatively, if we called
`sum_squares(5, 3)` then the arguments would be interpreted as `x = 5`
and `y = 3`.

-----

For more complicated functions with lots of arguments, specifying the
arguments by position becomes more error-prone and harder to understand.
Therefore it is often desirable to specify some or all of the arguments
by name, then the order of the arguments doesn’t matter:

``` r
sum_squares(x = 3, y = 5)
```

    ## [1] 34

``` r
sum_squares(y = 5, x = 3)
```

    ## [1] 34

**Hint**: if you want your function to work with the pipe operator
`%>%`, make sure the object you want to pipe (usually a dataframe) is
the first argument for your function.

## Exercises

Let’s start with some simple exercises to get familiar with the syntax
of writing functions.

### 1.1 hello\_world()

Create a function called `hello_world` which prints “Hello world\!” to
the console, and call the function.

### 1.2 my\_mean()

Create a function called `my_mean` which takes two arguments, `x` and
`y`, and calculates their mean. Call the function to find the mean of
7.5 and 16.

**Hint:** include a `return()` statement if you want your function to
print the result to the console.

-----

## Example 3: conditional statements in functions

Functions can return different outputs depending on some condition. In
this function the condition is `x < 0`, and the condition evaluates to
either `TRUE` or `FALSE`:

``` r
# This function returns the absolute value of a number
abs_x <- function(x) {
  if (x < 0) {
    return(-x)
  } else {
    return(x)
  }
}

abs_x(-5)
```

    ## [1] 5

As soon as a `return()` statement is encountered in a function, the
function finishes and returns the variable in the `return()` statement.
In the above example, `return()` is used twice as there is a condition
with two possibilities. Either the input argument `x` is less than zero,
in which case the function ends with the `return(-x)` statement,
otherwise if `x` is not less than zero then the function continues to
the `return(x)` statement.

## Example 4: functions with side-effects

Pipeable functions, i.e. ones that work with the pipe operator `%>%` and
usually take a dataframe as the first argument, come in two basic types:
transformations and side-effects. With transformations, an object is
passed to the function’s first argument and a modified object is
returned. With side-effects, the function performs an action on the
object, like drawing a plot or saving a file. The function below has the
side-effect of printing a message to the console, depending on the value
of the object:

``` r
# This function lets you know whether a number is odd or even
odd_or_even <- function(x) {

  if ((x %% 2) == 0) {
    print("The number is even.")
  } else if ((x %% 2) == 1) {
    print("The number is odd.")
  }
  
}

odd_or_even(x = 4)
```

    ## [1] "The number is even."

**Note:** It’s best practice for your function to either return a value
or have a side-effect, but not both.

## Example 5: errors and warnings

Sometimes it can be useful to include helpful error messages in
functions, e.g. by anticipating the sorts of variables that could be
input. What happens if you try to use a non-integer or a string as an
argument in the previous example? Try the running the function with the
following arguments:

``` r
odd_or_even(x = 1.5)
odd_or_even(x = "a")
```

    ## Error in x%%2: non-numeric argument to binary operator

``` r
odd_or_even(x = c(1, 2, 3))
```

    ## Warning in if ((x%%2) == 0) {: the condition has length > 1 and only the first element will be used

    ## Warning in if ((x%%2) == 1) {: the condition has length > 1 and only the first element will be used

    ## [1] "The number is odd."

-----

Here’s an adapted version of the function, with some more informative
error messages built in using the `stop()` function:

``` r
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
```

-----

Now try passing some incompatible arguments to the function:

``` r
odd_or_even(x = 1.5)
```

    ## Error in odd_or_even(x = 1.5): x must be an integer.

``` r
odd_or_even(x = "a")
```

    ## Error in odd_or_even(x = "a"): x must be a number.

``` r
odd_or_even(x = c(1, 2, 3))
```

    ## Error in odd_or_even(x = c(1, 2, 3)): x must have length 1.

`stop()` halts execution of the function and prints an error message to
the console. Alternatively you can use `warning()`, which prints a
warning message to the console but does not stop execution of the
function.

## Example 6: optional arguments

Here’s an example of how to include optional arguments, where in this
case the optional argument is called `y`:

``` r
# This function either returns the sum of two numbers, or returns the argument if only one is supplied
add_a_number <- function(x, y = NULL) {
  
  if (!is.null(y)) {
    return(x + y)
  } else {
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
together two numbers raised to any power, but with a default power of 2:

``` r
# This function returns the sum of two numbers raised to a particular power (with a default of 2)
sum_powers <- function(x, y, z = 2) {
  
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

## Exercises

### 2.1 fizz\_buzz()

Now try using an if else statement inside a function. Create a function
called `fizz_buzz()` which takes a number as input and:

  - If the number is divisible by both 3 and 5, returns “fizz buzz”
  - If the number is divisible by just 3, returns “fizz”
  - If the number is divisible by just 5, returns “buzz”
  - Otherwise the number is returned (coerced to character type using
    `as.character()`)

Try it out with values 1, 2, 3, 5 & 15.

-----

**Hints:**

  - This exercise is very similar to example 4. The structure of an
    if-else statement is:

<!-- end list -->

``` 
    if (condition_1) {
      code
    } else if (condition_2) {
      code
    } else {
      code
    }
```

  - To test whether a number is divisible by another number, you can use
    the modulus operator `%%`, which calculates the remainder. E.g. `1
    %% 3 == 0` evaluates to `FALSE`.
  - To find out more about if statements and conditional execution, see
    [here](https://r4ds.had.co.nz/functions.html#conditional-execution)

-----

-----

### 2.2 fizz\_buzz\_vec()

Most functions in R are vectorised. This means they can apply an
operation to every element of a vector at the same time. It’s best
practice to vectorise your own functions too as this will help you to
apply them to data sets and combine them with other functions.

Create a new version of the `fizz_buzz()` function called
`fizz_buzz_vec` which instead accepts a vector of numbers. Test it out
on a vector of the numbers 1 to 15.

**Hint:** the function `case_when()` from the Tidyverse package `dplyr`
is really useful when you want to vectorise multiple if-else statements,
each with a different desired outcome. Run `?case_when` to bring up the
help file.

*This exercise is a bit tricky - if you get stuck, you can still
complete exercise 2.3.*

-----

-----

### 2.3 fizz\_buzz\_custom()

Create a version of `fizz_buzz()` or `fizz_buzz_vec()` called
`fizz_buzz_custom()` or `fizz_buzz_custom_vec()` where the values for
when to say “fizz” and “buzz” can be changed by setting arguments `fizz`
and `buzz`, but the default values are still 3 and 5.

Test your new function out, first by checking you get the same results
as above when you don’t specify the `fizz` or `buzz` arguments, and
second when you set `buzz = 7` for values 1, 2, 3, 7, 15 and 21.

-----

-----

## Example 8: the ellipsis argument

Sometimes being able to pass an arbitrary number of arguments can be
useful, especially when another function is called within a wrapper
function. This requires the ellipsis construct, `...`, which is designed
to pass a variable number of arguments to a function. Here’s an example:

``` r
# This function produces a plot of x vs y
plot_x_and_y <- function(x, y, ...) {
  
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

![](README_files/figure-gfm/unnamed-chunk-22-1.png)<!-- -->

-----

Or the function can be called with any optional arguments accepted by
the plot function:

``` r
plot_x_and_y(x, y, col='red', type='l')
```

![](README_files/figure-gfm/unnamed-chunk-23-1.png)<!-- -->

# “Real-world” example functions

## “Real-world” example functions

This section builds on material covered in the [Intro R
Training](https://github.com/moj-analytical-services/IntroRTraining)
course and makes use of the `dplyr` package, which is a commonly used R
package for data manipulation. In the following examples we’ll see how
user-defined functions can be used to help with cleaning, summarising,
and plotting data. The data we’ll use is from the Criminal Justice
System Statistics quarterly publication: December 2018 (published in May
2019), which can be found
[here](https://www.gov.uk/government/statistics/criminal-justice-system-statistics-quarterly-december-2018).

Over the course of this section we’ll be tackling some exercises that
fit into a data processing story, so make sure you run the code in
“example\_code.R” as we go along.

## Loading packages and data

Before we start looking at more example functions, first of all we need
to load a few packages:

  - `s3tools` is an MoJ package designed to interact with Amazon s3 -
    we’ll need this to help read in some data from an s3 bucket.
  - `dplyr` is the package we’ll use to create summary tables from the
    data.
  - `stringr` provides functions that can be used to manipulate strings.

<!-- end list -->

``` r
# Load packages
library(s3tools)
library(dplyr)
library(stringr)
```

-----

Here we are reading in a copy of the `Prosecutions and Convictions`
dataset from s3 and storing the dataframe as a variable called
`prosecutions_and_convictions`. In the second step we’re filtering the
dataset to extract only the prosecutions and saving to another variable,
named `prosecutions`.

``` r
prosecutions_and_convictions <- s3tools::s3_path_to_full_df(
  "alpha-r-training/writing-functions-in-r/prosecutions-and-convictions-2018.csv")

# Filter for Magistrates Court to extract the prosecutions
prosecutions <- prosecutions_and_convictions %>%
  dplyr::filter(`Court.Type` == "Magistrates Court")
```

-----

Here’s a preview of the data stored in `prosecutions`:

``` r
glimpse(prosecutions)
```

    ## Rows: 107,493
    ## Columns: 16
    ## $ Year                      <int> 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008…
    ## $ Quarter                   <chr> "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1"…
    ## $ Sex                       <chr> "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male"…
    ## $ Type.of.Defendent         <chr> "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Per…
    ## $ Age.Group                 <chr> "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01…
    ## $ Age.Range                 <chr> "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-…
    ## $ Ethnicity                 <chr> "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "…
    ## $ Court.Type                <chr> "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "…
    ## $ Offence.Type              <chr> "01 Indictable only", "01 Indictable only", "01 Indictable only", "01 Indictable only", "02 Triable either way", "02 Triable either way", "02 Triable either way", "02 Triable either way", "0…
    ## $ Offence.Group             <chr> "02 Sexual offences", "03 Robbery", "03 Robbery", "07 Possession of weapons", "01 Violence against the person", "01 Violence against the person", "02 Sexual offences", "02 Sexual offences", …
    ## $ Tried                     <chr> "5: Not tried", "01: Tried at magistrates court", "01: Tried at magistrates court", "01: Tried at magistrates court", "01: Tried at magistrates court", "5: Not tried", "01: Tried at magistra…
    ## $ Plea.at.the.Crown.Court   <chr> "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "…
    ## $ Convicted..Not.convicted  <chr> "02: Not convicted", "01: Convicted", "02: Not convicted", "01: Convicted", "01: Convicted", "02: Not convicted", "01: Convicted", "02: Not convicted", "01: Convicted", "02: Not convicted", …
    ## $ Sentenced...Not.sentenced <chr> "02: Not sentenced", "01: Sentenced", "02: Not sentenced", "01: Sentenced", "01: Sentenced", "02: Not sentenced", "01: Sentenced", "02: Not sentenced", "01: Sentenced", "02: Not sentenced", …
    ## $ Outcome                   <chr> "01: Proceedings terminated early", "07: Found guilty", "03: Dismissed (found not guilty", "07: Found guilty", "07: Found guilty", "01: Proceedings terminated early", "07: Found guilty", "01…
    ## $ Count                     <int> 1, 6, 1, 1, 10, 1, 1, 1, 31, 1, 3, 15, 1, 5, 2, 1, 1, 4, 2, 85, 2, 20, 4, 5, 11, 1, 2, 1, 18, 168, 2, 15, 55, 44, 3, 1, 1, 6, 1, 1, 3, 3, 12, 1, 2, 1, 140, 1, 12, 4, 38, 16, 7, 1, 5, 909, 5,…

## Cleaning data

After reading in a dataframe it can often be helpful to standardise the
column headings. Below is an example of a function that could be used
for this purpose. It takes a vector of strings as the argument, ensures
all letters in the string vector are lower-case, and makes use of
“regular expressions” or “regex” to find and replace all spaces and
punctuation marks with an underscore:

``` r
# This function standardises strings contained in a vector
generalise_names <- function(names) {
  
  # Convert any uppercase letters to lowercase
  names <- tolower(names)
  # Trim any blank spaces at the start or end of each string
  names <- stringr::str_trim(names)
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

-----

### Exercise 3

Use the `generalise_names()` function defined above to clean the column
headings of the `prosecutions` dataset. Add your solution to the script
“example\_code.R”, underneath the line with the command
`generalise_names(names)`.

**Hint:** use the function `colnames()` to retrieve the column headings
of the dataset as a vector.

-----

-----

In this dataset, some of the columns contain values with a number along
with a category; for example, the `age_group` column contains categories
like “01: Juveniles” rather than just “Juveniles”.

    ## Rows: 107,493
    ## Columns: 10
    ## $ year              <int> 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, …
    ## $ quarter           <chr> "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", …
    ## $ sex               <chr> "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: M…
    ## $ type_of_defendent <chr> "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "0…
    ## $ age_group         <chr> "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveni…
    ## $ age_range         <chr> "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01…
    ## $ ethnicity         <chr> "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N…
    ## $ court_type        <chr> "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistra…
    ## $ offence_type      <chr> "01 Indictable only", "01 Indictable only", "01 Indictable only", "01 Indictable only", "02 Triable either way", "02 Triable either way", "02 Triable either way", "02 Triable either way", "02 Triabl…
    ## $ offence_group     <chr> "02 Sexual offences", "03 Robbery", "03 Robbery", "07 Possession of weapons", "01 Violence against the person", "01 Violence against the person", "02 Sexual offences", "02 Sexual offences", "04 Thef…

These numbers might be undesirable, so we can write a function like this
to remove them:

``` r
# This function identifies and removes 1 or 2 digits followed by a colon or a space
remove_numbering <- function(x) {

  x <- stringr::str_replace(x, "^[:digit:]{1,2}[:blank:]*:[:blank:]*|^[:digit:]{1,2}[:blank:]", "")
  
  return(x)
  
}
```

-----

Then we can use the `mutate()` function with the `across()` function
from `dplyr`, and the `where()` selection helper from `tidyselect`, to
apply the `remove_numbering()` function to columns in the `prosecutions`
dataframe. The `mutate()` function will apply the specified function to
all columns where a particular condition is met, and in this case the
condition `is.character` requires that the column contains strings.

``` r
prosecutions <- dplyr::mutate(prosecutions, across(where(is.character), remove_numbering)) 
glimpse(prosecutions)
```

    ## Rows: 107,493
    ## Columns: 16
    ## $ year                    <int> 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, …
    ## $ quarter                 <chr> "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", …
    ## $ sex                     <chr> "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", …
    ## $ type_of_defendent       <chr> "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "P…
    ## $ age_group               <chr> "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles…
    ## $ age_range               <chr> "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10…
    ## $ ethnicity               <chr> "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/…
    ## $ court_type              <chr> "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Ma…
    ## $ offence_type            <chr> "Indictable only", "Indictable only", "Indictable only", "Indictable only", "Triable either way", "Triable either way", "Triable either way", "Triable either way", "Triable either way", "Triab…
    ## $ offence_group           <chr> "Sexual offences", "Robbery", "Robbery", "Possession of weapons", "Violence against the person", "Violence against the person", "Sexual offences", "Sexual offences", "Theft Offences", "Theft O…
    ## $ tried                   <chr> "Not tried", "Tried at magistrates court", "Tried at magistrates court", "Tried at magistrates court", "Tried at magistrates court", "Not tried", "Tried at magistrates court", "Not tried", "Tr…
    ## $ plea_at_the_crown_court <chr> "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/…
    ## $ convicted_not_convicted <chr> "Not convicted", "Convicted", "Not convicted", "Convicted", "Convicted", "Not convicted", "Convicted", "Not convicted", "Convicted", "Not convicted", "Not convicted", "Convicted", "Not convict…
    ## $ sentenced_not_sentenced <chr> "Not sentenced", "Sentenced", "Not sentenced", "Sentenced", "Sentenced", "Not sentenced", "Sentenced", "Not sentenced", "Sentenced", "Not sentenced", "Not sentenced", "Sentenced", "Not sentenc…
    ## $ outcome                 <chr> "Proceedings terminated early", "Found guilty", "Dismissed (found not guilty", "Found guilty", "Found guilty", "Proceedings terminated early", "Found guilty", "Proceedings terminated early", "…
    ## $ count                   <int> 1, 6, 1, 1, 10, 1, 1, 1, 31, 1, 3, 15, 1, 5, 2, 1, 1, 4, 2, 85, 2, 20, 4, 5, 11, 1, 2, 1, 18, 168, 2, 15, 55, 44, 3, 1, 1, 6, 1, 1, 3, 3, 12, 1, 2, 1, 140, 1, 12, 4, 38, 16, 7, 1, 5, 909, 5, 1…

-----

For the final stage of data cleaning, we can make missing and unknown
values more consistent using a function such as the following:

``` r
clean_not_known <- function(x,
                            not_known_phrase = "Not known",
                            values_to_change = c("n/a", "not known", "unknown", "not stated")) {
  
  # Replace any missing (NA) values
  x <- replace(x, is.na(x), not_known_phrase)
  
  # Remove any white space that might cause the strings to not match
  x <- stringr::str_trim(x)
  
  # Replace strings in the data that refer to a missing or unknown value.
  x <- dplyr::if_else(tolower(x) %in% values_to_change, not_known_phrase, x)
  
  return(x)

}
```

In this function we’ve included some default values, so by default any
strings that match “n/a”, “not known”, “unknown”, or “not stated” are
replaced, and the default replacement value is “Not known”. We’ve used
`if_else()` as a vectorised form of an if-else statement. It’s similar
to `case_when()` (which we used in exercise 2.2), but can only be used
with one condition and two possible outcomes. We’ve also used the
`tolower()` function, which ensures all strings are lower case before
searching for the missing/unknown phrases.

-----

``` r
prosecutions <- dplyr::mutate_if(prosecutions, is.character, clean_not_known)
glimpse(prosecutions)
```

    ## Rows: 107,493
    ## Columns: 16
    ## $ year                    <int> 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, …
    ## $ quarter                 <chr> "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", …
    ## $ sex                     <chr> "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", …
    ## $ type_of_defendent       <chr> "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "P…
    ## $ age_group               <chr> "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles…
    ## $ age_range               <chr> "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10…
    ## $ ethnicity               <chr> "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known…
    ## $ court_type              <chr> "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Ma…
    ## $ offence_type            <chr> "Indictable only", "Indictable only", "Indictable only", "Indictable only", "Triable either way", "Triable either way", "Triable either way", "Triable either way", "Triable either way", "Triab…
    ## $ offence_group           <chr> "Sexual offences", "Robbery", "Robbery", "Possession of weapons", "Violence against the person", "Violence against the person", "Sexual offences", "Sexual offences", "Theft Offences", "Theft O…
    ## $ tried                   <chr> "Not tried", "Tried at magistrates court", "Tried at magistrates court", "Tried at magistrates court", "Tried at magistrates court", "Not tried", "Tried at magistrates court", "Not tried", "Tr…
    ## $ plea_at_the_crown_court <chr> "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known…
    ## $ convicted_not_convicted <chr> "Not convicted", "Convicted", "Not convicted", "Convicted", "Convicted", "Not convicted", "Convicted", "Not convicted", "Convicted", "Not convicted", "Not convicted", "Convicted", "Not convict…
    ## $ sentenced_not_sentenced <chr> "Not sentenced", "Sentenced", "Not sentenced", "Sentenced", "Sentenced", "Not sentenced", "Sentenced", "Not sentenced", "Sentenced", "Not sentenced", "Not sentenced", "Sentenced", "Not sentenc…
    ## $ outcome                 <chr> "Proceedings terminated early", "Found guilty", "Dismissed (found not guilty", "Found guilty", "Found guilty", "Proceedings terminated early", "Found guilty", "Proceedings terminated early", "…
    ## $ count                   <int> 1, 6, 1, 1, 10, 1, 1, 1, 31, 1, 3, 15, 1, 5, 2, 1, 1, 4, 2, 85, 2, 20, 4, 5, 11, 1, 2, 1, 18, 168, 2, 15, 55, 44, 3, 1, 1, 6, 1, 1, 3, 3, 12, 1, 2, 1, 140, 1, 12, 4, 38, 16, 7, 1, 5, 909, 5, 1…

-----

### Exercise 4

Modify `clean_not_known()` to make replacing missing (NA) values
optional.

### Exercise 5

Write a wrapper function to apply `generalise_names()`,
`remove_numbering()`, and `clean_not_known()` to the dataset.

-----

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
that the column names are not enclosed in quotation marks, meaning that
they are not passed as strings: this behaviour is known as non-standard
evaluation, and will be important later.

-----

``` r
prosecutions_grouped
```

    ## # A tibble: 14 x 2
    ##    age_range                       counts
    ##  * <chr>                            <int>
    ##  1 10-11                             3324
    ##  2 12-14                           113960
    ##  3 15-17                           570275
    ##  4 18-20                          1302589
    ##  5 21-24                          2131033
    ##  6 25-29 (2017 onwards)            447108
    ##  7 25+ (prior to 2017)           10209264
    ##  8 30-39 (2017 onwards)            758230
    ##  9 40-49 (2017 onwards)            477217
    ## 10 50-59 (2017 onwards)            261626
    ## 11 60+ (2017 onwards)              101554
    ## 12 Companies, public bodies etc.   114771
    ## 13 Not known (Adult)               195459
    ## 14 Not known (Juvenile)               150

-----

What if we wanted to create several different summary tables? We could
write a function to avoid writing this out each time. Following the
previous examples in this course, you might expect this function to
work:

``` r
# This function produces a summary table based on a dataset
sum_group <- function(df, group_col, sum_col) {
  
  summary <- df %>%
    dplyr::group_by(group_col) %>%
    dplyr::summarise(counts = sum(sum_col))
  
  return(summary)
  
}
```

However trying to use this function results in an error.

``` r
prosecutions_grouped <- sum_group(df = prosecutions, group_col = "age_range", sum_col = "count")
```

    ## Error: Must group by variables found in `.data`.
    ## * Column `group_col` is not found.

-----

This is because of the non-standard evaluation (NSE) mentioned above.
The `dplyr` functions don’t recognise `group_col` and `sum_col` as
column names, because they can’t see that these are variables containing
the actual column names. While the NSE usually makes the `dplyr`
functions more convenient to use, it makes them slightly trickier to use
in user-defined functions.

Fortunately there are methods available to help get around the NSE
problem. The function below shows an example of how our `sum_group()`
function can be modified to accept column names stored as strings, using
the `.data` pronoun with `[[]]`.

``` r
# This function produces a summary table based on a dataset
sum_group <- function(df, group_col, sum_col) {

  summary <- df %>%
    dplyr::group_by(.data[[ group_col ]]) %>%
    dplyr::summarise(counts = sum(.data[[ sum_col ]]))

  return(summary)
  
}
```

The way that the tidyverse packages handle NSE has evolved over the past
few years, so new methods of addressing this issue may be introduced in
the future. For the current recommeneded approach to working with “tidy
evaluation”, i.e. a special type of NSE used throughout the tidyverse,
please see [this
vignette](https://dplyr.tidyverse.org/articles/programming.html). See
the appendix for some examples of alternative methods to tackle this
problem.

-----

``` r
prosecutions_grouped <- sum_group(df = prosecutions, group_col = "age_range", sum_col = "count")
prosecutions_grouped
```

    ## # A tibble: 14 x 2
    ##    age_range                       counts
    ##  * <chr>                            <int>
    ##  1 10-11                             3324
    ##  2 12-14                           113960
    ##  3 15-17                           570275
    ##  4 18-20                          1302589
    ##  5 21-24                          2131033
    ##  6 25-29 (2017 onwards)            447108
    ##  7 25+ (prior to 2017)           10209264
    ##  8 30-39 (2017 onwards)            758230
    ##  9 40-49 (2017 onwards)            477217
    ## 10 50-59 (2017 onwards)            261626
    ## 11 60+ (2017 onwards)              101554
    ## 12 Companies, public bodies etc.   114771
    ## 13 Not known (Adult)               195459
    ## 14 Not known (Juvenile)               150

## Plotting data

Let’s say we want to produce some plots, and want them all to have the
same style. We can define the style of the plot in a function, then we
only have to change the styling in one place if it needs changing. This
function plots a breakdown of the number of prosecutions over time, with
a default breakdown option of `"offence_type"`, and the plot is a line
chart with `ggplot2`’s grey theme:

``` r
# This function produces a plot of the number of prosecutions over time
plot_prosecutions <- function(df, breakdown = "offence_type") {
  
  # Group and summarise data by year and breakdown variable
  df_grouped <- df %>%
    dplyr::group_by(.data[[breakdown]], year) %>%
    dplyr::summarise(counts = sum(count))

  # Produce the plot
  plot <- df_grouped %>%
    ggplot2::ggplot(ggplot2::aes_string(x = "year", y = "counts", group = breakdown, col = breakdown)) +
    ggplot2::geom_line() +
    ggplot2::scale_x_continuous(breaks = 0:2100) +
    ggplot2::theme_grey()

  return(plot)
  
}
```

-----

``` r
# Call function
plot_prosecutions(prosecutions, breakdown = "offence_type")
```

    ## `summarise()` has grouped output by 'offence_type'. You can override using the `.groups` argument.

![](README_files/figure-gfm/unnamed-chunk-45-1.png)<!-- -->

-----

### Exercise 6

Modify the `plot_prosecutions()` function to use `theme_classic()` as
the theme, rather than `theme_grey()`. Produce a plot of the breakdown
of the number of prosecutions over time, with a breakdown by
`"offence_group"`.

-----

-----

# Hints and tips

## When to write a function

### When you’ve copied and pasted two times

There is a principal in software engineering called Don’t Repeat
Yourself (DRY) - which basically states that you should avoid
duplication wherever possible. A good rule of thumb is whenever you find
you’ve used the same or similar code in three places, it’s time to
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

### Pass variables into the function as arguments

While functions can access objects that haven’t been passed in as an
argument, this is generally bad practice as it makes code much harder to
understand and modify, and makes the function itself harder to reuse.

### Document your code

You should have comments explaining what your function does, what each
argument is, and what it returns.

-----

### Keep it short

A rule of thumb is if all the code for your function doesn’t fit on your
screen at the same time, it’s probably too complicated. Consider
splitting it up into multiple functions.

### Generalise

Think about whether there are ways you can make your function usable in
more situations. For example, is there anything you’re hard-coding that
you could set as an argument instead?

### Vectorise by default

R is designed to work well with vectors (e.g. columns of a dataframe).
Where possible you should write your function so it can take a vector as
an input and apply the transformation to each element. The
`generalise_names()` function we looked at is a good example of this\!

### Ask for feedback

A key measure of a good function (or any piece of code) is how easy it
is for someone else to understand, use and modify it. The best way to
test this is to get your code reviewed by someone else.

## How to organise your code

Whenever you’re working on something in R it’s generally best to create
an R project and version control your code on GitHub. There’s
information on how to do this in the [Analytical Platform
guidance](https://user-guidance.services.alpha.mojanalytics.xyz/github.html#creating-your-project-repo-on-github).

It’s also best to keep your functions separate from the rest of your
code to make them easier to find.

### Storing your functions in your project

The easiest way to store your functions is just to create a folder in
your project called “functions” and save your functions there.

You could either put each function in its own R script with the same
name, or you could group related functions into clearly named scripts.

Then just use `source("functions/my_functions_script.R")` (with
`functions/` and `my_functions_script.R` replaced with the name of the
folder and the name of your script, respectively) to run the code and
make your functions available to you in the current session. As with
loading packages, it’s best to do this at the top of your script.

-----

Here’s an example of calling a script that contains a new function,
called `pick_a_colour()`:

``` r
source("functions.R")
```

Now the function is ready to use:

``` r
# Create a list of colours to provide to the function
colours <- c("Red", "Blue", "Green", "Magenta", "Cyan", "Yellow", "Purple", "Pink")
pick_a_colour(colours)
```

    ## [1] "Blue"

-----

You can see the code underlying a function by typing its name (without
brackets) in the console and hitting “enter”:

``` r
pick_a_colour
```

    ## function(colours){
    ##   
    ##   # Generate a random number between 1 and the number of colours provided
    ##   x <- sample(1:length(colours), 1)
    ##   
    ##   # Print a randomly chosen colour
    ##   print(colours[x])
    ##   
    ## }

## Writing a package

An alternative is to make your own package to store your functions,
which you can then use like any other R package. There are a few
advantages to this:

  - It means you (and others) can access your functions from different
    projects
  - There are certain requirements for making R packages that enforce
    good practice, such as including documentation

This comes at the cost of slightly higher overheads.

A few examples of packages written by people in MoJ are:

  - [s3tools](https://github.com/moj-analytical-services/s3tools)
  - [mojrap](https://github.com/moj-analytical-services/mojrap)

To find out more about writing packages, check out the links under
further reading.

## Further reading

#### On functions

  - [Functions chapter](https://r4ds.had.co.nz/functions.html) of
    Hadley’s R for Data Science book
  - [Functions chapter](https://adv-r.hadley.nz/functions.html) of
    Hadley’s Advanced R book
  - [Tidy Evaluation](https://tidyeval.tidyverse.org/introduction.html)
    (useful for writing functions which behave like Tidyverse functions)

#### On packages

  - [Writing an R package from
    scratch](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)
  - Hadley’s [R packages](http://r-pkgs.had.co.nz/) book

#### On loops

  - [Iteration
    chapter](https://r4ds.had.co.nz/iteration.html#dealing-with-failure)
    of Hadley’s R for Data Science book

#### Misc

  - [Tidyverse style guide](https://style.tidyverse.org/) (has some
    guidance on choosing function and argument names)
  - [MoJ coding
    standards](https://github.com/moj-analytical-services/our-coding-standards)
  - [Scoping/environments](https://bookdown.org/rdpeng/rprogdatascience/scoping-rules-of-r.html)

## Get help

If you get stuck, a great place to ask is [ASD
slack](https://asdslack.slack.com/) on either the `#r` or `#intro_r`
channels.

# Appendix

## Table of operators

This table shows some of the logical operators you are likely to
encounter when using R.

| Operator | Definition                    |
| :------: | :---------------------------- |
|   \==    | Equal to                      |
|   \!=    | Not equal to                  |
|    \>    | Greater than                  |
|    \<    | Less than                     |
|   \>=    | Greater than or equal to      |
|   \<=    | Less than or equal to         |
|    ǀ     | Or                            |
|    &     | And                           |
|    \!    | Not                           |
|   %in%   | The subject appears in a list |
| is.na()  | The subject is NA             |

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
    dplyr::summarise(counts = sum(!!as.name(sum_col)))

  return(summary)

}

prosecutions_grouped <- sum_group_alt1(df = prosecutions, group_cols = "age_range", sum_col = "count")
prosecutions_grouped
```

    ## # A tibble: 14 x 2
    ##    age_range                       counts
    ##  * <chr>                            <int>
    ##  1 10-11                             3324
    ##  2 12-14                           113960
    ##  3 15-17                           570275
    ##  4 18-20                          1302589
    ##  5 21-24                          2131033
    ##  6 25-29 (2017 onwards)            447108
    ##  7 25+ (prior to 2017)           10209264
    ##  8 30-39 (2017 onwards)            758230
    ##  9 40-49 (2017 onwards)            477217
    ## 10 50-59 (2017 onwards)            261626
    ## 11 60+ (2017 onwards)              101554
    ## 12 Companies, public bodies etc.   114771
    ## 13 Not known (Adult)               195459
    ## 14 Not known (Juvenile)               150

Alternatively, this version of the function means the column names can
be input as function arguments directly (rather than needing to enclose
them in quote marks to turn them into strings).

``` r
sum_group_alt2 <- function(df, group_cols, sum_col) {

  summary <- df %>%
    dplyr::group_by(!!enquo(group_cols)) %>%
    dplyr::summarise(counts = sum(!!enquo(sum_col)))

  return(summary)

}

prosecutions_grouped <- sum_group_alt2(df = prosecutions, group_cols = age_range, sum_col = count)
prosecutions_grouped
```

    ## # A tibble: 14 x 2
    ##    age_range                       counts
    ##  * <chr>                            <int>
    ##  1 10-11                             3324
    ##  2 12-14                           113960
    ##  3 15-17                           570275
    ##  4 18-20                          1302589
    ##  5 21-24                          2131033
    ##  6 25-29 (2017 onwards)            447108
    ##  7 25+ (prior to 2017)           10209264
    ##  8 30-39 (2017 onwards)            758230
    ##  9 40-49 (2017 onwards)            477217
    ## 10 50-59 (2017 onwards)            261626
    ## 11 60+ (2017 onwards)              101554
    ## 12 Companies, public bodies etc.   114771
    ## 13 Not known (Adult)               195459
    ## 14 Not known (Juvenile)               150

The function below shows an example of how our `sum_group()` function
can be modified to accept column names as arguments, using the `{{`
operator. Note that you need version 0.4 or later of the rlang package
to use the `{{` operator.

``` r
sum_group_alt3 <- function(df, group_cols, sum_col) {

  summary <- df %>%
    dplyr::group_by({{ group_cols }}) %>%
    dplyr::summarise(counts = sum({{ sum_col }}))

  return(summary)
  
}

prosecutions_grouped <- sum_group_alt3(df = prosecutions, group_cols = age_range, sum_col = count)
prosecutions_grouped
```

    ## # A tibble: 14 x 2
    ##    age_range                       counts
    ##  * <chr>                            <int>
    ##  1 10-11                             3324
    ##  2 12-14                           113960
    ##  3 15-17                           570275
    ##  4 18-20                          1302589
    ##  5 21-24                          2131033
    ##  6 25-29 (2017 onwards)            447108
    ##  7 25+ (prior to 2017)           10209264
    ##  8 30-39 (2017 onwards)            758230
    ##  9 40-49 (2017 onwards)            477217
    ## 10 50-59 (2017 onwards)            261626
    ## 11 60+ (2017 onwards)              101554
    ## 12 Companies, public bodies etc.   114771
    ## 13 Not known (Adult)               195459
    ## 14 Not known (Juvenile)               150

## Bonus examples

### Adding an optional total row

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

### Extracting a subset of the data

Sometimes processing data requires manipulating dates and times. For
example, if we wanted to extract the prosecutions from the year up to a
particular date, we could use a function like:

``` r
library(lubridate)
```

    ## 
    ## Attaching package: 'lubridate'

    ## The following object is masked from 'package:base':
    ## 
    ##     date

``` r
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
```

``` r
prosecutions_extract <- extract_year(prosecutions, "31-Mar-2018")
glimpse(prosecutions_extract)
```

    ## Rows: 14,929
    ## Columns: 17
    ## $ year                    <int> 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, 2017, …
    ## $ quarter                 <chr> "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", "Q2", …
    ## $ sex                     <chr> "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", …
    ## $ type_of_defendent       <chr> "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "P…
    ## $ age_group               <chr> "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles…
    ## $ age_range               <chr> "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "12-14", "12-14", "12-14", "12-14", "12-14", "12-14", "12-14", "12-14", "12-14", "12-14", "12-14", "12…
    ## $ ethnicity               <chr> "White", "White", "White", "White", "White", "Not known", "Not known", "Not known", "Not known", "Not known", "White", "White", "White", "White", "White", "White", "White", "White", "White", "…
    ## $ court_type              <chr> "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Ma…
    ## $ offence_type            <chr> "Indictable only", "Triable either way", "Triable either way", "Triable either way", "Triable either way", "Triable either way", "Triable either way", "Triable either way", "Summary non-motori…
    ## $ offence_group           <chr> "Robbery", "Violence against the person", "Theft Offences", "Criminal damage and arson", "Possession of weapons", "Theft Offences", "Theft Offences", "Possession of weapons", "Summary non-moto…
    ## $ tried                   <chr> "Tried at magistrates court", "Tried at magistrates court", "Not tried", "Tried at magistrates court", "Tried at magistrates court", "Tried at magistrates court", "Not tried", "Tried at magist…
    ## $ plea_at_the_crown_court <chr> "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known…
    ## $ convicted_not_convicted <chr> "Convicted", "Convicted", "Not convicted", "Convicted", "Convicted", "Convicted", "Not convicted", "Convicted", "Convicted", "Not convicted", "Not convicted", "Not convicted", "Convicted", "Co…
    ## $ sentenced_not_sentenced <chr> "Sentenced", "Sentenced", "Not sentenced", "Sentenced", "Sentenced", "Sentenced", "Not sentenced", "Sentenced", "Sentenced", "Not sentenced", "Not sentenced", "Not sentenced", "Sentenced", "No…
    ## $ outcome                 <chr> "Found guilty", "Found guilty", "Proceedings terminated early", "Found guilty", "Found guilty", "Found guilty", "Proceedings terminated early", "Found guilty", "Found guilty", "Proceedings ter…
    ## $ count                   <int> 1, 1, 1, 1, 1, 1, 1, 1, 8, 7, 2, 2, 3, 1, 5, 9, 1, 1, 5, 2, 1, 1, 2, 1, 1, 21, 1, 1, 5, 6, 2, 2, 81, 4, 27, 11, 1, 3, 21, 2, 2, 25, 2, 1, 3, 17, 1, 1, 6, 14, 1, 5, 11, 1, 1, 1, 2, 17, 2, 2, 2,…
    ## $ year_quarter            <chr> "2017 Q2", "2017 Q2", "2017 Q2", "2017 Q2", "2017 Q2", "2017 Q2", "2017 Q2", "2017 Q2", "2017 Q2", "2017 Q2", "2017 Q2", "2017 Q2", "2017 Q2", "2017 Q2", "2017 Q2", "2017 Q2", "2017 Q2", "2017…
