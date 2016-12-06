#' A function that installs all supplementary packages for the workshop.
#'
#' @details This function installs all additional packages that are used
#' throughout the workshop, but are not absolutely necessary for the workshop.
#' @seealso \code{\link{ISDSWorkshop}}
#' @author Jarad Niemi <\url{http://jarad.me}>
#' @export
#' @examples
#' \dontrun{
#' install_additional_packages()
#' }
install_additonal_packages = function() {
  package_list <- c("MWMRweek",
                    "xtable",
                    "maps","maptools","mapproj",
                    "gridExtra","RColorBrewer",
                    "SpatialEpi")
  
  for (i in seq_along(package_list)) 
    p <- package_list[i]
    if (!require(p)) {
      install.packages(p)
    } else {
      warning(paste0("Package '",p,"'could not be installed."))
    }
}
