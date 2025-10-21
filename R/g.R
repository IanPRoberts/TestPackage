#' Run Stan model
#' 
#' @param y vector of Stan inputs
#' @param ... Additional cmdStan input arguments
#'
#' @export

g <- function( y, ... ){
  model <- instantiate::stan_package_model(
    name = "test_Stanmodel",
    package = "TestPackage"
  )
  fit <- model$sample(data = list(N = length(y), y = y), ...)
}