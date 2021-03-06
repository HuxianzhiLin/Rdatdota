% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_heroes.R
\name{get_heroes}
\alias{get_heroes}
\title{Dota Heroes}
\usage{
get_heroes(patch = "7.19", split = "lan", after = "2011.01.01",
  before = "2018.07.12", duration = "0-100", leagues = NULL,
  tier = "1&2&3", valve = "does-not-matter", threshold = "1",
  players = NULL, teams = NULL, heroes = NULL, roles = NULL)
}
\arguments{
\item{patch}{Which patches are you interested in? From 6.74 to 7.20. (Connected by "&")}

\item{split}{What type of event was it? Choose from "online", "lan" or "post-event".}

\item{after}{The beginning date of the match}

\item{before}{The last day of the period to search}

\item{duration}{The time the game lasts (measured in minutes)}

\item{leagues}{What league is it in? Check the serial number of the league on www.datdota.com.}

\item{tier}{What tier of event is this? 1 = Premium; 2 = Professional; 3 = Semi-pro; (Connected by "&")}

\item{valve}{Is this a Valve event? Choose from "yes", "no" or "does-not-matter".}

\item{threshold}{The min game count.}

\item{players}{Players to search for. Check the serial number of the players on www.datdota.com. (Connected by "&". Can be null.)}

\item{teams}{Teams to serch for. Check the serial number of the players on www.datdota.com. (Connected by "&". Can be null.)}

\item{heroes}{Heroes picked. Check the serial number of the heroes on www.datdota.com. (Connected by "&". Can be null.)}

\item{roles}{What role was it played? Choose from "core" or "support". (Connected by "&". Can be null.)}
}
\value{
A dota_api object containing the elements described in the details.
}
\description{
A list of Dota2 Heroes.
}
\details{
A list will be returned that contains three elements. The content, the url and the response
received from the api.

The content element of the list contains a data.frame with the information of the heroes. Each row of the
list is a hero and the following columns are included: Total Count, Wins, Losses, Winrate, As Radient, As Dire,
Kills, Deaths, Assists, KDA, Avg.KAL, GPM, XPM, Last Hits, Denies, LVL, HD, TD, HH, GS

\itemize{
  \item \strong{total:} Times of pick.
  \item \strong{wins:} Wins.
  \item \strong{losses:} Losses.
  \item \strong{total:} Total games.
  \item \strong{winrate:} Winrate.
  \item \strong{gamesRadient:} Times that the player is in Radient team.
  \item \strong{gamesDire:} Times that the player is in Dire team.
  \item \strong{kills:} Average times of kill.
  \item \strong{deaths:} Average times of Death.
  \item \strong{assists:} Average times of Assistance.
  \item \strong{kda:} Average (Kills + Assists)/Deaths.
  \item \strong{avgKAL:} Undocumented.
  \item \strong{gpm:} Average gold per minute.
  \item \strong{xpm:} Average EXP per minute.
  \item \strong{lastHits:} Average times of last hit.
  \item \strong{denies:} Average times of deny.
  \item \strong{level:} Average level.
  \item \strong{heroDamage:} Average hero damage.
  \item \strong{towerDamage:} Average tower damage.
  \item \strong{heroHealing:} Average hero heal.
  \item \strong{goldSpent:} Average gold spent.
}
}
\examples{
\dontrun{
get_heroes()
get_heroes(patch = "7.19&7.20", split = "lan&online", after = "2011.01.01", before = "2018.10.12",
                    duration = "0-200", leagues = NULL, tier = "1&2", valve = "does-not-matter",
                    threshold = "1", teams = "15&726228", heroes = "41&75")
}

}
