#' The engine of the request functions
#'
#' The function used to fetch the response content inside the the API functions.
#'
#' This function is of no particular use to the user, but might be useful for anyone who
#' would like to dive deeper into the package development. This function is used to GET the
#' response's content from Steam's API. The function is the core function of the rest of
#' the get_* family functions.
#'
#' @param dota_api_category One of heroes, players, teams, matchfinder, match-durations
#'
#' @param dota_api_subcategory Child entry of category
#'
#' @param args The query arguments for GET.
#'
#' @examples
#' \dontrun{
#' get_response("heroes","performances", args = list(patch = "7.20"))
#' }
#'
#' @return A response to be used in the rest of the get_* family functions.
#'
#' @export
get_response <- function(dota_api_category, dota_api_subcategory, args) {


  #make sure dota_api_category exists
  if (!as.character(dota_api_category) %in% c("heroes", "players", "teams", "matchfinder", "match-durations")) {
    stop('dota_api_category wrong')
  }


  #craft request url
 if (is.null(dota_api_subcategory) == TRUE) {
     request_url <-sprintf('http://datdota.com/api/%s',
                          dota_api_category)
    }else if (is.null(dota_api_subcategory) == FALSE) {
     request_url <-sprintf('http://datdota.com/api/%s/%s',
                            dota_api_category,
                            dota_api_subcategory)
    }

  #get response
  resp <- httr::GET(request_url,
                    query = args
                    )

  #get url
  url <- strsplit(resp$url, '\\?')[[1]][1]

  #check for code status. Any http errors will be converted to something meaningful.
  httr::stop_for_status(resp)

  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  #response
  content <- jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)

  #output
  structure(
    list(
      content = content,
      url = url,
      response = resp
    ),
    class = "dota_api"
  )

}
