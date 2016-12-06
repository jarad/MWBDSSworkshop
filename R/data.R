#' Fictional syndromic surveillance data set
#' 
#' A data set containing fictitious patient data for gastrointestinal (GI)
#' visits to an emergency department (ER). 
#' 
#' @name GI
#' @docType data
#' @author Ian Painter 
#' \itemize{
#'   \item id. patient id
#'   \item date. date of visit to ER
#'   \item facility. facility id
#'   \item icd9. international statistical classificiation of diseases, ninth revision, code
#'   \item age. patient age
#'   \item zipcode. patient zip code
#'   \item chief_complain. free text chief complaint
#'   \item syndrome. syndromic surveillance code 
#' }
#' @keywords datasets
#' @usage data(GI)
#' @format A data frame with 21244 rows and 8 columns
NULL


#' ICD9 codes
#' 
#' A data set that contains the International Statistical Classification of Diseases 
#' and Related Health Problems (ICD-9) codes and their classification.
#' 
#' @name icd9
#' @docType data
#' @author Jarad Niemi 
#' \itemize{
#'   \item code_cutpoint The lower end of the range for the ICD9 code representing that classification.
#'   \item classification The ICD9 classification
#' }
#' @keywords datasets
#' @usage data(icd9)
#' @format A data frame with 19 rows and 2 columns
NULL


#' Google fluTrends
#' 
#' A data set containing google flu trends data (<http://www.google.org/flutrends/us/#US>) 
#' for the United States. 
#' Downloaded from <http://www.google.org/flutrends/us/data.txt> on 26 Nov
#' 2014.  
#' 
#' @name fluTrends
#' @docType data
#' @author Jarad Niemi 
#' \itemize{
#'   \item Date Date. The week of the observations
#' }
#' @details For each column, an index of the current influenza activity level
#' for that region. The index is based on google search engine queries.
#' @keywords datasets
#' @usage data(fluTrends)
#' @references Ginsberg, Jeremy, Matthew H. Mohebbi, Rajan S. Patel, Lynnette Brammer, Mark S. Smolinski, and Larry Brilliant. "Detecting influenza epidemics using search engine query data." Nature 457, no. 7232 (2008): 1012-1014.
#' @format A data frame with 583 rows and 160 columns
NULL
