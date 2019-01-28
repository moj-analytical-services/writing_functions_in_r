# Writing functions in R

Functions are a way to package up bits of code to make them easy to reuse. Base R includes numerous built-in functions and there are thousands more R functions in packages available on CRAN and elsewhere.

You can also write your own functions, called "user-defined functions".

Functions in a package are the same thing as functions you define yourself, they're just stored in a different way.

You can see the code underlying a function by typing its name (without brackets) in the console and hitting 'enter'.

# Why use functions?

## Abstraction

One of the benefits of functions is they abstract away the details of *how* the code works, all you need to understand is *what* the function is designed to do.

When you're writing your own function, you'll obviously need to understand how it works when you're writing it, but you won't need to think about it everytime you use it. This is particularly useful for things you might want to do more than once.

## Code maintenance

If you write functions instead of writing variants of the same code over and over, generally your code will be much more succinct. This makes it a lot easier to QA, as each function only needs QAing once; and a lot easier to modify, as you only need to change your code in one place. It means you're less likely to make mistakes, and if you do you only need to correct the code once.

## Code legibility

You can use functions to make your code more succinct and better structured - done well, this can make your code a lot easier to understand for someone unfamiliar with it, or even yourself in a week's time or a few months down the line.

In summary using functions can make your code easier to read, easier to write, easier to QA and easier to modify. So really the question is why would you not use functions!



