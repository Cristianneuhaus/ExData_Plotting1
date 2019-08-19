# Plot 4 from Peer-graded Assignment: Course Project 1
plot4 <- function (){
  #setwd("./Dropbox/Coursera/Exploratory Data Analysis/Peer-graded Assignment 1")
  consump_data <- read.table("household_power_consumption.txt", 
                             sep = ";", 
                             header = TRUE)
  names(consump_data) <- tolower(names(consump_data))
  library(lubridate)
  # convert from factor to Date // class = Date
  consump_data$date <- dmy(consump_data$date) 
  # convert from factor to numeric
  consump_data$voltage <- as.numeric(paste(consump_data$voltage))
  consump_data$sub_metering_1 <- as.numeric(paste(consump_data$sub_metering_1))
  consump_data$sub_metering_2 <- as.numeric(paste(consump_data$sub_metering_2))
  consump_data$sub_metering_3 <- as.numeric(paste(consump_data$sub_metering_3))
  consump_data$global_active_power <- as.numeric(paste(consump_data$global_active_power))
  consump_data$global_reactive_power <- as.numeric(paste(consump_data$global_reactive_power))
  
  library(dplyr)
  consump_data <- filter(consump_data, 
                         date == "2007-02-01"|date == "2007-02-02")
  
  # merge date and time
  consump_data$date_time <- paste(as.character(consump_data$date), as.character(consump_data$time), sep = "_")
  consump_data$date_time <- ymd_hms(consump_data$date_time)
  
  #rm("consump_data") # to remove from the workspace
  library(datasets)
  # open device - png file
  png("plot4.png", 
      width = 480, 
      height = 480)
  par(mfrow = c(2,2))
  
  # create the plot
  plot(consump_data$date_time, consump_data$global_active_power, 
       type = "l", 
       ylim = c(0,6), 
       ylab = "Global Active Power", 
       xlab = "")
  
  plot(consump_data$date_time, consump_data$voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(consump_data$date_time, consump_data$sub_metering_1, xlab = "",
       ylab = 'Energy sub metering', type = 'l')
  lines(consump_data$date_time, consump_data$sub_metering_2, type="l", col="red")
  lines(consump_data$date_time, consump_data$sub_metering_3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  
  plot(consump_data$date_time, consump_data$global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.off()
}
