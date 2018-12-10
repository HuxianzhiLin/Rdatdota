#' Player Records
#'
#' Lists of records
#'
#' A list will be returned that contains three elements. The content, the url and the response
#' received from the api.
#'
#' The content element of the list contains a sub list called data. Following lists are included: kills, gpm, hero_damage,
#' denies, kda_1_death, kills_per_min, assists_per_min, gold, last_hits, xpm, assists, tower_damage, hero_healings, deaths,
#' deaths_per_min. There are sub lists in every one of these lists, each represents one record. The record in turn represents
#' the steam ID of the player, the nickname of the player, the value of the record, the hero ID, the match ID.
#'
#'\itemize{
#'   \item \strong{kills:} Kills.
#'   \item \strong{gpm:} Gold per minute.
#'   \item \strong{hero_damage:} The total hero damage.
#'   \item \strong{denies:} Total number of denies.
#'   \item \strong{kda_1_death:} KDA.
#'   \item \strong{kills_per_min:} Kills per minute.
#'   \item \strong{assists_per_min:} Assists per minute.
#'   \item \strong{gold:} Overall gold.
#'   \item \strong{last_hits:} Total number of last hits.
#'   \item \strong{xpm:} EXP per minute.
#'   \item \strong{assists:} Total number of assists.
#'   \item \strong{tower_damage:} Total tower damage.
#'   \item \strong{hero_healing:} Total hero healing.
#'   \item \strong{deaths:} Total number of death.
#'   \item \strong{deaths_per_min:} Deaths per minute.
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
#' get_player_records()
#' get_player_records(patch = "7.19", split = "lan", after = "2011.01.01", before = "2018.07.12",
#'                    duration = "0-100", leagues = NULL, tier = "1&2&3", valve = "does-not-matter",
#'                    teams = "15", players = "106863163", heroes = "15", roles = "core")
#' }
#'
#' @export
get_player_records<- function(patch = "7.19",
                              split = "lan",
                              after = "2011.01.01",
                              before = "2018.07.12",
                              duration = "0-100",
                              leagues = NULL,
                              tier = "1&2&3",
                              valve = "does-not-matter",
                              teams = "15",
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
  dota_result <- get_response(dota_api_category = "players", dota_api_subcategory = "records", args = args)

  #return
  dota_result

}
