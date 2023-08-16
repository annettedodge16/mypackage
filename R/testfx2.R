#'Calculate MF
#'@param dat is a dataframe describing the number of mutations in a sample. 'sample' is the sample name. 'mut_depth' is the number of mutations in the sample. 'total_depth' is the total number of bases sequenced for the sample.
#'@param mut_col Name of the mutation depth column
#'@param tot_col Name of the total depth column
#'@return This function will output the dataframe with an added column MF that contains the calculated mutation frequency for each sample.
#'@export
testfx2 <- function(dat, mut_col, total_col) {
  dat %>%
    dplyr::mutate(MF = {{ mut_col }} / {{ total_col }})
} # curly-curly rlang "unquotes" expressions to allow the evaluation of the expression's value, such as the contents of a column

