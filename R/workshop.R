#'  A function that prepares the workshop.
#' 
#'  @param write_data logical. If TRUE, writes the GI data set to a csv file.
#'  @param clean logical. If TRUE, removes all objects created by the function from the R workspace.
#'  @param launch_index logical. If TRUE, launches the workshop html index.
#'  @details The function uses the \code{\link{data}} function to load the \code{\link{GI}} data set and 
#'    then uses the \code{\link{write.csv}} function to write it to a file. 
#'    It then launches the \code{\link{ISDSWorkshop}} html index 
#'    using the \code{\link{vignette}} function. 
#'  @seealso \code{\link{data}},\code{\link{GI}},\code{\link{write.csv}},\code{\link{ISDSWorkshop}}
#'  @author Jarad Niemi <\url{http://jarad.me}>
#'  @export
#'  @examples
#'  \dontrun{
#'  workshop()
#'  workshop(write_data = FALSE)
#'  workshop(clean = FALSE) 
#'  }
workshop = function(write_data = TRUE, clean = TRUE, launch_index=TRUE) {
  if (write_data) {
    data('GI', package='ISDSWorkshop', envir=environment())
    write.csv(GI, file="GI.csv", row.names=FALSE)
    if (clean) rm('GI')
  }
  
  vignette('workshop')
}
