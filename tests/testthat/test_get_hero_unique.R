context("test get_player_unique is working")

test_that('function get player unique works properly', {

  #make sure url contains the right path
  expect_true(grepl('/players/unique-heroes',
                    get_player_unique()$url))

  #make sure response received i.e. api working
  expect_equal(get_player_unique()$response$status,
               200L)

  #make sure function returned a results list
  expect_true(is.list(get_player_unique()$content))

})
