context("test get_match_length is working")

test_that('function get match length works properly', {

  #make sure url contains the right path
  expect_true(grepl('/match-durations',
                    get_match_length()$url))

  #make sure response received i.e. api working
  expect_equal(get_match_length()$response$status,
               200L)

  #make sure function returned a results list
  expect_true(is.list(get_match_length()$content))

})
