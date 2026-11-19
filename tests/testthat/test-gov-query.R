test_that("gov_query() stops when no dataset is given", {
  expect_error(gov_query(gov_token = "token abc123"), "dataset")
})

test_that("gov_query() stops when the token is NULL", {
  expect_error(gov_query("mdg_emvolio", gov_token = NULL), "token")
})

test_that("gov_query() stops when no token has been set", {
  withr::local_options(datagovgR = NULL)
  expect_error(gov_query("mdg_emvolio"), "set_token")
})

# Live test against the real API: runs only when a token is available
# in the environment variable DATAGOVGR_TOKEN and the machine is online.
test_that("gov_query() returns vaccination data as a data frame", {
  skip_on_cran()
  skip_if_offline()
  token <- Sys.getenv("DATAGOVGR_TOKEN")
  skip_if(token == "", "DATAGOVGR_TOKEN not set")

  res <- gov_query("mdg_emvolio", "2022-07-04", "2022-07-11", gov_token = token)
  expect_s3_class(res, "data.frame")
  expect_gt(nrow(res), 0)
})
