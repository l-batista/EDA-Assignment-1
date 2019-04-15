#Read Data
PowerData <- read.delim("household_power_consumption.txt",sep=";")


library(dplyr)


#Subset Data
PowerData1 <- subset(PowerData,PowerData$Date=="1/2/2007" | PowerData$Date =="2/2/2007")
PowerData1$Date <- as.Date(PowerData1$Date, "%d/%m/%y")
PowerData1$Time <- strptime(PowerData1$Time, "%H:%M:%S")

#plot 3

plot(PowerData1$Time,as.numeric(PowerData1$Global_active_power), 
     type = "n",
     #ylim = c(0,6),
     xlab = "", 
     ylab=" Energy")

with(PowerData1,lines(Time,as.numeric(Sub_metering_1)))
with(PowerData1,lines(Time,as.numeric(Sub_metering_2)),col="red")
with(PowerData1,lines(Time,as.numeric(Sub_metering_3),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))