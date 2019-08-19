# Plot 1 from Peer-graded Assignment: Course Project 1
plot1 <- function (){
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
  
  #rm("consump_data") # to remove from the workspace
  library(datasets)
  # open device - png file
  png("plot1.png", 
      width = 480, 
      height = 480)
  # create the plot
  hist(consump_data$global_active_power, 
       main = "Global Active Power",
       col = "red", 
       xlab = "Global Active Power (kilowatts)",
       ylim = c(0,1200))
  dev.off() # close png file
}