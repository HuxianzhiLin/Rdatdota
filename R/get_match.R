#' Match Finder
#'
#' A list of matches
#'
#' A list will be returned that contains three elements. The content, the url and the response
#' received from the api.
#'
#' The content element of the list contains a sub list called matches. Following informations are included: matchID, radTeamID,
#' direTeamID, radPicks (list), direPicks (list), radVictory, date, leagueID, leagueName, radName, direName, rad, dire, radIsA,
#' duration
#'
#' \itemize{
#'   \item \strong{matchID:} The match ID.
#'   \item \strong{radTeamID:} The radient team ID.
#'   \item \strong{direTeamID:} The dire team ID.
#'   \item \strong{radPicks:} A list contains 5 hero numbers that the radient team pick.
#'   \item \strong{direPicks } A list contains 5 hero numbers that the dire team pick
#'   \item \strong{radVictory:} Whether radient team won.
#'   \item \strong{date:} Date of the match.
#'   \item \strong{leagueID:} League ID.
#'   \item \strong{leagueName:} League name.
#'   \item \strong{radName:} Radient team name.
#'   \item \strong{direName:} Dire team name.
#'   \item \strong{rad:} Undocumented.
#'   \item \strong{dire:} Undocumented..
#'   \item \strong{radIsA:} Undocumented.
#'   \item \strong{duration:} Duration.
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
#' @param teams_a One side of the team to serch for. Check the serial number of the players on www.datdota.com. (Connected by "&". Can be null.)
#'
#' @param teams_b The other side of the team to serch for. Check the serial number of the players on www.datdota.com. (Connected by "&". Can be null.)
#'
#' @param heroes_a Heroes that team A chose. Check the serial number of the heroes on www.datdota.com. (Connected by "&". Can be null.)
#'
#' @param heroes_b Heroes that team B chose. Check the serial number of the heroes on www.datdota.com. (Connected by "&". Can be null.)
#'
#' @return A dota_api object containing the elements described in the details.
#'
#' @examples
#' \dontrun{
#' get_match()
#' get_match(patch = "7.19&7.20", split = "lan", after = "2011.01.01", before = "2018.10.12",
#'           duration = "0-200", leagues = NULL, tier = "1&2", valve = "does-not-matter",
#'           teams_a = "15", teams_b = "2586976", heroes_a = "25&26", heroes_b = "20")
#' }
#'
#' @export
get_match <- function(patch = "7.19",
                      split = "lan",
                      after = "2011.01.01",
                      before = "2018.07.12",
                      duration = "0-100",
                      leagues = NULL,
                      tier = "1&2&3",
                      valve = "does-not-matter",
                      teams_a = "15",
                      teams_b = "2586976",
                      heroes_a = "25",
                      heroes_b = "20"
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
  args <- add_para(new_arg = teams_a, arg_name = "teams-a", args = args)

  args <- add_para(new_arg = teams_b, arg_name = "teams-b", args = args)

  args <- add_para(new_arg = heroes_a, arg_name = "heroes-a", args = args)

  args <- add_para(new_arg = heroes_b, arg_name = "heroes-b", args = args)

  #result
  dota_result <- get_response(dota_api_category = "matchfinder", dota_api_subcategory = "classic", args = args)

  #return
  dota_result

}
