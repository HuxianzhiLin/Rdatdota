#' Single Player Performance
#'
#' A list of player performance in a single match
#'
#' A list will be returned that contains three elements. The content, the url and the response
#' received from the api.
#'
#' The content element of the list contains a sub list called data. Following informations are included: steamID, Nickname.
#' Total Count, Wins, Losses, Winrate, As Radient, As Dire, Kills, Deaths, Assists, KDA, Avg.KAL, GPM, XPM, Last Hits,
#' Denies, LVL, HD, TD, HH, GS
#'
#'\itemize{
#'   \item \strong{steamID:} The steam ID of the player.
#'   \item \strong{nickname:} The nickname of the player.
#'   \item \strong{matchID:} The match ID.
#'   \item \strong{hero:} The hero that the player use.
#'   \item \strong{victory:} Whether win or not.
#'   \item \strong{kills:} Average times of kill.
#'   \item \strong{deaths:} Average times of Death.
#'   \item \strong{assists:} Average times of Assistance.
#'   \item \strong{kda:} Average (Kills + Assists)/Deaths.
#'   \item \strong{avgKAL:} Undocumented.
#'   \item \strong{gpm:} Average gold per minute.
#'   \item \strong{xpm:} Average EXP per minute.
#'   \item \strong{lastHits:} Average times of last hit.
#'   \item \strong{denies:} Average times of deny.
#'   \item \strong{level:} Average level.
#'   \item \strong{heroDamage:} Average hero damage.
#'   \item \strong{towerDamage:} Average tower damage.
#'   \item \strong{heroHealing:} Average hero heal.
#'   \item \strong{goldSpent:} Average gold spent.
#'   \item \strong{endItems:} Lists of the items at the end of the match.
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
#' @param heroes Heroes picked. Check the serial number of the heroes on www.datdota.com. (Connected by "&". Can be null.)
#'
#' @param roles What role was it played? Choose from "core" or "support". (Connected by "&". Can be null.)
#'
#' @return A dota_api object containing the elements described in the details.
#'
#' @examples
#' \dontrun{
#' get_player_single()
#' get_player_single(patch = "7.19", split = "lan", after = "2011.01.01", before = "2018.07.12",
#'                   duration = "0-100", leagues = NULL, tier = "1&2&3", valve = "does-not-matter",
#'                   teams = "15", players = "106863163", heroes = "17", roles = "core")
#' }
#'
#' @export
get_player_single <- function(patch = "7.19",
                           split = "lan",
                           after = "2011.01.01",
                           before = "2018.07.12",
                           duration = "0-100",
                           leagues = NULL,
                           tier = "1&2&3",
                           valve = "does-not-matter",
                           teams = NULL,
                           players = NULL,
                           heroes = NULL,
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

  args <- add_para(new_arg = heroes, arg_name = "heroes", args = args)

  args <- add_para(new_arg = roles, arg_name = "roles", args = args)

  #result
  dota_result <- get_response(dota_api_category = "players", dota_api_subcategory = "single-performance", args = args)

  #return
  dota_result

}
