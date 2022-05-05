# 1.1 hello_world() solution

hello_world <- function() {
  print("Hello world!")
}

hello_world()

# 1.2 my_mean() solution

my_mean <- function(x, y) {
  z <- (x + y) / 2
  return(z)
}

my_mean(7.5, 16)















# 2.1 fizz_buzz() solution

fizz_buzz <- function(x) {
  
  if (x %% 3 == 0 & x %% 5 == 0) {
    return("fizz buzz")
  } else if (x %% 3 == 0) {
    return("fizz")
  } else if (x %% 5 == 0) {
    return("buzz")
  } else {
    return(as.character(x))
  }
  
}

## fizz_buzz(1)  # "1"
## fizz_buzz(2)  # "2"
## fizz_buzz(3)  # "fizz"
## fizz_buzz(5)  # "buzz"
## fizz_buzz(15) # "fizz buzz"

# 2.2 fizz_buzz_vec() solution

fizz_buzz_vec <- function(x) {
  
  result <- dplyr::case_when(
    x %% 3 == 0 & x %% 5 == 0 ~ "fizz buzz",
    x %% 3 == 0 ~ "fizz",
    x %% 5 == 0 ~ "buzz",
    TRUE ~ as.character(x)
  )
  
  return(result)
  
}

fizz_buzz_vec(1:15)

# 2.3 fizz_buzz_custom() solution

fizz_buzz_custom <- function(x, fizz = 3, buzz = 5) {
  
  if (x %% fizz == 0 & x %% buzz == 0) {
    return("fizz buzz")
  } else if (x %% fizz == 0) {
    return("fizz")
  } else if (x %% buzz == 0) {
    return("buzz")
  } else {
    return(as.character(x))
  }
  
}


fizz_buzz_custom_vec <- function(x, fizz = 3, buzz = 5) {
  
  result <- dplyr::case_when(
    x %% fizz == 0 & x %% buzz == 0 ~ "fizz buzz",
    x %% fizz == 0 ~ "fizz",
    x %% buzz == 0 ~ "buzz",
    TRUE ~ as.character(x)
  )
  
  return(result)
  
}

fizz_buzz_custom_vec(1:15)
fizz_buzz_custom_vec(c(1, 2, 3, 7, 15, 21), buzz = 7)

















# Exercise 3 solution

colnames(prosecutions) <- generalise_names(colnames(prosecutions))
glimpse(prosecutions)











# Exercise 4 solution

clean_not_known <- function(x,
                            not_known_phrase = "Not known",
                            change_na = TRUE,
                            values_to_change = c("n/a", "not known", "unknown", "not stated")) {
  
  # Replace any missing (NA) values
  if (change_na) {
    x <- replace(x, is.na(x), not_known_phrase)
  }
  
  # Remove any white space that might cause the strings to not match
  x <- stringr::str_trim(x)
  
  # Replace strings in the data that refer to a missing or unknown value.
  x <- dplyr::if_else(tolower(x) %in% values_to_change, not_known_phrase, x)
  
  return(x)
  
}

# Exercise 5 solution

clean_dataset <- function(data) {
  
  # Clean the column headings
  colnames(data) <- generalise_names(colnames(data))
  # Remove numeric indices from columns
  data <- dplyr::mutate_if(data, is.character, remove_numbering)
  # Make missing/unknown value entries more consistent
  data <- dplyr::mutate_if(data, is.character, clean_not_known)
  
  return(data)
  
}



















# Exercise 6 solution

plot_prosecutions <- function(df, breakdown = "offence_type") {
  
  # Group and summarise data by year and breakdown variable ready to plot
  df_grouped <- df %>%
    dplyr::group_by(.data[[breakdown]], year) %>%
    dplyr::summarise(counts = sum(count))

  # Produce the plot
  plot <- df_grouped %>%
    ggplot2::ggplot(ggplot2::aes_string(x = "year", y = "counts", group = breakdown, col = breakdown)) +
    ggplot2::geom_line() +
    ggplot2::scale_x_continuous(breaks = 0:2100) +
    ggplot2::theme_classic()

  return(plot)
  
}

# Exercise 6 solution

plot_prosecutions(prosecutions, breakdown = "offence_group")
