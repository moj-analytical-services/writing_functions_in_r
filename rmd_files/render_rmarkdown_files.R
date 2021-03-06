# Render markdowns

# render readme.Rmd as GitHub markdown document
rmarkdown::render("rmd_files/README.Rmd", output_format = "github_document")

# render slides.Rmd as an ioslides presentation
rmarkdown::render("rmd_files/slides.Rmd", output_format = "ioslides_presentation")

# move rendered files to main directory
file.rename("rmd_files/README.md", "README.md")
file.remove("rmd_files/README.html")
file.rename("rmd_files/slides.html", "slides.html")

# extract R code from content.Rmd into separate script
purl_solutions <- FALSE # This means solutions won't be included
purl_example_code <- TRUE # This means all code apart from solutions will be included
knitr::purl("rmd_files/content.Rmd", documentation=0)

# give it a more sensible name
file.rename("content.R", "example_code.R")

# extract solutions from content.Rmd into separate script
purl_solutions <- TRUE # This means solutions will be included
purl_example_code <- FALSE # This means code that isn't an exercise solution won't be included
knitr::purl("rmd_files/content.Rmd", documentation=0)
file.rename("content.R", "solutions.R")

# copy files that content.R and README.md call to the main folder
file.copy("rmd_files/functions.R", ".", recursive = TRUE)

file.copy("rmd_files/README_files", ".", recursive = TRUE)
