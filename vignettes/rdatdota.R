## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo = FALSE, results='hide'---------------------------------------
setwd("C:/Users/lhxz/Documents/GitHub/Rdatdota/R")
temp = list.files(pattern="*.R")
lapply(temp, source)

## ----eval = TRUE---------------------------------------------------------
str(get_hero_players()$content[[1]][1])

## ----eval = TRUE---------------------------------------------------------
str(get_heroes()$content[[1]][1])

## ----eval = TRUE---------------------------------------------------------
str(get_match()$content[[1]][[1]][1])

## ------------------------------------------------------------------------
str(get_match_length()$content[[1]][[1]][1])
str(get_match_length()$content[[1]][[2]][1])
str(get_match_length()$content[[1]][[3]][1])
str(get_match_length()$content[[1]][4])
str(get_match_length()$content[[1]][5])
str(get_match_length()$content[[1]][6])


## ----eval = TRUE---------------------------------------------------------
str(get_player_avg()$content[[1]][[1]])

## ----eval = TRUE---------------------------------------------------------
str(get_player_records()$content[[1]]$kills[[1]])

## ----eval = TRUE---------------------------------------------------------
str(get_player_single()$content[[1]][[1]])

## ----eval = TRUE---------------------------------------------------------
str(get_player_unique()$content[[1]][[1]])

## ----eval = TRUE---------------------------------------------------------
str(get_team()$content[[1]][[1]])

