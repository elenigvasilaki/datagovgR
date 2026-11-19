#' Download Data from data.gov.gr API
#'
#' The GET function for the request
#'
#' @param dataset dataset to grab data from e.g. mdg_emvolio for vaccination statistics
#' @param start_date starting date to grab data from
#' @param end_date ending date to grab data from
#' @param gov_token data.gov.gr token
#'
#' @importFrom attempt stop_if
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET
#' @importFrom httr add_headers
#' @importFrom httr content
#' @importFrom httr RETRY
#' @importFrom httr http_error
#' @importFrom httr http_status
#'
#' @return The result of the query in a dataframe format.
#'
#' @rdname gov_query
#'
#' @export
#'
#' @examples
#' \dontrun{
#' gov_query("mdg_emvolio","2022-07-04","2022-07-11")}
#'
gov_query <- function(dataset = NULL, start_date = NULL, end_date = NULL, gov_token = get_token()){

    # Check that token is set
    stop_if(gov_token, is.null,"Please set your DataGovGR API token with set_token(). You have to request an API token from https://www.data.gov.gr/token")


    # Check that dataset is set
    stop_if(dataset, is.null,"Please choose a proper data.gov.gr dataset")


    # Check for internet
    check_internet()

    # Create the get request; RETRY tries up to 3 times on failure
    res <- httr::RETRY("GET", build_query_url(dataset, start_date, end_date),
                       add_headers("Authorization" = gov_token),
                       ua,
                       times = 3,
                       pause_base = 1,
                       pause_cap = 60,
                       pause_min = 1,
                       terminate_on = c(400, 401, 403, 404))

    if(http_error(res)) stop("Error when calling the API: ", http_status(res)$message)

    # Get the content and return it as a data.frame
    return(jsonlite::fromJSON(httr::content(res, as = "text", encoding = "UTF-8")))
}

#' Build the query URL
#'
#' Internal helper: puts the dataset and optional dates into a valid URL.
#'
#' @noRd
build_query_url <- function(dataset, start_date = NULL, end_date = NULL){
    query <- list(date_from = start_date, date_to = end_date)
    query <- query[!vapply(query, is.null, logical(1))]
    url <- paste0(gov_url, "/query/", dataset)
    if (length(query) == 0) return(url)
    httr::modify_url(url, query = query)
}
