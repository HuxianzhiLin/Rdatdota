context("test get_heroes is working")

test_that('function get heroes works properly', {

  #make sure url contains the right path
  expect_true(grepl('/heroes/performances',
                    get_heroes()$url))

  #make sure response received i.e. api working
  expect_equal(get_heroes()$response$status,
               200L)

  #make sure function returned a results list
  expect_true(is.list(get_heroes()$content))

})
