context("test get_player_records is working")

test_that('function get player records works properly', {

  #make sure url contains the right path
  expect_true(grepl('/players/records',
                    get_player_records()$url))

  #make sure response received i.e. api working
  expect_equal(get_player_records()$response$status,
               200L)

  #make sure function returned a results list
  expect_true(is.list(get_player_records()$content))

})
