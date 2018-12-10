context("test get_hero_players is working")

test_that('function get hero players works properly', {

  #make sure url contains the right path
  expect_true(grepl('/heroes/frequent-players',
                    get_hero_players()$url))

  #make sure response received i.e. api working
  expect_equal(get_hero_players()$response$status,
               200L)

  #make sure function returned a results list
  expect_true(is.list(get_hero_players()$content))

})
