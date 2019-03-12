# We can collect functions together in this R script

pick_a_colour <- function(colours){
  
  # Generate a random number between 1 and the number of colours provided
  x <- sample(1:length(colours), 1)
  
  # Print a randomly chosen colour
  print(colours[x])
  
}

