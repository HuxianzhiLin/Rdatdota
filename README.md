
<!-- README.md is generated from README.Rmd. Please edit that file -->
RDota2
======

#### Released Version

[Github](https://github.com/QMSS-G5072-2018/Huxianzhi_Lin/blob/master/final%20project/Rdatdota)

#### Description

This is an R datdota API client specifically designed for Valve's game Dota2.

Responsible Use
---------------

Rdatdota should be used in strict accordance with datdota's [Terms of service and Privacy Policy](http://datdota.com/about)

Installation
------------

To install the development version you need to have the `devtools` package installed. To install devtools type in your console: `install.packages('devtools')`.

Then to install Rdatdota run the following on your console:

``` r
devtools::install_github('QMSS-G5072-2018/Huxianzhi_Lin/tree/master/final%20project/Rdatdota')
```

#### Core Function

You do not need to use the function `core` and `para_trans`directly. The `core` function is the engine of the request functions. The function is used to fetch the response content inside the API functions. The `para_trans` function is used to transform the parameters so that the get family functions will have more resonable arguments.

Usage
-----

The typical workflow of Rdatdota would include using the get\_\* family functions to access the API. You don't need any keys for the dat dota API. Here is an example:

``` r
match <-get_match(patch = "7.19", split = "lan", after = "2011.01.01", before = "2018.07.12", 
                  duration = "0-100", leagues = NULL, tier = "1&2&3", valve = "does-not-matter", 
                  teams_a = "15", teams_b = "2586976", heroes_a = "25", heroes_b = "20")

match$content$data$matches[[1]]
```

    #> $`matchId`
    #> [1] 4061671194
    #> 
    #> $radTeamId
    #> [1] 2586976
    #> 
    #> $direTeamId
    #> [1] 15
    #> 
    #> $radPicks
    #> $radPicks[[1]]
    #> [1] 20
    #> 
    #> $radPicks[[2]]
    #> [1] 37
    #> 
    #> $radPicks[[3]]
    #> [1] 63
    #> 
    #> $radPicks[[4]]
    #> [1] 101
    #> 
    #> $radPicks[[5]]
    #> [1] 114
    #> 
    #> 
    #> $direPicks
    #> $direPicks[[1]]
    #> [1] 25
    #> 
    #> $direPicks[[2]]
    #> [1] 26
    #> 
    #> $direPicks[[3]]
    #> [1] 42
    #> 
    #> $direPicks[[4]]
    #> [1] 72
    #> 
    #> $direPicks[[5]]
    #> [1] 91
    #> 
    #> 
    #> $radVictory
    #> [1] FALSE
    #> 
    #> $date
    #> [1] 1.534349e+12
    #> 
    #> $leagueId
    #> [1] 9870
    #> 
    #> $leagueName
    #> [1] "The International 2018"
    #> 
    #> $radName
    #> [1] "OG"
    #> 
    #> $direName
    #> [1] "PSG.LGD"
    #> 
    #> $rad
    #> NULL
    #> 
    #> $dire
    #> NULL
    #> 
    #> $radIsA
    #> [1] FALSE
    #> 
    #> $duration
    #> [1] 1735

``` r
match$url
```

    #> [1] "http://datdota.com/api/matchfinder/classic"  

``` r
match$response
```

    #> Response [http://datdota.com/api/matchfinder/classic?tier=1&tier=2&tier=3&after=01%2F01%2F2011&before=07%2F12%2F2018&duration=0%3B100&patch=7.19&split-type=lan&valve-event=does-not-matter&teams-a=15&teams-b=2586976&heroes-a=25]
    #>   Date: 2018-12-09 16:32
    #>   Status: 200
    #>   Content-Type: application/json;charset=utf-8
    #>   Size: 40.8 kB

Each function returns a named list with the following elements:

-   "content" a list of the content receved from the API
-   "url" the url used to fetch data
-   "response" The API response information

Links
-----

To read the tutorial and documentation for RDota2 please visit [Rdatdota](https://cran.r-project.org/web/packages/RDota2/vignettes/RDota2.html).

To find out about the Steam API Documentation you can visit [Steam](https://steamcommunity.com/linkfilter/?url=http://wiki.teamfortress.com/wiki/WebAPI).

To check the data on the website you can visit [datdota](www.datdota.com)

To see the released version you can visit [Github](https://github.com/QMSS-G5072-2018/Huxianzhi_Lin/tree/master/final%20project/Rdatdota).
