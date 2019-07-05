# Testing out some "real-world" functions.
# Lots of the straight-forward analysis I've done has involved producing summary
# tables using dplyr. Using dplyr in functions can be a bit tricky due to its 
# non-standard evaluation


# Load packages
library(s3tools)
library(dplyr)
library(janitor)

# Read in some data
cases <- s3tools::s3_path_to_full_df("alpha-everyone/r_functions_training/prosecutions-and-convictions-2018.csv")


# Let's say we wanted to create a summary table showing the
# numbers prosecuted in different age bands. We could do:
cases_grouped <- cases %>%
  group_by(Age.Range) %>%
  summarise(counts = sum(Count)) %>% 
  adorn_totals("row")
  

# What if we wanted to create several different summary tables?
# We could write a function to avoid writing this out each time.

# # This function doesn't work for me for some reason, 
# # despite following this: https://tidyeval.tidyverse.org/dplyr.html
# sum_group1 <- function(df, group_col, sum_col) {
#   
#   group_cols <- quo(group_col)
#   sum_col <- quo(sum_col)
#   
#   summary <- df %>%
#     group_by(!!group_col) %>%
#     summarise(counts = sum(!!sum_col))
#   
#   return(summary)
#   
# }
# 
# cases_grouped <- sum_group1(df = cases, group_col = "Age.Range", sum_col = "Count")

# (This function works, but doesn't follow the standard dplyr approach)
sum_group <- function(df, group_cols, sum_col) {
  
  summary <- df %>%
    group_by_at(group_cols) %>%
    summarise(counts = sum(!!as.name(sum_col))) %>% 
    adorn_totals("row")
  
  return(summary)
  
}

# We can go one step further and make the total row optional
sum_group <- function(df, group_cols, sum_col, add_total=F) {
  
  summary <- df %>%
    group_by_at(group_cols) %>%
    summarise(counts = sum(!!as.name(sum_col)))
  
  if (add_total == T) {
    summary <- summary %>% adorn_totals("row")
  }
  
  return(summary)
  
}

# Here's the same summary table as before, generated using a function
cases_grouped <- sum_group(df = cases, group_cols = "Age.Range", sum_col = "Count", add_total=T)

# This functions allows us to add any number of grouping columns
cases_grouped <- sum_group(df = cases, 
                           group_cols = c("Age.Range", "Offence.Group"), 
                           sum_col = "Count",
                           add_total=T)


# Another example, say we want to produce some plots, and want them all to 
# have the same style. We can define the style of the plot in a function,
# then we only have to change the styling in one place if it needs changing.
# Here we've gone for a line chart with a red line.
plot_x_and_y <- function(df, x_col, y_col){
  
  x <- df %>% pull(x_col)
  y <- df %>% pull(y_col)
  
  plot(x, y, col='red', type='l', xlab=x_col, ylab=y_col)
  
}

time_series <- sum_group(df = cases, 
                         group_cols = c("Year"), 
                         sum_col = "Count")

plot_x_and_y(time_series, x="Year", y="counts")


# Exercise idea: modify the sum_group function to add a filter


