#' The pre process of the parameters of the request functions
#'
#' This function is of no particular use to the user, but might be useful for anyone who
#' would like to dive deeper into the package development. This function is used to pre edit
#' the parameters of the GET functions
#'
#' @param after The beginning date of the match
#'
#' @param before The last day of the period to search
#'
#' @param duration The time the game lasts (measured in minutes)
#'
#' @param tier What tier of event is this? 1 = Premium; 2 = Professional; 3 = Semi-pro; (Connected by "&")
#'
#' @param patch Which patches are you interested in? From 6.74 to 7.20. (Connected by "&")
#'
#' @param split What type of event was it? Choose from "online", "lan" or "post-event".
#'
#' @param leagues What league is it in? Check the number of the league on www.datdota.com.
#'
#' @param valve Is this a Valve event? Choose from "yes", "no" or "does-not-matter".
#'
#' @examples
#' \dontrun{
#' para_trans()
#' para_trans(after = "2012.01.01", before = "2018.01.01", duration = "0-50", tier = "1")
#' }
#'
#' @return A list of parameters used in get_response function.
#'
#' @export
para_trans <- function(after = "2011.01.01",
                       before = "2018.01.01",
                       duration = "0-100",
                       tier = "1&2&3",
                       patch = "7.20&7.19",
                       split = "online&lan",
                       leagues = "NULL",
                       valve = "does-not-matter"
) {
  #transform the parameters
  after <- stringr::str_split(after,"\\.")
  after <- paste0(after[[1]][2], "/", after[[1]][3], "/", after[[1]][1])

  before <- stringr::str_split(before,"\\.")
  before <- paste0(before[[1]][2], "/", before[[1]][3], "/", before[[1]][1])

  duration <- stringr::str_split(duration, "-")
  duration <- paste0(duration[[1]][1], ";", duration[[1]][2])

  #transform tier to make it fit several arguments
  args <- list()

  args <- add_para(new_arg = tier, arg_name = "tier", args = args)

  #transform patch to make it fit several arguments
  args <- add_para(new_arg = patch, arg_name = "patch", args = args)

  #transform split to make it fit several arguments
  args <- add_para(new_arg = split, arg_name = "split-type", args = args)

  #generage final args
  args$after <- after
  args$before <- before
  args$duration <- duration
  args$leagues <- leagues
  args$'valve-event' <- valve
  args
}
