# Plot 3 from Peer-graded Assignment: Course Project 1
plot3 <- function (){
  #setwd("./Dropbox/Coursera/Exploratory Data Analysis/Peer-graded Assignment 1")
  consump_data <- read.table("household_power_consumption.txt", 
                             sep = ";", 
                             header = TRUE)
  names(consump_data) <- tolower(names(consump_data))
  library(lubridate)
  # convert from factor to Date // class = Date
  consump_data$date <- dmy(consump_data$date) 
  # convert from factor to numeric
  consump_data$sub_metering_1 <- as.numeric(paste(consump_data$sub_metering_1))
  consump_data$sub_metering_2 <- as.numeric(paste(consump_data$sub_metering_2))
  consump_data$sub_metering_3 <- as.numeric(paste(consump_data$sub_metering_3))
  
  library(dplyr)
  consump_data <- filter(consump_data, 
                         date == "2007-02-01"|date == "2007-02-02")
  
  # merge date and time
  consump_data$date_time <- paste(as.character(consump_data$date), as.character(consump_data$time), sep = "_")
  consump_data$date_time <- ymd_hms(consump_data$date_time)
  
  #rm("consump_data") # to remove from the workspace
  library(datasets)
  # open device - png file
  png("plot3.png", 
      width = 480, 
      height = 480)
  # create the plot
  plot(consump_data$date_time, consump_data$sub_metering_1, xlab = "",
         ylab = 'Energy sub metering', type = 'l')
  lines(consump_data$date_time, consump_data$sub_metering_2, type="l", col="red")
  lines(consump_data$date_time, consump_data$sub_metering_3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  
  dev.off()
}
