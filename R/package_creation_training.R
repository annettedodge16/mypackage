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
# Requirements:
# Title of function
# @param definition of parameters
# @return definition of the output
# @export will tag the function for exportation and get it into the namespace file. This allows the function to be available to the user after they load the package
# @examples lets you show examples of your function (not required)

#To create the .Rd file
##document()
##?testfx1
# Note that some links won't be built until after the package is formally built and installed such as the example - help

# Install the package into you library
## install()
## library(mypackage)

# Unit Test your functions #
# initialise testthat for unit testing
##use_testthat()
##use_test("testfx1") #This will open/create the test-function.R where you will write your test

## test_that("addition works", {
## expect_equal(testfx1(1,2), 3)
## })

# The above test will evaluate whether the output of the function is equal to the correct answer that you have supplied
# To run all your tests:
##test()
# your tests will also run when you do check()


# Using other packages in your package
# This will tell your package to put the dplyr package into your imports (ie your dependencies)
##use_package("dplyr")
# You can now refer to dplyr functions using dplyr::fun()

# the pipe function is used so much that we will export the function itself into our package
##use_pipe(export = TRUE)

