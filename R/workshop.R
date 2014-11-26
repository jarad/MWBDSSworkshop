#'  A function that prepares the workshop.
#' 
#'  @param write_data string. Write these data sets.
#'  @param write_scripts string. write these data sets
#'  @param launch_index logical. If TRUE, launches the workshop html index.
#'  @details By default, the function uses the \code{\link{data}} function to load data sets and 
#'    then uses the \code{\link{write.csv}} function to write them to a file. 
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
workshop = function(write_data = 'all', 
                    write_scripts='all', 
                    launch_index=TRUE) {
  
  # Write data
  if (write_data == 'all') 
    write_data = c('GI','icd9','fluTrends')
  
  if ("GI" %in% write_data) {
    data('GI', package='ISDSWorkshop', envir=environment())
    write.csv(get('GI', envir = environment()), 
              file="GI.csv", row.names=FALSE)
  }
  
  if ("icd9" %in% write_data) {
    data('icd9', package='ISDSWorkshop', envir=environment())
    write.csv(get('icd9', envir = environment()), 
              file='icd9.csv', row.names=FALSE)
  }
  
  if ("fluTrends" %in% write_data) {
    data('fluTrends', package='ISDSWorkshop', envir=environment())
    write.csv(get('fluTrends', envir=environment()),
              file = 'fluTrends.csv', envir=environment())
  }
  
  # Write scripts
  if (write_scripts == 'all') 
    write_scripts = c("intro","graphics","advanced_graphics","biosurveillance")
  
  for (script in write_scripts) 
    file.copy(from = paste(find.package("ISDSWorkshop"), "/doc/", script, ".R", sep=""),
              to   = paste(script,".R", sep=""))
  
  # Launch workshop index
  if (launch_index) vignette('workshop')
}
