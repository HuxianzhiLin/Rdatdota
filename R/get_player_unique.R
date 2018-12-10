#' Unique Heroes
#'
#' A list of players and the unique heroes they have used
#'
#' A list will be returned that contains three elements. The content, the url and the response
#' received from the api.
#'
#' The content element of the list contains a sub list called data. Following informations are included: nickname, steamId,
#' heroes (list), countUnique, gameCount.
#'
#'\itemize{
#'   \item \strong{steamID:} The steam ID of the player.
#'   \item \strong{nickname:} The nickname of the player.
#'   \item \strong{heroes:} A list of unique heroes that the player have played.
#'   \item \strong{countUnique:} The number of unique heroes that the player have used.
#'   \item \strong{gameCount:} Total nuber of games.
#' }
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
#' @param players Players to search for. Check the serial number of the players on www.datdota.com. (Connected by "&". Can be null.)
#'
#' @param roles What role was it played? Choose from "core" or "support". (Connected by "&". Can be null.)
#'
#' @return A dota_api object containing the elements described in the details.
#'
#' @examples
#' \dontrun{
#' get_player_unique()
#' get_player_unique(patch = "7.19", split = "lan", after = "2011.01.01", before = "2018.07.12",
#'                   duration = "0-100", leagues = NULL, tier = "1&2&3", valve = "does-not-matter",
#'                   teams = "15", players = "106863163", roles = "core")
#' }
#'
#' @export
get_player_unique <- function(patch = "7.19",
                              split = "lan",
                              after = "2011.01.01",
                              before = "2018.07.12",
                              duration = "0-100",
                              leagues = NULL,
                              tier = "1&2&3",
                              valve = "does-not-matter",
                              teams = NULL,
                              players = NULL,
                              roles = NULL
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
  args <- add_para(new_arg = players, arg_name = "players", args = args)

  args <- add_para(new_arg = teams, arg_name = "teams", args = args)

  args <- add_para(new_arg = roles, arg_name = "roles", args = args)

  #result
  dota_result <- get_response(dota_api_category = "players", dota_api_subcategory = "unique-heroes", args = args)

  #return
  dota_result

}
