#' Match Length Distributions
#'
#' Three lists of the duration of matches
#'
#' A list will be returned that contains three elements. The content, the url and the response
#' received from the api.
#'
#' The content element of the list contains three sub lists. The first list is called durations which
#' tells the distribution of the minutes. The second list is called longest which includes the match id, teams
#' and duration. The third list is called shortest which includes the match id, teams and duration. There are
#' also three variables in the content list which provides the mean, the standard deviation and the count.
#'
#' \itemize{
#'   \item \strong{minute:} The time the game lasts.
#'   \item \strong{percentile:} Percentage.
#'   \item \strong{match:} The match ID.
#'   \item \strong{teams:} Two teams of this match.
#'   \item \strong{duration:} The time the game lasts.
#'   \item \strong{mean:} Average time of these matches.
#'   \item \strong{stdDev} Standard deviation.
#'   \item \strong{count:} Total number of matches.
#' }
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
#' @param leagues What league is it in? Check the serial number of the league on www.datdota.com.
#'
#' @param valve Is this a Valve event? Choose from "yes", "no" or "does-not-matter".
#'
#' @param teams Teams to serch for. Check the serial number of the players on www.datdota.com. (Connected by "&". At least one must appear)
#'
#' @return A dota_api object containing the elements described in the details.
#'
#' @examples
#' \dontrun{
#' get_match_length()
#' get_match_length(patch = "7.19", split = "lan", after = "2011.01.01", before = "2018.07.12",
#'                  duration = "0-100", leagues = NULL, tier = "1&2&3", valve = "does-not-matter",
#'                  teams = "15")
#' }
#'
#' @export
get_match_length <- function(patch = "7.19",
                             split = "lan",
                             after = "2011.01.01",
                             before = "2018.07.12",
                             duration = "0-100",
                             leagues = NULL,
                             tier = "1&2&3",
                             valve = "does-not-matter",
                             teams = NULL
) {
  #transform the parameters
  args <- para_trans(patch = patch,
                     split = split,
                     after = after,
                     before = before,
                     duration = duration,
                     leagues = leagues,
                     tier = tier,
                     valve = valve)

  #get unique query arguments for this particular function
  args <- add_para(new_arg = teams, arg_name = "teams", args = args)

  #result
  dota_result <- get_response(dota_api_category = "match-durations", dota_api_subcategory = NULL, args = args)

  #return
  dota_result

}
