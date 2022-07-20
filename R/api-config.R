#' Setting the token
#'
#' Function to set the default token for use with data.gov.gr API.
#'
#' @param token data.gov.gr API token
#'
#' @details
#' Using \code{set_token} allows you to set your API token once and it is then used for
#' all functions that access the API.
#' See https://www.data.gov.gr/token to get your API token.
#'
#' @return None
#'
#' @export
#'
#' @examples
#' set_token("token abcd12344321")
#'
set_token <- function(token){

    options<-getOption("datagovgR")
    options[["gov_token"]] <- token
    class(options) <- "datagovgr_api"
    options(datagovgR = options)
    invisible(NULL)
}

#' Getting the token
#'
#' Function to retrieve user token.
#'
#'
#' @details
#' Using \code{get_token} allows you to retrieve your API token.
#'
#' @return String.
#'
#' @export
#'
get_token <- function(){

    gov_token<-getOption("datagovgR")[["gov_token"]]
    if(is.null(gov_token)){
        stop("DataGovGR API token is missing. Please use set_token() to set it.")
    }
    return(gov_token)
}




