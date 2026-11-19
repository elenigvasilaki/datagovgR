test_that("set_token() stores the token and get_token() returns it", {
  withr::local_options(datagovgR = NULL)
  set_token("token abc123")
  expect_equal(get_token(), "token abc123")
})

test_that("set_token() overwrites an earlier token", {
  withr::local_options(datagovgR = NULL)
  set_token("token old")
  set_token("token new")
  expect_equal(get_token(), "token new")
})

test_that("get_token() gives a clear error when no token is set", {
  withr::local_options(datagovgR = NULL)
  expect_error(get_token(), "set_token")
})
