#Read Data
PowerData <- read.delim("household_power_consumption.txt",sep=";")


library(dplyr)


#Subset Data
PowerData1 <- subset(PowerData,PowerData$Date=="1/2/2007" | PowerData$Date =="2/2/2007")

PowerData1$Date <- as.Date(PowerData1$Date, "%d/%m/%y")
PowerData1$Time <- strptime(PowerData1$Time, "%H:%M:%S")

#Plot 2

plot(PowerData1$Time,as.numeric(PowerData1$Global_active_power), 
     type = "l", 
     xlab = "", 
     ylab=" Global Active Power (Kilowatts)",
     main = "Global Active Power vs. Time")
