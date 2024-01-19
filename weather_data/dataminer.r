#################################################################
############ DOWNLOAD WEATHER DATA FROM WEATHER UNDERGROUND #####
# AUTHOR: DEEPESH SINGH
# DATA: 12 APR 2017
# PURPOSE: TO DOWNLOAD WEAHTER INFORMATION AUTOMATICALLY
# METHOD DETAILS: R CODE WITH BACKEND API AND MANUAL
################################################################
 
# First we install the package written by Ram Narasimhan <ramnarasimhan@gmail.com>
 
install.packages("devtools", repos = "http://cran.us.r-project.org")
library("devtools")
install_github("Ram-N/weatherData")
library(weatherData)
 
# User input
StationID <- "FACT"
 
# Now we make a variable 'years' and store all the years for which we need weather info
 
years <- c(2010:2017)
 
# Now we need to find the station ID which you can find from above method
 
# Let's check if data is available for the given time period or not
 
data_flag <- checkDataAvailabilityForDateRange(StationID, "2010-01-01", "2017-03-31")
print(data_flag)
 
# Here data_flag = 0 means data is not available for given internal and 1 means data is available
 
# Now that we know we have data available for Cape Town from 2010-2017 we would like to download
 
# Before applying this function (getWeatherForYear) read more about the package
 
?getWeatherForYear
 
# If we make opt_detailed = T it will download all the columns and will take lot of time, hence manual
# method is faster. opt_detailed = F will give only few columns which we need 
 
 
# Let's create an empty data frame
getData <- data.frame()
 
for (year in years){
  tempData <- getWeatherForYear(StationID, year, opt_detailed = F) # NEVER MAKE OPT_DETAILED = T
  getData <- rbind(getData, tempData)
}
 
View(getData)
 
 
write.csv(getData,paste("WeatherData_",StationID,".csv", sep=""),row.names = F)
 
# Refrence
# https://cran.r-project.org/web/packages/weatherData/weatherData.pdf