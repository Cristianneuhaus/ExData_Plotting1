# Plot 2 from Peer-graded Assignment: Course Project 1
plot2 <- function (){
  #setwd("./Dropbox/Coursera/Exploratory Data Analysis/Peer-graded Assignment 1")
  consump_data <- read.table("household_power_consumption.txt", 
                             sep = ";", 
                             header = TRUE)
  names(consump_data) <- tolower(names(consump_data))
  library(lubridate)
  # convert from factor to Date // class = Date
  consump_data$date <- dmy(consump_data$date) 
  # convert from factor to numeric
  consump_data$global_active_power <- as.numeric(paste(consump_data$global_active_power))
  
  library(dplyr)
  consump_data <- filter(consump_data, 
      date == "2007-02-01"|date == "2007-02-02")
  
  # merge date and time
  consump_data$date_time <- paste(as.character(consump_data$date), as.character(consump_data$time), sep = "_")
  consump_data$date_time <- ymd_hms(consump_data$date_time)
  
  #rm("consump_data") # to remove from the workspace
  library(datasets)
  # open device - png file
  png("plot2.png", 
      width = 480, 
      height = 480)
  # create the plot
  plot(consump_data$date_time, consump_data$global_active_power, 
       type = "l", 
       ylim = c(0,6), 
       ylab = "Global Active Power (kilowatts)", 
       xlab = "")
  
  dev.off() # close png file
}