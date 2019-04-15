#Read Data
PowerData <- read.delim("household_power_consumption.txt",sep=";")


library(dplyr)


#Subset Data
PowerData1 <- subset(PowerData,PowerData$Date=="1/2/2007" | PowerData$Date =="2/2/2007")

#Plot 1


hist(as.numeric(PowerData1$Global_active_power),
     col = "red",
     main="Global Active Power",
     xlab = "Global Active Power (Kilowatts)")