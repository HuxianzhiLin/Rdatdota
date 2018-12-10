context("test get_match is working")

test_that('function get match works properly', {

  #make sure url contains the right path
  expect_true(grepl('/matchfinder/classic',
                    get_match()$url))

  #make sure response received i.e. api working
  expect_equal(get_match()$response$status,
               200L)

  #make sure function returned a results list
  expect_true(is.list(get_match()$content))

})
