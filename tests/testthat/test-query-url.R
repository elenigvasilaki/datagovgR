test_that("URL with dataset only has no query string", {
  expect_equal(
    datagovgR:::build_query_url("mdg_emvolio"),
    "https://data.gov.gr/api/v1/query/mdg_emvolio"
  )
})

test_that("URL with both dates", {
  expect_equal(
    datagovgR:::build_query_url("mdg_emvolio", "2022-07-04", "2022-07-11"),
    "https://data.gov.gr/api/v1/query/mdg_emvolio?date_from=2022-07-04&date_to=2022-07-11"
  )
})

test_that("URL with start date only", {
  expect_equal(
    datagovgR:::build_query_url("mdg_emvolio", start_date = "2022-07-04"),
    "https://data.gov.gr/api/v1/query/mdg_emvolio?date_from=2022-07-04"
  )
})

test_that("URL with end date only starts its query string with '?'", {
  expect_equal(
    datagovgR:::build_query_url("mdg_emvolio", end_date = "2022-07-11"),
    "https://data.gov.gr/api/v1/query/mdg_emvolio?date_to=2022-07-11"
  )
})
