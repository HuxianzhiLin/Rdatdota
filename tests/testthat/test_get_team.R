context("test get_team is working")

test_that('function get team works properly', {

  #make sure url contains the right path
  expect_true(grepl('/teams/performances',
                    get_team()$url))

  #make sure response received i.e. api working
  expect_equal(get_team()$response$status,
               200L)

  #make sure function returned a results list
  expect_true(is.list(get_team()$content))

})
