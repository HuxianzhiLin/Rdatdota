#' Dota Hero Players
#'
#' A list of the most frequent players of particular heroes.
#'
#' A list will be returned that contains three elements. The content, the url and the response
#' received from the api.
#'
#' The content element of the list contains a list includes hero, games, rank and players.
#'
#' \itemize{
#'   \item \strong{hero:} The serial number of the hero.
#'   \item \strong{games:} Number of use.
#'   \item \strong{rank:} Rank among users. Includes 1, 2 and 3.
#'   \item \strong{players:} A list contains players.
#'   \item \strong{steam ID:} The steam ID of the player.
#'   \item \strong{nickname:} The nickname of the player.
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
#' @return A dota_api object containing the elements described in the details.
#'
#' @examples
#' \dontrun{
#' get_heroes_players()
#' get_heroes_players(patch = "7.19", split = "lan", after = "2011.01.01", before = "2018.07.12",
#'                    duration = "0-100", leagues = NULL, tier = "1&2&3", valve = "does-not-matter")
#' }
#'
#' @export
get_hero_players <- function(patch = "7.19",
                       split = "lan",
                       after = "2011.01.01",
                       before = "2018.07.12",
                       duration = "0-100",
                       leagues = NULL,
                       tier = "1&2&3",
                       valve = "does-not-matter"
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

  #no unique query arguments for this particular function

  #result
  dota_result <- get_response(dota_api_category = "heroes", dota_api_subcategory = "frequent-players", args = args)

  #return
  dota_result

}
