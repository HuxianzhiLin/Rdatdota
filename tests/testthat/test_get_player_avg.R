context("test get_player_avg is working")

test_that('function get player avg works properly', {

  #make sure url contains the right path
  expect_true(grepl('/players/performances',
                    get_player_avg()$url))

  #make sure response received i.e. api working
  expect_equal(get_player_avg()$response$status,
               200L)

  #make sure function returned a results list
  expect_true(is.list(get_player_avg()$content))

})
