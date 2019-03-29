# Render markdowns

# render readme.Rmd as GitHub markdown document
rmarkdown::render("rmd_files/README.Rmd", output_format = "github_document")

# render slides.Rmd as an ioslides presentation
rmarkdown::render("rmd_files/slides.Rmd", output_format = "ioslides_presentation")

# move rendered files to main directory
file.rename("rmd_files/README.md", "README.md")
file.rename("rmd_files/slides.html", "slides.html")
