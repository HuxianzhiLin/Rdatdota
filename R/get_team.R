#' Team Performances
#'
#' Lists of team performances
#'
#' A list will be returned that contains three elements. The content, the url and the response
#' received from the api.
#'
#' The content element of the list contains a sub list called data. Following informations are included: team (list), wins,
#' losses, total, gamesRadient, gamesDire, winrate, kills, deaths, assists, gpm, xpm, lastHits, denies, duration, durationWins,
#' durationLosses, durationShift
#'
#'\itemize{
#'   \item \strong{team:} A list that contains the name, valveId, tag of the team.
#'   \item \strong{wins:} Wins.
#'   \item \strong{losses:} Losses.
#'   \item \strong{total:} Total games.
#'   \item \strong{winrate:} Winrate.
#'   \item \strong{gamesRadient:} Times that the player is in Radient team.
#'   \item \strong{gamesDire:} Times that the player is in Dire team.
#'   \item \strong{kills:} Average times of kill.
#'   \item \strong{deaths:} Average times of Death.
#'   \item \strong{assists:} Average times of Assistance.
#'   \item \strong{gpm:} Average gold per minute.
#'   \item \strong{xpm:} Average EXP per minute.
#'   \item \strong{lastHits:} Average times of last hit.
#'   \item \strong{denies:} Average times of deny.
#'   \item \strong{duration:} Average game duration.
#'   \item \strong{durationWins:} Average game duration that the team won the game.
#'   \item \strong{durationLosses:} Average game duration that the team lost the game.
#'   \item \strong{durationShift:} Average duration shift.
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
#' get_team()
#' get_team(patch = "7.19", split = "lan", after = "2011.01.01", before = "2018.07.12",
#'          duration = "0-100", leagues = NULL, tier = "1&2&3", valve = "does-not-matter",
#'          teams = "15")
#' }
#'
#' @export
get_team<- function(patch = "7.19",
                              split = "lan",
                              after = "2011.01.01",
                              before = "2018.07.12",
                              duration = "0-100",
                              leagues = NULL,
                              tier = "1&2&3",
                              valve = "does-not-matter",
                              teams = "15"
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
  dota_result <- get_response(dota_api_category = "teams", dota_api_subcategory = "performances", args = args)

  #return
  dota_result

}
