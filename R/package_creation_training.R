#library(usethis)
#library(roxygen2)
#library(devtools)

#Configure startup to always load devtools
##if (interactive()) {
##  suppressMessages(require(devtools))
##}

# Check that all your package building tools are installed and up to date
##devtools::dev_sitrep()

#create package and indicate file path with the last item being the name of your new package
#creates package structure and a skeleton of package files
##usethis::create_package("C:/Users/ADODGE/OneDrive - HC-SC PHAC-ASPC/Documents/DupSeq R Package Building/Training/mypackage")

#.Rbuildignore lists files that we need to have around but that should not be included when building the R package from source.
  # all files listed in this file will
  ##use_build_ignore()
  #To exclude a specific file or directory,  use use_build_ignore()
  #Note that you must anchor the file name, or else it will exclude everything that contains the file name as well. Ie. "notes" would exclude endnotes, important_notes, etc.
  #
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
# you can set a minimum version for the package
##usethis::use_package("dplyr", min_version = "1.0.0")
##usethis::use_package("dplyr", min_version = TRUE) # This will make the min version be the one installed on your computer.
# packages should never depend on tidyverse or devtools since these are meta-packages designed for convenience
# you should identify one specific package that will actually implement the desired function.
##n_hard_deps <- function(mypackage) {
##       deps <- tools::package_dependencies(mypackage, recursive = TRUE)
##       sapply(deps, length)
##}
##n_hard_deps("dplyr")
# ^ this code will tell you how many dependencies a package has so you can see how heavy it is
# the pipe function is used so much that we will export the function itself into our package
##use_pipe(export = TRUE)

# Renaming files
##rename_files("package_creation_training", "renametest")

#Create a README file
##use_readme_rmd()
#Render it
##build_readme()

# The lifecycle of an R package: Package States
# Source
  # Directory of files in a defined structure.
# Bundled
  # a bundled package has been comparessed into a single file. Extension .tar and.gz
  # also known as "source tarballs
  # Single file = .tar. Comparessed by gzip = .gz
  # For transportation of packages
# Binary
  # package formats delivered by CRAN
  #.zip files
  #So users can use the package without having the rtools for package building
# Installed
  # install() or devtools::install_github() will change a package from
  # the source, bundled or binary states and install it on the computer
# in-memory
  # Library(package) will add an installed package to the memory, making it
  # available to direct use.

# Good to keep the top-level of the source code the working directory
# This will prevent problems with paths in different package states

# check()ing your package
  # Ensures all documentation is up to date
  # bundles package before checking it (gets rid of temp files)


# Navigating through your source files
  # Press Ctrl and . at the same time to open a file navigator that will open the file you type into it
  # Press Ctrl Shift F to search through all files for word

# Tidyverse Style Guide
  #Syntax:
    #object naming. lowercase letters, numbers of _. Sperate words with _. Don't use .
    # functions should be verbs, variables should be nouns
    # avoid reusing variable and function names and don't copy names from other common variables or functions
    # always put a space after a comma [1, 3] and never before [ , 3]bad [, 3]good
    # don't put spaces around parentheses for regular function calls function(x, y, z) NOT function ( x, y, z )
    # Place a space before and after () when used with if, for, or while : if (debug) {
    # Place a space after () used for function arguments: function(x) { }
    # { } should always have inner spaces
    # operators should be surrounded by spaces: == + - <-
    # NEVER SPACE: The operators with high precedence: ::, :::, $, @, [, [[, ^, unary -, unary +, and :.

# styler is used to restyler a package into the tidyverse style You can access it from Addins,

# We basically never want our code to have to modify the global environment or the working directory of the user
# the env should be reserved for data that the user uploads themselves not anything to do with the package.
# they warn against using set.seed()

# Storing Data #
# Exported Data: data/ folder Each file should be a .rda and created by save() containing a single R object w the same name as the file
#Create data:
##mypackage_data<-sample(1000)
##usethis::use_data(mypackage_data)
# users can access the data via
##library(mypackage)
##mypackage_data # Note that this loads the data into the global env which isn't ideal
##mypackage::mypackage_data # this won't modify the global workspace


# for large datasets, we can use compression settings ex bzip2, gzip, xz
##usethis::use_data(compress =) for bzip2
##save(compress =) is gzip

# LazyData: true = use lazy_loading. This means that data won't occupy emory until you use them.

# Preserve the origin of package data: include the code used to clean up and process your data fieles in the sources version of your package.
# put this in data-raw/ and make sure to add it to .Rbuildignore
##usethis::use_data_raw()
##usethis::use_data_raw("mypackage_data")

# Document the data: document the name of the dataset and save it in R/

#ins/ when a pacakge is installed, everything in inst/ is copied to the top-level directory of the installed package.
  # don't create a subdirectory that collides with any of the directoies that make up the official structure of the r package
  # ex. DO NOT use inst/data or inst/man or inst/tests etc.
  # ex. common to use inst/extdata
  # inst/citation - citation() | usethis::use_citation()

