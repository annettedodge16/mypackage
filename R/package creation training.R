library(usethis)
library(roxygen2)

#create package and indicate file path with the last item being the name of your new package
#creates package structure and a skeleton of package files
usethis::create_package("C:/Users/ADODGE/OneDrive - HC-SC PHAC-ASPC/Documents/DupSeq R Package Building/Training/mypackage")

#creates a basic package documentation
usethis::use_package_doc()

#create a git repository
usethis::use_git()

#create a github repository
usethis::use_github()

#register your personal access token with rstudio
gitcreds::gitcreds_set()

