library(usethis)
library(roxygen2)
library(devtools)

#create package and indicate file path with the last item being the name of your new package
#creates package structure and a skeleton of package files
usethis::create_package("C:/Users/ADODGE/OneDrive - HC-SC PHAC-ASPC/Documents/DupSeq R Package Building/Training/mypackage")

#.Rbuildignore lists files that we need to have around but that should not be included when building the R package from source.
#.Rproj.user, if you have it, is a directory used internally by RStudio.
#.gitignore anticipates Git usage and tells Git to ignore some standard, behind-the-scenes files created by R and RStudio
#DESCRIPTION provides metadata about your package.
#NAMESPACE declares the functions your package exports for external use and the external functions your package imports from other packages.
#The R/ directory is the “business end” of your package. It will soon contain .R files with function definitions.
#mypackage.Rproj is the file that makes this directory an RStudio Project.

#creates a basic package documentation
usethis::use_package_doc()
#set the license for your package
usethis::use_mit_license("Annette Dodge")

#create a git repository
usethis::use_git()

#create a github repository
usethis::use_github()

#register your personal access token with rstudio
gitcreds::gitcreds_set()

#Adding functions
usethis::use_r("testfx1")
#We don't need to run the function, we will load it
load_all()

#use roxygen to create the documentation for the new function
usethis::use_roxygen_md()
