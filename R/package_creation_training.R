#library(usethis)
#library(roxygen2)
#library(devtools)

#create package and indicate file path with the last item being the name of your new package
#creates package structure and a skeleton of package files
##usethis::create_package("C:/Users/ADODGE/OneDrive - HC-SC PHAC-ASPC/Documents/DupSeq R Package Building/Training/mypackage")

#.Rbuildignore lists files that we need to have around but that should not be included when building the R package from source.
#.Rproj.user, if you have it, is a directory used internally by RStudio.
#.gitignore anticipates Git usage and tells Git to ignore some standard, behind-the-scenes files created by R and RStudio
#DESCRIPTION provides metadata about your package.
#NAMESPACE declares the functions your package exports for external use and the external functions your package imports from other packages.
#The R/ directory is the “business end” of your package. It will soon contain .R files with function definitions.
#mypackage.Rproj is the file that makes this directory an RStudio Project.

# Notes on Naming Conventions
#https://cran.r-project.org/doc/manuals/R-exts.html#Package-structure
# format should avoid ‘"’, ‘*’, ‘:’, ‘/’, ‘<’, ‘>’, ‘?’, ‘\’, and ‘|’ , spaces, and  ‘con’, ‘prn’, ‘aux’, ‘clock$’, ‘nul’, ‘com1’ to ‘com9’, and ‘lpt1’ to ‘lpt9’
# best not to use uppercase

#Version
# 2-3 numbers
# NOT decimal places. Ex. 0.0.9 < 0.0.75 because 9 < 75

#creates a basic package documentation
##usethis::use_package_doc()
#set the license for your package
##usethis::use_mit_license("Annette Dodge")

#create a git repository
##usethis::use_git()

#create a github repository
##usethis::use_github()

#register your personal access token with rstudio
##gitcreds::gitcreds_set()

#Adding functions
##usethis::use_r("testfx1")

#We don't need to run the function, we will load it
#load_all() simulates the installation and loading of a package as if you opened it with library(mypackage)
#Note that any code that you don't want it to run again should be commented out
#Your functions will not appear in the global env but will be available to you to use just by calling them

##load_all()

# check that everything is in working order
#It's good to check after every new addition

##check()
#this also prompted me to install rtools

# Create Documentation for your new Function using roxygen
#Go into the .R file for your function and type #'
# @param lets you define the parameters
# @return lets you define the output
# @export will tag the function for exportation and get it into the namespace file. This allows the function to be available to the user after they load the package
# @examples lets you show examples of your function

#To create the .Rd file
##document()
##?testfx1
# Note that some links won't be built until after the package is formally built and installed such as the example - help


