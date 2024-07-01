Writing functions in R
================

This repository is for the Writing Functions in R course offered by the
Data and Analysis R Training Group.

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
[here](https://justiceuk.sharepoint.com/:f:/s/RTrainingGroup/Ev1kwXxGaVNNpLwFg4drakUBNUpZz72DRdcD8PipkU-u9A?e=SQzeJL).
See [Remote learning](#remote-learning) for more tips on going through
this material in your own time. If you work through the material by
yourself please leave feedback about the material
[here](https://airtable.com/shr9u2OJB2pW8Y0Af).

If you have any feedback on the content, please get in touch!

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
- [Information for presenters](#information-for-presenters)

## Pre-material

A few days before the session, please make sure that -

1.  You have access to RStudio on the Analytical Platform
2.  You have requested access to the **alpha-r-training** s3 bucket via
    the [intro_r slack channel on the ASD
    workspace](https://moj.enterprise.slack.com/archives/CGKSJV9HN)
3.  You have followed the steps in the [Configure Git and Github section
    of the Platform User
    Guidance](https://user-guidance.analytical-platform.service.justice.gov.uk/github/set-up-github.html)
    to configure Git and GitHub (this only needs doing once)
4.  You have cloned this repository (instructions are in the Analytical
    Platform User Guidance
    [here](https://user-guidance.analytical-platform.service.justice.gov.uk/github/rstudio-git.html#work-with-git-in-rstudio))
5.  You run the command `renv::restore()` in the console to make sure
    you have the required packages installed

If you have any problems with the above please get in touch with the
course organisers or ask for help on either the \#analytical_platform or
\#intro_r channel on [ASD slack](https://asdslack.slack.com).

All the examples in the presentation/README are available in the R
script example_code.R.

## Remote learning

Here are a few suggestions if you are going through this material in
your own time:

- Both the README and slides contain the same content so you can use
  whichever works best for you - the only difference is the exercise
  solutions are only in the slides
- To open the slides, first clone the repo (see
  [pre-material](#pre-material)) and then open the file “slides.html”
  from RStudio by clicking “View in web browser”
- You can find a recording of a previous training session on the R
  training Microsoft Stream channel
  [here](https://web.microsoftstream.com/channel/aa3cda5d-99d6-4e9d-ac5e-6548dd55f52a)
- If you need any help, the best place to ask is on either the
  [\#intro_r](https://app.slack.com/client/T1PU1AP6D/CGKSJV9HN) or
  [\#r](https://app.slack.com/client/T1PU1AP6D/C1PUCG719) slack channels
  on ASD slack.

If you have any feedback on the material and/or your experience of
working through it in your own time, please get in touch with a member
of the R training group or leave a review on
[Airtable](https://airtable.com/shr9u2OJB2pW8Y0Af).

## Learning outcomes

### By the end of this session you should know:

- How to write a basic function.
- The circumstances when you might want to consider writing a function.
- Why using functions is beneficial.
- The best practice for writing functions.
- Where to go for more information on some of the topics touched on in
  this course.

### Before we start

To follow along with the code run during this session and participate in
the exercises, open the script “example_code.R” in RStudio. All the code
that we’ll show in this session is stored in “example_code.R”, and you
can edit this script to write solutions to the exercises. You may also
want to have the course
[README](https://github.com/moj-analytical-services/writing_functions_in_r)
open as a reference.

The training repo is set up with a `renv` lock.file that includes all
the packages and package versions you will need for this course. Please
make sure you pull the latest version of the `main` branch and run
`renv::restore()` before starting!

------------------------------------------------------------------------

### A note on the examples given in this course

During this session we’ll show lots of examples of functions. Depending
on how experienced you are with using R, some of these examples may
introduce new concepts that are not the focus of this course. It is not
required that you have prior knowledge of these concepts, as they are
included only to demonstrate possible uses for functions when
undertaking typical programming tasks in Data & Analysis. One of the
purposes of the examples is to provide a resource that can be referred
back to in the future.

## What is a function?

Functions are a way to bundle up bits of code to make them easy to
reuse. Base R includes numerous built-in functions and there are
thousands more R functions in packages available on CRAN and elsewhere.

Here is an example of one of the built-in R functions, `sum()`:

``` r
x <- c(1, 2, 3, 4, 5) # Create a vector of numbers to sum
sum(x) # Sum the numbers contained in 'x'
```

    #> [1] 15

You can also write your own functions, called “user-defined functions”.

Functions in a package are the same thing as functions you define
yourself, they’re just stored in a different way.

## Why use functions?

### Code maintenance

Generally functions are used to automate common tasks, to avoid copying
and pasting the same code multiple times with minor alterations. While
writing a function has a small up front cost, you’ll reap the benefits
when you need to make changes to your code, and your QA’er will also
thank you, as they’ll only need to check your function works once!

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
  paste(arg1, arg2, "!")
}
```

We use `function()` to create a function and assign it to the object
`function_name`.

A function is made up of three components:

- Its **arguments** (in this example, `arg1` and `arg2`) - these are
  variables used inside the function body which we can set each time we
  call the function.

- The function **body** (everything between the curly brackets) - this
  is where we put the code.

- And the function **environment** (where the function was created) -
  this determines what variables and other functions it has access to.
  You can find out more about environments
  [here](https://adv-r.hadley.nz/environments.html).

# Examples of basic functions

## Example 1: a very basic function

Here’s an example of a very basic user-defined function, called
`add_two()`, that takes `x` as an argument:

``` r
# This function takes the argument 'x', and adds 2 to it
add_two <- function(x) {
  
  x + 2
  
}
```

R will automatically return the value of the last evaluated expression.
There is also a `return()` function. More on where to use this later.

------------------------------------------------------------------------

Let’s try using the function `add_two()`:

``` r
# Calling the function by itself prints the result to the console
add_two(3)
```

    #> [1] 5

``` r
# Alternatively the result can be saved as a new variable
result <- add_two(3) 
result
```

    #> [1] 5

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
  
  x^2 + y^2
  
}

sum_squares(3, y = 5)
```

    #> [1] 34

When you call a function, you can specify the arguments by position or
name. In this example, the function accepts arguments called `x` and
`y`, with the order specified as `x` then `y` in the function
definition. Therefore when `sum_squares(3, 5)` is called, the arguments
are interpreted as `x = 3` and `y = 5`. Alternatively, if we called
`sum_squares(5, 3)` then the arguments would be interpreted as `x = 5`
and `y = 3`.

------------------------------------------------------------------------

For more complicated functions with multiple arguments, specifying the
arguments by position becomes more error-prone and harder to understand.
For home-made functions you should always provide the names of all
arguments (except potentially the first one if it is data).

``` r
# Good
sum_squares(3, y = 5)
```

    #> [1] 34

``` r
# Acceptable
sum_squares(y = 5, x = 3)
```

    #> [1] 34

``` r
# Bad
sum_squares(3, 5)
```

    #> [1] 34

## Exercises

Let’s start with some simple exercises to get familiar with the syntax
of writing functions.

### 1.1 hello_world()

Create a function called `hello_world` which prints “Hello world!” to
the console, and call the function.

### 1.2 my_mean()

Create a function called `my_mean` which takes two arguments, `x` and
`y`, and calculates their mean. Call the function to find the mean of
7.5 and 16.

------------------------------------------------------------------------

## Example 3: conditional statements and early returns

Functions can return different outputs depending on some condition. In
this function the condition is `x < 0`, and the condition evaluates to
either `TRUE` or `FALSE`:

``` r
# This function returns the absolute value of a number
abs_x <- function(x) {
  if (x >= 0) {
    x
  } else {
    -x
  }
}

abs_x(-5)
```

    #> [1] 5

``` r
abs_x(4)
```

    #> [1] 4

By default R will always return the last evaluated statement. In this
example when `x` is greater than or equal to zero, the last evaluated
statement is `x`. In contrast when `x` is less than zero, the last
evaluated statement is `-x`.

------------------------------------------------------------------------

Why does this function always return minus x?

``` r
# why does this function always return -x?
abs_x_v2 <- function(x) {
  
  if (x >= 0) {
    x
  } 
  
  -x
  
}

abs_x_v2(-5)
```

    #> [1] 5

``` r
abs_x_v2(4)
```

    #> [1] -4

------------------------------------------------------------------------

Sometimes exiting a function early is useful. We can achieve this with
an explicit `return()`. As soon as a `return()` statement is encountered
in a function, the function finishes and returns the variable in the
`return()` statement.

``` r
# We can fix it by using an early return
abs_x_v3 <- function(x) {
  
  if (x >= 0) {
    return(x)
  } 
  
  -x
  
}

abs_x_v3(-5)
```

    #> [1] 5

``` r
abs_x_v3(4)
```

    #> [1] 4

## Example 4: functions with side-effects

A function side-effect can be thought of as any change to the workspace
that the function makes other than the object that it returns. This can
include printing, plotting a chart, saving a file, or modifying a
variable in the wider environment. The side-effect is often the main
purpose of the function, and in this case the function doesn’t need to
return any value. This function has the side-effect of printing a
message to the console, depending on the value of the object:

``` r
# This function lets you know whether a number is odd or even
odd_or_even <- function(x) {
  
  if ((x %% 2) == 0) {
    message("The number is even.")
  } else if ((x %% 2) == 1) {
    message("The number is odd.")
  }
  
}

odd_or_even(x = 4)
```

    #> The number is even.

**Note:** It’s best practice for your function to either return an
object or have a side-effect, but not both (with the exception of
messages, errors and warnings).

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

    #> Error in x%%2: non-numeric argument to binary operator

``` r
odd_or_even(x = c(1, 2, 3))
```

    #> Error in if ((x%%2) == 0) {: the condition has length > 1

------------------------------------------------------------------------

Here’s an adapted version of the function, with some more informative
error messages built in using the `stop()` function:

``` r
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
```

------------------------------------------------------------------------

Now try passing some incompatible arguments to the function:

``` r
odd_or_even(x = 1.5)
```

    #> Error in odd_or_even(x = 1.5): x must be an integer.

``` r
odd_or_even(x = "a")
```

    #> Error in odd_or_even(x = "a"): x must be a number.

``` r
odd_or_even(x = c(1, 2, 3))
```

    #> Error in odd_or_even(x = c(1, 2, 3)): x must have length 1.

`stop()` halts execution of the function and prints an error message to
the console. Alternatively you can use `warning()`, which returns a
warning but does not stop execution of the function.

## Example 6: optional arguments

Here’s an example of how to include optional arguments, where in this
case the optional argument is called `y`:

``` r
# This function either returns the sum of two numbers, or returns the argument if only one is supplied
add_a_number <- function(x, y = NULL) {
  
  if (!is.null(y)) {
    x + y
  } else {
    x
  }
  
}

add_a_number(x = 6)
```

    #> [1] 6

``` r
add_a_number(x = 6, y = 7)
```

    #> [1] 13

------------------------------------------------------------------------

Note that `NULL` and `NA` values, and missing arguments are different
and tested for in different ways.

``` r
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
```

    #> [1] 5

A message will be returned when the relevant condition is found and then
R will attempt to evaluate `x`. Note this will fail when `x` is `NULL`
or missing.

------------------------------------------------------------------------

``` r
return_x()
```

    #> x is missing

    #> Error in return_x(): argument "x" is missing, with no default

``` r
return_x(NULL)
```

    #> x is null

    #> Error in if (is.na(x)) {: argument is of length zero

``` r
return_x(NA)
```

    #> x is NA

    #> [1] NA

## Example 7: arguments with default values

Any value can be used as a default value for an argument. For example,
we can generalise the `sum_squares()` function by allowing it to sum
together two numbers raised to any power, but with a default power of 2:

``` r
# This function returns the sum of two numbers raised to a particular power (with a default of 2)
sum_powers <- function(x, y, z = 2) {
  
  x ^ z + y ^ z
  
}

sum_powers(x = 3, y = 5)
```

    #> [1] 34

``` r
sum_powers(x = 3, y = 5, z = 3)
```

    #> [1] 152

## Exercises

### 2.1 fizz_buzz()

Now try using an if else statement inside a function. Create a function
called `fizz_buzz()` which takes a number as input and:

- If the number is divisible by both 3 and 5, returns “fizz buzz”
- If the number is divisible by just 3, returns “fizz”
- If the number is divisible by just 5, returns “buzz”
- Otherwise the number is returned (coerced to character type using
  `as.character()`)

Try it out with values 1, 2, 3, 5 & 15.

------------------------------------------------------------------------

**Hints:**

- This exercise is very similar to example 4. The structure of an
  if-else statement is:

<!-- -->

    if (condition_1) {
    code
    } else if (condition_2) {
    code
    } else {
    code
    }

- To test whether a number is divisible by another number, you can use
  the modulus operator `%%`, which calculates the remainder. E.g.
  `1 %% 3 == 0` evaluates to `FALSE`.
- To find out more about if statements and conditional execution, see
  [here](https://adv-r.hadley.nz/control-flow.html)

------------------------------------------------------------------------

------------------------------------------------------------------------

### 2.2 fizz_buzz_vec()

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

------------------------------------------------------------------------

------------------------------------------------------------------------

### 2.3 fizz_buzz_custom()

Create a version of `fizz_buzz()` or `fizz_buzz_vec()` called
`fizz_buzz_custom()` or `fizz_buzz_custom_vec()` where the values for
when to say “fizz” and “buzz” can be changed by setting arguments `fizz`
and `buzz`, but the default values are still 3 and 5.

Test your new function out, first by checking you get the same results
as above when you don’t specify the `fizz` or `buzz` arguments, and
second when you set `buzz = 7` for values 1, 2, 3, 7, 15 and 21.

------------------------------------------------------------------------

------------------------------------------------------------------------

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

------------------------------------------------------------------------

The function can be called with only the required arguments:

``` r
plot_x_and_y(x, y)
```

![](../README_files/unnamed-chunk-28-1.png)<!-- -->

------------------------------------------------------------------------

Or the function can be called with any optional arguments accepted by
the plot function:

``` r
plot_x_and_y(x, y, col='red', type='l')
```

![](../README_files/unnamed-chunk-29-1.png)<!-- -->

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
“example_code.R” as we go along.

## Packages

For these examples we will be using a few packages:

- [`Rs3tools`](https://github.com/moj-analytical-services/Rs3tools) to
  fetch data from s3.
- `dplyr` is the package we’ll use to create summary tables from the
  data.
- `stringr` provides functions that can be used to manipulate strings.
- `ggplot2` to create charts.

We will use `package::function()` syntax throughout this course instead
of `library()` calls. This makes it easier to see where functions come
from, avoids “function masking” and improves the reproducibility and
reusability of code. This is particularly important within the body of a
function. If a dependency has not been attached to the search list at
run time, you will get a probably very unhelpful error message (or your
code might use the wrong function).

For a similar reason we are using the R native pipe `|>` rather than the
`magrittr` one. (If you are using R \< 4.1.0 you will need to replace
the native pipe with `%>%` and use `library("magrittr")`.)

## Examples why you should avoid `library()` calls

Which of the following would you rather have to deal with? A missing
function from *somewhere*; a missing but *known* package; or a missing
function from a *known* package?

    > bar()
    Error in bar() : could not find function "bar"

    > foo::bar()
    Error in loadNamespace(x) : there is no package called ‘foo’

    > dplyr::bar()
    Error: 'bar' is not an exported object from 'namespace:dplyr'

------------------------------------------------------------------------

Even worse, your code might silently give the wrong result if you are
relying on the user having made the “correct” `library()` calls.

``` r
iris_by_species_1 <- function(species) {
  datasets::iris |> filter(iris[[5]] == species) |> dplyr::glimpse()
}

iris_by_species_2 <- function(species) {
  datasets::iris |> dplyr::filter(iris[[5]] == species) |> dplyr::glimpse()
}

iris_by_species_1("setosa")
```

    #>  Time-Series [1:150, 1:5] from 1 to 150: NA NA NA NA NA NA NA NA NA NA ...

``` r
iris_by_species_2("setosa")
```

    #> Rows: 50
    #> Columns: 5
    #> $ Sepal.Length <dbl> 5.1, 4.9, 4.7, 4.6, 5.0, 5.4, 4.6, 5.0, 4.4, 4.9, 5.4, 4.8, 4.8, 4.3, 5.8, 5.7, 5.4, 5.1, 5.7, 5.1, 5.4, 5.1, 4.6, 5.1, 4.8,…
    #> $ Sepal.Width  <dbl> 3.5, 3.0, 3.2, 3.1, 3.6, 3.9, 3.4, 3.4, 2.9, 3.1, 3.7, 3.4, 3.0, 3.0, 4.0, 4.4, 3.9, 3.5, 3.8, 3.8, 3.4, 3.7, 3.6, 3.3, 3.4,…
    #> $ Petal.Length <dbl> 1.4, 1.4, 1.3, 1.5, 1.4, 1.7, 1.4, 1.5, 1.4, 1.5, 1.5, 1.6, 1.4, 1.1, 1.2, 1.5, 1.3, 1.4, 1.7, 1.5, 1.7, 1.5, 1.0, 1.7, 1.9,…
    #> $ Petal.Width  <dbl> 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2,…
    #> $ Species      <fct> setosa, setosa, setosa, setosa, setosa, setosa, setosa, setosa, setosa, setosa, setosa, setosa, setosa, setosa, setosa, seto…

## Fetching data

Here we are reading in a copy of the `Prosecutions and Convictions`
dataset from s3 and storing the dataframe as a variable called
`prosecutions_and_convictions`. In the second step we’re filtering the
dataset to extract only the prosecutions and saving to another variable,
named `prosecutions`.

``` r
prosecutions_and_convictions <- Rs3tools::read_using(
  FUN = read.csv,
  s3_path = "s3://alpha-r-training/writing-functions-in-r/prosecutions-and-convictions-2018.csv"
)

# Filter for Magistrates Court to extract the prosecutions
prosecutions <- prosecutions_and_convictions |>
  dplyr::filter(`Court.Type` == "Magistrates Court")
```

------------------------------------------------------------------------

Here’s a preview of the data stored in `prosecutions`:

``` r
dplyr::glimpse(prosecutions)
```

    #> Rows: 107,493
    #> Columns: 16
    #> $ Year                      <int> 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 200…
    #> $ Quarter                   <chr> "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1…
    #> $ Sex                       <chr> "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01…
    #> $ Type.of.Defendent         <chr> "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person",…
    #> $ Age.Group                 <chr> "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juve…
    #> $ Age.Range                 <chr> "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10…
    #> $ Ethnicity                 <chr> "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A",…
    #> $ Court.Type                <chr> "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magis…
    #> $ Offence.Type              <chr> "01 Indictable only", "01 Indictable only", "01 Indictable only", "01 Indictable only", "02 Triable either way"…
    #> $ Offence.Group             <chr> "02 Sexual offences", "03 Robbery", "03 Robbery", "07 Possession of weapons", "01 Violence against the person",…
    #> $ Tried                     <chr> "5: Not tried", "01: Tried at magistrates court", "01: Tried at magistrates court", "01: Tried at magistrates c…
    #> $ Plea.at.the.Crown.Court   <chr> "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A",…
    #> $ Convicted..Not.convicted  <chr> "02: Not convicted", "01: Convicted", "02: Not convicted", "01: Convicted", "01: Convicted", "02: Not convicted…
    #> $ Sentenced...Not.sentenced <chr> "02: Not sentenced", "01: Sentenced", "02: Not sentenced", "01: Sentenced", "01: Sentenced", "02: Not sentenced…
    #> $ Outcome                   <chr> "01: Proceedings terminated early", "07: Found guilty", "03: Dismissed (found not guilty", "07: Found guilty", …
    #> $ Count                     <int> 1, 6, 1, 1, 10, 1, 1, 1, 31, 1, 3, 15, 1, 5, 2, 1, 1, 4, 2, 85, 2, 20, 4, 5, 11, 1, 2, 1, 18, 168, 2, 15, 55, 4…

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
```

------------------------------------------------------------------------

Here is a demonstration of how functions such as this can be useful:

``` r
names <- c("Option 1", "   Option (1)", "Option: 1", "option 1", "OPTION - 1")
generalise_names(names)
```

    #> [1] "option_1" "option_1" "option_1" "option_1" "option_1"

The [`stringr` cheatsheet](https://stringr.tidyverse.org/#cheatsheet) is
a great resource for learning more about regular expressions.

------------------------------------------------------------------------

### Exercise 3

Use the `generalise_names()` function defined above to clean the column
headings of the `prosecutions` dataset. Add your solution to the script
“example_code.R”, underneath the line with the command
`generalise_names(names)`.

**Hint:** use the function `colnames()` to retrieve the column headings
of the dataset as a vector.

------------------------------------------------------------------------

------------------------------------------------------------------------

In this dataset, some of the columns contain values with a number along
with a category; for example, the `age_group` column contains categories
like “01: Juveniles” rather than just “Juveniles”.

    #> Rows: 107,493
    #> Columns: 10
    #> $ year              <int> 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008,…
    #> $ quarter           <chr> "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1",…
    #> $ sex               <chr> "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male", "01: Male",…
    #> $ type_of_defendent <chr> "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Person", "01: Pe…
    #> $ age_group         <chr> "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", "01: Juveniles", …
    #> $ age_range         <chr> "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "01: 10-11", "0…
    #> $ ethnicity         <chr> "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", …
    #> $ court_type        <chr> "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates C…
    #> $ offence_type      <chr> "01 Indictable only", "01 Indictable only", "01 Indictable only", "01 Indictable only", "02 Triable either way", "02 Tr…
    #> $ offence_group     <chr> "02 Sexual offences", "03 Robbery", "03 Robbery", "07 Possession of weapons", "01 Violence against the person", "01 Vio…

These numbers might be undesirable, so we can write a function like this
to remove them:

``` r
# This function removes patterns at the start of a string that are: 
# 1 or 2 digits followed by any number of colons and/or spaces

remove_numbering <- function(x) {
  stringr::str_remove(x, pattern = "^\\d{1,2}\\s*:*\\s*")
}
```

------------------------------------------------------------------------

Here is a demonstration of what this is doing:

``` r
some_strings <- c("01 :foo", "01 foo", "01: foo", "01  :  foo", "foo", "bar foo")
remove_numbering(some_strings)
```

    #> [1] "foo"     "foo"     "foo"     "foo"     "foo"     "bar foo"

The [`stringr` cheatsheet](https://stringr.tidyverse.org/#cheatsheet) is
a great resource for learning more about regular expressions.

------------------------------------------------------------------------

Then we can use the `mutate()` function with the `across()` function
from `dplyr`, and the `where()` selection helper from `tidyselect`, to
apply the `remove_numbering()` function to columns in the `prosecutions`
dataframe. The `dplyr::mutate()` function will apply the specified
function to all columns where a particular condition is met, and in this
case the condition `is.character` requires that the column contains
strings.

``` r
prosecutions <- dplyr::mutate(prosecutions, across(where(is.character), remove_numbering)) 
dplyr::glimpse(prosecutions)
```

    #> Rows: 107,493
    #> Columns: 16
    #> $ year                    <int> 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008,…
    #> $ quarter                 <chr> "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1",…
    #> $ sex                     <chr> "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "…
    #> $ type_of_defendent       <chr> "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Pe…
    #> $ age_group               <chr> "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juvenile…
    #> $ age_range               <chr> "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-1…
    #> $ ethnicity               <chr> "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "…
    #> $ court_type              <chr> "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistr…
    #> $ offence_type            <chr> "Indictable only", "Indictable only", "Indictable only", "Indictable only", "Triable either way", "Triable either…
    #> $ offence_group           <chr> "Sexual offences", "Robbery", "Robbery", "Possession of weapons", "Violence against the person", "Violence agains…
    #> $ tried                   <chr> "Not tried", "Tried at magistrates court", "Tried at magistrates court", "Tried at magistrates court", "Tried at …
    #> $ plea_at_the_crown_court <chr> "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "N/A", "…
    #> $ convicted_not_convicted <chr> "Not convicted", "Convicted", "Not convicted", "Convicted", "Convicted", "Not convicted", "Convicted", "Not convi…
    #> $ sentenced_not_sentenced <chr> "Not sentenced", "Sentenced", "Not sentenced", "Sentenced", "Sentenced", "Not sentenced", "Sentenced", "Not sente…
    #> $ outcome                 <chr> "Proceedings terminated early", "Found guilty", "Dismissed (found not guilty", "Found guilty", "Found guilty", "P…
    #> $ count                   <int> 1, 6, 1, 1, 10, 1, 1, 1, 31, 1, 3, 15, 1, 5, 2, 1, 1, 4, 2, 85, 2, 20, 4, 5, 11, 1, 2, 1, 18, 168, 2, 15, 55, 44,…

------------------------------------------------------------------------

For the final stage of data cleaning, we can make missing and unknown
values more consistent using a function such as the following:

``` r
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
```

In this function we’ve included some default values, so by default any
strings that match “n/a”, “not known”, “unknown”, or “not stated” are
replaced, and the default replacement value is “Not known”. We’ve used
`dplyr::if_else()` as a vectorised form of an if-else statement. It’s
similar to `dplyr::case_when()` (which we used in exercise 2.2), but can
only be used with one condition and two possible outcomes. We’ve also
used the `tolower()` function, which ensures all strings are lower case
before searching for the missing/unknown phrases.

------------------------------------------------------------------------

``` r
prosecutions <- dplyr::mutate(
  prosecutions, 
  dplyr::across(
    .cols = tidyselect::where(is.character), 
    .fns = clean_not_known
  )
)

dplyr::glimpse(prosecutions)
```

    #> Rows: 107,493
    #> Columns: 16
    #> $ year                    <int> 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008,…
    #> $ quarter                 <chr> "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1",…
    #> $ sex                     <chr> "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "…
    #> $ type_of_defendent       <chr> "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Pe…
    #> $ age_group               <chr> "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juvenile…
    #> $ age_range               <chr> "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-1…
    #> $ ethnicity               <chr> "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not know…
    #> $ court_type              <chr> "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistr…
    #> $ offence_type            <chr> "Indictable only", "Indictable only", "Indictable only", "Indictable only", "Triable either way", "Triable either…
    #> $ offence_group           <chr> "Sexual offences", "Robbery", "Robbery", "Possession of weapons", "Violence against the person", "Violence agains…
    #> $ tried                   <chr> "Not tried", "Tried at magistrates court", "Tried at magistrates court", "Tried at magistrates court", "Tried at …
    #> $ plea_at_the_crown_court <chr> "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not know…
    #> $ convicted_not_convicted <chr> "Not convicted", "Convicted", "Not convicted", "Convicted", "Convicted", "Not convicted", "Convicted", "Not convi…
    #> $ sentenced_not_sentenced <chr> "Not sentenced", "Sentenced", "Not sentenced", "Sentenced", "Sentenced", "Not sentenced", "Sentenced", "Not sente…
    #> $ outcome                 <chr> "Proceedings terminated early", "Found guilty", "Dismissed (found not guilty", "Found guilty", "Found guilty", "P…
    #> $ count                   <int> 1, 6, 1, 1, 10, 1, 1, 1, 31, 1, 3, 15, 1, 5, 2, 1, 1, 4, 2, 85, 2, 20, 4, 5, 11, 1, 2, 1, 18, 168, 2, 15, 55, 44,…

------------------------------------------------------------------------

### Exercise 4

Modify `clean_not_known()` to make replacing missing (NA) values
optional.

### Exercise 5

Write a wrapper function to apply `generalise_names()`,
`remove_numbering()`, and `clean_not_known()` to the dataset.

------------------------------------------------------------------------

------------------------------------------------------------------------

## Summarising data

Let’s say we wanted to create a summary table showing the number of
people prosecuted in different age bands. We could do:

``` r
prosecutions_grouped <- prosecutions |>
  dplyr::group_by(age_range) |>
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

------------------------------------------------------------------------

``` r
prosecutions_grouped
```

    #> # A tibble: 14 × 2
    #>    age_range                       counts
    #>    <chr>                            <int>
    #>  1 10-11                             3324
    #>  2 12-14                           113960
    #>  3 15-17                           570275
    #>  4 18-20                          1302589
    #>  5 21-24                          2131033
    #>  6 25+ (prior to 2017)           10209264
    #>  7 25-29 (2017 onwards)            447108
    #>  8 30-39 (2017 onwards)            758230
    #>  9 40-49 (2017 onwards)            477217
    #> 10 50-59 (2017 onwards)            261626
    #> 11 60+ (2017 onwards)              101554
    #> 12 Companies, public bodies etc.   114771
    #> 13 Not known (Adult)               195459
    #> 14 Not known (Juvenile)               150

## Sidenote: standard vs non-standard evaluation

In the plot below how does R know to label the x-axis `foo` and the
y-axis `bar` we haven’t explicitly supplied axis labels? The `plot()`
function is using standard evaluation to get the values supplied to the
x and y axes but is also using non-standard evaluation to get the names
of the objects passed to the arguments for use as axis labels.

``` r
foo <- 1:10
bar <- 10:1
plot(foo, bar)
```

![](../README_files/unnamed-chunk-47-1.png)<!-- -->

------------------------------------------------------------------------

What if we wanted to create several different summary tables? We could
write a function to avoid writing this out each time. Following the
previous examples in this course, you might expect this function to
work:

``` r
# This function produces a summary table based on a dataset
sum_group <- function(df, group_col, sum_col) {
  
  df |>
    dplyr::group_by(group_col) |>
    dplyr::summarise(counts = sum(sum_col))
  
}
```

However trying to use this function results in an error.

``` r
prosecutions_grouped <- sum_group(df = prosecutions, group_col = "age_range", sum_col = "count")
```

    #> Error in `dplyr::group_by()`:
    #> ! Must group by variables found in `.data`.
    #> ✖ Column `group_col` is not found.

------------------------------------------------------------------------

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
  
  df |>
    dplyr::group_by(.data[[group_col]]) |>
    dplyr::summarise(counts = sum(.data[[sum_col]]))
  
}
```

The way that the tidyverse packages handle NSE has evolved over the past
few years, so new methods of addressing this issue may be introduced in
the future. For the current recommended approach to working with “tidy
evaluation”, i.e. a special type of NSE used throughout the tidyverse,
please see [this
vignette](https://dplyr.tidyverse.org/articles/programming.html). See
the appendix for some examples of alternative methods to tackle this
problem.

------------------------------------------------------------------------

``` r
prosecutions_grouped <- sum_group(df = prosecutions, group_col = "age_range", sum_col = "count")
prosecutions_grouped
```

    #> # A tibble: 14 × 2
    #>    age_range                       counts
    #>    <chr>                            <int>
    #>  1 10-11                             3324
    #>  2 12-14                           113960
    #>  3 15-17                           570275
    #>  4 18-20                          1302589
    #>  5 21-24                          2131033
    #>  6 25+ (prior to 2017)           10209264
    #>  7 25-29 (2017 onwards)            447108
    #>  8 30-39 (2017 onwards)            758230
    #>  9 40-49 (2017 onwards)            477217
    #> 10 50-59 (2017 onwards)            261626
    #> 11 60+ (2017 onwards)              101554
    #> 12 Companies, public bodies etc.   114771
    #> 13 Not known (Adult)               195459
    #> 14 Not known (Juvenile)               150

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
```

------------------------------------------------------------------------

``` r
# Call function
plot_prosecutions(prosecutions, breakdown = "offence_type")
```

![](../README_files/unnamed-chunk-53-1.png)<!-- -->

------------------------------------------------------------------------

### Exercise 6

Modify the `plot_prosecutions()` function to use `theme_classic()` as
the theme, rather than `theme_grey()`. Produce a plot of the breakdown
of the number of prosecutions over time, with a breakdown by
`"offence_group"`.

------------------------------------------------------------------------

------------------------------------------------------------------------

## Assertions

In both development and deployment, the effects of functions can differ
from that which is expected. If you have experienced such problems while
writing and executing custom functions in the above exercises, you may
have seen an error message.

Beyond those generated by basic syntax mistakes, any error messages that
you have seen while executing a custom function will have originated
from the functions that your custom function calls. They are by nature
generic. Sometimes, these error messages will be easy for you to
understand, and therefore see what’s gone wrong, but because they are
generic, their meaning in any given context is not necessary clear.

You may also have noticed that a function you wrote wasn’t doing what
you wanted because the output was surprising, even though no error was
generated.

``` r
my_mean <- function(x, y) {
  x + y / 2
}

my_mean(3, 5)
```

    #> [1] 5.5

------------------------------------------------------------------------

Although this is a frivolous example, and the problem immediately
obvious, in general this issue is serious and pernicious, because a
problem may exist that you’re not immediately aware of. Alternatively,
you may be able to tell that there is a problem somewhere, but not know
what the root cause is, particularly when your custom functions get more
complex, or when you’re calling custom functions from within other
custom functions.

You can make life easier by adding *assertions* (calls to assertion
functions).

An assertion function call accepts a condition, and stops the function
execution if that condition is not met. You can use them to check that
inputs, outputs and intermediate objects are as expected. You can also
get them to generate bespoke error messages that are specific to your
custom function, and helpful to the user.

A good package - developed by the RStudio (Posit) people - is
`assertthat`. It is extremely easy to use. We will focus on the most
useful function, `assertthat::assert_that()`.

The first - and only essential - argument that
`assertthat::assert_that()` takes is an expression that returns either
`TRUE` or `FALSE`. It’s very useful for causing your functions to fail
when objects do not meet the conditions you expect.

Here we work with a toy function, `pythagoras()`. It calculates the
length of a right-angled triangle’s hypotenuse side, given the lengths
of the other two sides. However, it will return a result for negative
numbers, and this is not ideal behavior in the context of geometry.

------------------------------------------------------------------------

``` r
# Function to calculate the length of a hypotenuse 
pythagoras <- function(a, b) {
  
  c <- sqrt(a^2 + b^2)
  
  paste0("The length of the hypotenuse is ", c)
  
}

pythagoras(2, -3)
```

    #> [1] "The length of the hypotenuse is 3.60555127546399"

------------------------------------------------------------------------

We can add assertion statements to prevent this undesirable behaviour.

``` r
# Function to calculate the length of a hypotenuse 
pythagoras <- function(a, b) {
  
  assertthat::assert_that(a > 0)
  assertthat::assert_that(b > 0)
  
  c <- sqrt(a^2 + b^2)
  
  paste0("The length of the hypotenuse is ", c)
  
}

pythagoras(2, -3)
```

    #> Error: b not greater than 0

------------------------------------------------------------------------

That’s great, but we could improve clarity. The second most useful
argument that `assertthat::assert_that()` takes is `msg`. This is a
string that will be output as part of the error message, overriding the
default, e.g. 

``` r
# Function to calculate the length of a hypotenuse 
pythagoras <- function(a, b) {
  
  assertthat::assert_that(
    a > 0 && b > 0,
    msg = "both triangle sides must have positive length!")
  
  c <- sqrt(a^2 + b^2)
  
  paste0("The length of the hypotenuse is ", c)
  
}

pythagoras(-2, 1)
```

    #> Error: both triangle sides must have positive length!

(Here we also combine the two assertions into one, to avoid repetition.)

------------------------------------------------------------------------

In this final example, additional assertions are added to check more
fundamental aspects of input.

``` r
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
```

------------------------------------------------------------------------

``` r
pythagoras("1", 2)
```

    #> Error: both arguments must be of numeric data type

``` r
pythagoras(b = 2)
```

    #> Error: you must supply two triangle lengths

------------------------------------------------------------------------

### Exercise 7

In the final exercise, we will apply `assertthat::assert_that()` to the
end product before returning it to the user.

We will make a new function, called `pythagorus_rounded()`.

1.  Add the below assertion to `pythagorus()` in the correct place to
    test the value that is reported. Reload the function and confirm
    that it fails with positive numeric inputs.
2.  Add a message to the assertion to explain why it fails. Reload the
    function and confirm that failure with this message occurs with
    positive numeric inputs.
3.  Modify the function so that the assertion passes and the function
    succeeds. Reload the function and confirm that it passes with
    positive numeric inputs.

``` r
# Exercise 7 assertion statement

assertthat::assert_that(c %% 1 == 0)
```

------------------------------------------------------------------------

### Exercise 7 Answers

------------------------------------------------------------------------

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
harder! Here are a few things to consider:

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

------------------------------------------------------------------------

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
`generalise_names()` function we looked at is a good example of this!

### Ask for feedback

A key measure of a good function (or any piece of code) is how easy it
is for someone else to understand, use and modify it. The best way to
test this is to get your code reviewed by someone else.

## How to organise your code

Whenever you’re working on something in R it’s generally best to create
an R project and version control your code on GitHub. There’s
information on how to do this in the [Analytical Platform
guidance](https://user-guidance.analytical-platform.service.justice.gov.uk/index.html).

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

------------------------------------------------------------------------

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

    #> [1] "Blue"

------------------------------------------------------------------------

You can see the code underlying a function by typing its name (without
brackets) in the console and hitting “enter”:

``` r
pick_a_colour
```

    #> function(colours){
    #>   
    #>   # Generate a random number between 1 and the number of colours provided
    #>   x <- sample(1:length(colours), 1)
    #>   
    #>   # Print a randomly chosen colour
    #>   print(colours[x])
    #>   
    #> }

## Writing a package

An alternative is to make your own package to store your functions,
which you can then use like any other R package. There are a few
advantages to this:

- It means you (and others) can access your functions from different
  projects
- There are certain requirements for making R packages that enforce good
  practice, such as including documentation

This comes at the cost of slightly higher overheads.

Examples of packages written by people in MoJ are available
[here](https://github.com/moj-analytical-services/mojRpackages).

To find out more about writing packages, check out the links under
further reading.

## Further reading

#### On functions

- [Functions chapter](https://r4ds.hadley.nz/functions) of Hadley’s R
  for Data Science book
- [Functions chapter](https://adv-r.hadley.nz/functions.html) of
  Hadley’s Advanced R book
- [Tidy
  Evaluation](https://dplyr.tidyverse.org/articles/programming.html)
  (useful for writing functions which behave like Tidyverse functions)

#### On packages

- [MoJ R package
  training](https://github.com/moj-analytical-services/rpackage_training)
- [Writing an R package from
  scratch](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)
- Hadley’s [R packages](https://r-pkgs.org/) book

#### On loops

- [Iteration chapter](https://r4ds.hadley.nz/iteration) of Hadley’s R
  for Data Science book

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
encounter when using R. Note that operators can’t be *evaluated* using
`package_name::operator` syntax. To import operators from a package
without using `library()` calls you can define them in your script with
`` `operator` <- package_name::`operator` `` or use the
[import](https://cran.r-project.org/web/packages/import/vignettes/import.html)
package e.g.  `import::from("magrittr", "%>%")`.

| Operator | Definition                          |
|:--------:|:------------------------------------|
|    ==    | Equal to                            |
|    !=    | Not equal to                        |
|    \>    | Greater than                        |
|    \<    | Less than                           |
|   \>=    | Greater than or equal to            |
|   \<=    | Less than or equal to               |
|    ǀ     | Or                                  |
|    &     | And                                 |
|    !     | Not                                 |
|   %in%   | The subject appears in a population |
| is.na()  | The subject is NA                   |

## Additional NSE examples

Below are more examples of how to handle `dplyr()`’s non-standard
evaluation. If you wanted to use the `group_by()` and `summarise()`
functions in a user-defined function, then one option is to have
variables containing the column names as strings, and including these
variables as function arguments. In the function these variables can be
enclosed by `!!as.name()` to convert them into names, like so:

``` r
sum_group_alt1 <- function(df, group_cols, sum_col) {
  
  `!!` <- rlang::`!!`
  
  df |>
    dplyr::group_by(!!as.name(group_cols)) |>
    dplyr::summarise(counts = sum(!!as.name(sum_col)))
  
}

prosecutions_grouped <- sum_group_alt1(df = prosecutions, 
                                       group_cols = "age_range", 
                                       sum_col = "count")
prosecutions_grouped
```

    #> # A tibble: 14 × 2
    #>    age_range                       counts
    #>    <chr>                            <int>
    #>  1 10-11                             3324
    #>  2 12-14                           113960
    #>  3 15-17                           570275
    #>  4 18-20                          1302589
    #>  5 21-24                          2131033
    #>  6 25+ (prior to 2017)           10209264
    #>  7 25-29 (2017 onwards)            447108
    #>  8 30-39 (2017 onwards)            758230
    #>  9 40-49 (2017 onwards)            477217
    #> 10 50-59 (2017 onwards)            261626
    #> 11 60+ (2017 onwards)              101554
    #> 12 Companies, public bodies etc.   114771
    #> 13 Not known (Adult)               195459
    #> 14 Not known (Juvenile)               150

Alternatively, this version of the function means the column names can
be input as function arguments directly (rather than needing to enclose
them in quote marks to turn them into strings).

``` r
sum_group_alt2 <- function(df, group_cols, sum_col) {
  
  `!!` <- rlang::`!!`
  
  df |>
    dplyr::group_by(!!rlang::enquo(group_cols)) |>
    dplyr::summarise(counts = sum(!!rlang::enquo(sum_col)))
  
}

prosecutions_grouped <- sum_group_alt2(df = prosecutions, 
                                       group_cols = age_range, 
                                       sum_col = count)
prosecutions_grouped
```

    #> # A tibble: 14 × 2
    #>    age_range                       counts
    #>    <chr>                            <int>
    #>  1 10-11                             3324
    #>  2 12-14                           113960
    #>  3 15-17                           570275
    #>  4 18-20                          1302589
    #>  5 21-24                          2131033
    #>  6 25+ (prior to 2017)           10209264
    #>  7 25-29 (2017 onwards)            447108
    #>  8 30-39 (2017 onwards)            758230
    #>  9 40-49 (2017 onwards)            477217
    #> 10 50-59 (2017 onwards)            261626
    #> 11 60+ (2017 onwards)              101554
    #> 12 Companies, public bodies etc.   114771
    #> 13 Not known (Adult)               195459
    #> 14 Not known (Juvenile)               150

The function below shows an example of how our `sum_group()` function
can be modified to accept column names as arguments, using the `{{`
operator. Note that you need version 0.4 or later of the rlang package
to use the `{{` operator.

``` r
sum_group_alt3 <- function(df, group_cols, sum_col) {
  
  df |>
    dplyr::group_by({{ group_cols }}) |>
    dplyr::summarise(counts = sum({{ sum_col }}))
  
}

prosecutions_grouped <- sum_group_alt3(df = prosecutions, 
                                       group_cols = age_range, 
                                       sum_col = count)
prosecutions_grouped
```

    #> # A tibble: 14 × 2
    #>    age_range                       counts
    #>    <chr>                            <int>
    #>  1 10-11                             3324
    #>  2 12-14                           113960
    #>  3 15-17                           570275
    #>  4 18-20                          1302589
    #>  5 21-24                          2131033
    #>  6 25+ (prior to 2017)           10209264
    #>  7 25-29 (2017 onwards)            447108
    #>  8 30-39 (2017 onwards)            758230
    #>  9 40-49 (2017 onwards)            477217
    #> 10 50-59 (2017 onwards)            261626
    #> 11 60+ (2017 onwards)              101554
    #> 12 Companies, public bodies etc.   114771
    #> 13 Not known (Adult)               195459
    #> 14 Not known (Juvenile)               150

## Bonus examples

### Adding an optional total row

We can extend the `sum_group()` function by having the option to add a
row with the total across all categories. Note that this requires the
`janitor` package.

``` r
sum_group <- function(df, group_cols, sum_col, add_total = FALSE) {
  
  summary <- df |>
    dplyr::group_by_at(group_cols) |>
    dplyr::summarise_at(sum_col, sum)
  
  if (add_total == TRUE) {
    summary <- summary |> janitor::adorn_totals("row")
  }
  
  summary
  
}
```

### Extracting a subset of the data

Sometimes processing data requires manipulating dates and times. For
example, if we wanted to extract the prosecutions from the year up to a
particular date, we could use a function like:

``` r
# This function extracts the prosecutions from a particular year
extract_year <- function(data, end_date) {
  
  `%m-%` <- lubridate::`%m-%`
  
  # Ensure the date is a date-time object
  if (is.character(end_date)) { end_date <- lubridate::dmy(end_date) }
  
  # Find end of quarter dates for the past year
  quarters_to_include <- end_date %m-% months(c(0, 3, 6, 9))
  
  # Format the dates to years and quarters
  years <- lubridate::year(quarters_to_include)
  quarters <- quarters(quarters_to_include)
  
  # Combine into a unique set of year-quarters
  yearquarters <- stringr::str_c(years, " ", quarters)
  
  # Filter data based on these years and quarters
  data |>
    dplyr::mutate(year_quarter = paste(year, quarter)) |>
    dplyr::filter(year_quarter %in% yearquarters)
  
  data
}
```

``` r
prosecutions_extract <- extract_year(prosecutions, "31-Mar-2018")
dplyr::glimpse(prosecutions_extract)
```

    #> Rows: 107,493
    #> Columns: 16
    #> $ year                    <int> 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008, 2008,…
    #> $ quarter                 <chr> "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1", "Q1",…
    #> $ sex                     <chr> "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "Male", "…
    #> $ type_of_defendent       <chr> "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Person", "Pe…
    #> $ age_group               <chr> "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juveniles", "Juvenile…
    #> $ age_range               <chr> "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-11", "10-1…
    #> $ ethnicity               <chr> "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not know…
    #> $ court_type              <chr> "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistrates Court", "Magistr…
    #> $ offence_type            <chr> "Indictable only", "Indictable only", "Indictable only", "Indictable only", "Triable either way", "Triable either…
    #> $ offence_group           <chr> "Sexual offences", "Robbery", "Robbery", "Possession of weapons", "Violence against the person", "Violence agains…
    #> $ tried                   <chr> "Not tried", "Tried at magistrates court", "Tried at magistrates court", "Tried at magistrates court", "Tried at …
    #> $ plea_at_the_crown_court <chr> "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not known", "Not know…
    #> $ convicted_not_convicted <chr> "Not convicted", "Convicted", "Not convicted", "Convicted", "Convicted", "Not convicted", "Convicted", "Not convi…
    #> $ sentenced_not_sentenced <chr> "Not sentenced", "Sentenced", "Not sentenced", "Sentenced", "Sentenced", "Not sentenced", "Sentenced", "Not sente…
    #> $ outcome                 <chr> "Proceedings terminated early", "Found guilty", "Dismissed (found not guilty", "Found guilty", "Found guilty", "P…
    #> $ count                   <int> 1, 6, 1, 1, 10, 1, 1, 1, 31, 1, 3, 15, 1, 5, 2, 1, 1, 4, 2, 85, 2, 20, 4, 5, 11, 1, 2, 1, 18, 168, 2, 15, 55, 44,…

## Information for presenters

### Where stuff is for on the day

- The training slides are in [slides.html](slides.html) (you will need
  to download these and open them in a browser).
- The course material is also duplicated in the README with some
  additional examples in the appendix.
- The code from the presentation is available in
  [example_code.R](example_code.R).
- The answers to the exercises are available in
  [solutions.R](solutions.R).
- The [functions.R](functions.R) script is used in one example to
  demonstrate how to organize code.

### How to update the course contents

The README, slides, solutions, and example_code are all generated from
files in the “rmd_files” folder.

- The bulk of the content is in
  [rmd_files/content.Rmd](rmd_files/content.Rmd).
- The appendix (used in the README) is in
  [rmd_files/appendix.Rmd](rmd_files/appendix.Rmd).
- The README is generated from
  [rmd_files/README.Rmd](rmd_files/README.Rmd) (this will source the
  contents of content.Rmd and appendix.Rmd).
- The slides are generated from
  [rmd_files/slides.Rmd](rmd_files/slides.Rmd) (this will source the
  contents of content.Rmd).
- The [rmd_files/functions.R](rmd_files/functions.R) script is a
  duplicate of the one in the top directory and is required for knitting
  the various files.
- The
  [rmd_files/render_rmakdown_files.R](rmd_files/render_rmakdown_files.R)
  script contains four code chunks. Running them will re-generate all
  the course material. This file should always be run before you merge
  any changes to the `main` branch.

### Tips when presenting

- You can press F11 to make the presentation full screen. To go off of
  full screen you can press F11 again.
