#' The pre process of the parameters of the request functions
#'
#' This function is of no particular use to the user, but might be useful for anyone who
#' would like to dive deeper into the package development. This function is used to add
#' new parameters to the final GET request.
#'
#' @param new_arg The new argument to be added.
#'
#' @param arg_name The name of the argument in the final url.
#'
#' @param args The current argument list
#'
#' @examples
#' \dontrun{
#' add_para(new_arg = players, arg_name = "players", args = args)
#' }
#'
#' @return A list of parameters used in get_response function.
#'
#' @export
add_para <- function(new_arg, arg_name, args) {
  #transform the parameters
  if (length(args) == 0) {
    length <- 0
  }else {
    length <- length(args)
  }

  if (is.null(new_arg) == FALSE) {
    new_arg <- stringr::str_split(new_arg, "&")

    new_arg_length <- length(new_arg[[1]])

    for (i in 1:new_arg_length) {
      args[[i + length]] <- new_arg[[1]][i]
    }
    for(i in (length + 1):(length + new_arg_length)){
      names(args)[i] <- arg_name
    }
  }
  return(args)
}
