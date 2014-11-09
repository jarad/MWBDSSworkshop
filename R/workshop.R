#'  A function that prepares the workshop.
#' 
#'  @param write_data logical. If TRUE, writes the GI data set to a csv file.
#'  @param clean logical. If TRUE, removes all objects created by the function from the R workspace.
#'  @param launch_index logical. If TRUE, launches the workshop html index.
#'  @seealso The function uses the \code{\link{data}} function to load the \code{\link{GI}} data set and 
#'    then uses the \code{\link{write.csv}} function to write it to a file. 
#'    It then launches the \code{\link{ISDSWorkshop}} html index 
#'    using the \code{\link{vignette}} function. 
#'  @author Jarad Niemi <\url{http://jarad.me}>
#'  @export
#'  @examples
#'  \dontrun{
#'  workshop()
#'  workshop(write_data = FALSE)
#'  workshop(clean = FALSE) 
#'  }
workshop = function(write_data = TRUE, clean = TRUE, launch_index=TRUE) {
  GI = NULL # To appease R CMD check
  
  if (write_data) {
    data(GI)
    write.csv(GI, file="GI.csv", row.names=FALSE)
    if (clean) rm(GI)
  }
  
  vignette('workshop')
}
