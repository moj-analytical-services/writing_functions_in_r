# Render markdowns

### Render README.Rmd as GitHub markdown document --------------------------------------------------
# Note: this includes rmd_files/content.Rmd and rmd_files/appendix.Rmd.
rmarkdown::render(
  "rmd_files/README.Rmd", 
  output_format = "github_document",
  output_dir = here::here(),
  output_file = here::here("README.md")
)

here::here("README.html") |> file.remove()

### Render slides.html as an isoslides presentation ------------------------------------------------
# Note: this includes rmd_files/content.Rmd.
rmarkdown::render(
  "rmd_files/slides.Rmd", 
  output_format = "ioslides_presentation",
  output_dir = here::here(),
  output_file = here::here("slides.html")
)


### Extract the example code chunks into an R script -----------------------------------------------
# Note: purl flags are set in the global environment prior to extracting the code.
purl_solutions <- FALSE 
purl_example_code <- TRUE 
knitr::purl(
  here::here("rmd_files/content.Rmd"), 
  documentation = 1, 
  output = here::here("example_code.R")
)
rm(purl_solutions, purl_example_code)


### Extract the solution code chunks into an R script ----------------------------------------------
# Note: purl flags are set in the global environment prior to extracting the code.
purl_solutions <- TRUE 
purl_example_code <- FALSE 
knitr::purl(
  here::here("rmd_files/content.Rmd"), 
  documentation = 1,
  output = here::here("solutions.R")
)
rm(purl_solutions, purl_example_code)


