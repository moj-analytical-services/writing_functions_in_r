# Writing functions in R

Functions are a way to package up bits of code to make them easy to reuse. Base R includes numerous built-in functions and there are thousands more R functions in packages available on CRAN and elsewhere.

You can also write your own functions, called "user-defined functions".

Functions in a package are the same thing as functions you define yourself, they're just stored in a different way.

You can see the code underlying a function by typing its name (without brackets) in the console and hitting 'enter'.

## Why use functions?

### Abstraction

One of the benefits of functions is they abstract away the details of *how* the code works. To use a function, all you need to understand is *what* the function is designed to do.

When you're writing your own function, you'll obviously need to understand how it works when you're writing it, but you won't need to think about it everytime you use it. This is particularly useful for things you might want to do more than once.

### Code maintenance

If you write functions instead of writing variants of the same code over and over, generally your code will be much more succinct. This makes it a lot easier to QA, as each function only needs QAing once; and a lot easier to modify, as you only need to change your code in one place. It means you're less likely to make mistakes, and if you do you only need to correct the code once.

### Code legibility

You can use functions to make your code more succinct and better structured - done well, this can make your code a lot easier to understand for someone unfamiliar with it, or even yourself in a week's time or a few months down the line.

In short, using functions can make your code easier to read, easier to write, easier to QA and easier to modify. So really the question is why would you not use functions!

## How to write a function

The syntax for creating a function is:

```{r}
function_name <- function(arg1, arg2){
        # function body, e.g. 
        print(paste(arg1, arg2))
}

```

We're using the function `function()` to create a function (sorry, couldn't resist!) and assign it to the name `function_name`.

A function is made up of three components:

1. Its *arguments* (in this example, `arg1` and `arg2`)
2. The function *body* (everything between the curly brackets)
3. And the function *environment* (we're going to ignore this for now)

The *arguments* allow us to pass values into the function and the *body* is where we put the code.

## When to write a function

### When you've copied and pasted three times
There is a principal in software engineering called Don't Repeat Yourself (DRY) - which basically states that you should avoid duplication wherever possible. A good rule of thumb is whenever you find you've copied and pasted the same code three times, it's time to consider replacing that code with a function.

### To structure your code
You may also sometimes want to write a function for code you're only planning to use once as a way of structuring your code and "hiding" some of it to make your main script easier to read.

### A word of warning
The R ecosystem is full of high quality packages designed to solve all kinds of problems - it's generally best to make sure that a function doesn't already exist before writing your own. (This is really just an extension of the DRY principal).

## How to organise your code

Whenever you're working on something it's generally best to create a new R project and version control your code using on GitHub. There's guidance on how to do this in the Analytical Platform guidance.

It's also best to keep your functions separate to the rest of your code to make them easier to find. There are a couple of ways to do this:

### Storing your functions in your project
The easiest way to store your functions is just to create a folder in your project called "functions" and saving your functions there.

You could either put each function in its own R script with the same name, or you could group related functions into clearly named scripts.

Then just use ```source()``` to run the code and make your functions available to you in the current session. As with loading libraries, it's best to do this at the top of your script.

### Writing packages
An alternative is to make your own package to store your functions which you can then use like any other R package. There are a few advantages to this:

+ It means you (and others) can access your functions from different projects
+ There are certain requirements for making R packages which enforce good practice, such as documentation

This comes at the cost of slightly higher overheads.

A few examples of packages written by people in MoJ are:

+ [s3tools](https://github.com/moj-analytical-services/s3tools)
+ [asdrap](https://github.com/moj-analytical-services/asdrap)


To find out more about writing packages, check out the further reading below. We're also hoping to do a Coffee and Coding session on it in future so watch this space (or let us know if you'd be interested in volunteering)!

## Further reading

### On functions
+ [DataCamp writing functions in R course](https://www.datacamp.com/courses/writing-functions-in-r)
+ [Functions chapter](https://adv-r.hadley.nz/functions.html) of Hadley's Advanced R book
+ [Tidy Evaluation](https://tidyeval.tidyverse.org/introduction.html) (useful for writing functions which behave like Tidyverse functions) 

### On packages
+ [Writing an R package from scratch](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)
+ Hadley's [R packages](http://r-pkgs.had.co.nz/) book

### Misc
+ [Tidyverse style guide](https://style.tidyverse.org/) (has some guidance on choosing function and argument names)


