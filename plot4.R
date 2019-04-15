#Read Data
PowerData <- read.delim("household_power_consumption.txt",sep=";")


library(dplyr)


#Subset Data
PowerData1 <- subset(PowerData,PowerData$Date=="1/2/2007" | PowerData$Date =="2/2/2007")
PowerData1$Date <- as.Date(PowerData1$Date, "%d/%m/%y")
PowerData1$Time <- strptime(PowerData1$Time, "%H:%M:%S")

#plot 4

par(mfrow=c(2,2))

plot(PowerData1$Time,as.numeric(PowerData1$Global_active_power), 
     type = "l", 
     xlab = "",
     ylab = "Global Active Power")

plot(PowerData1$Time,as.numeric(PowerData1$Voltage), 
     type = "l", 
     xlab = "datetime",
     ylab = "Voltage")

plot(PowerData1$Time,as.numeric(PowerData1$Sub_metering_1), 
     type = "n",
     xlab = "", 
     ylab=" Energy Sub Metering")

with(PowerData1,lines(Time,as.numeric(Sub_metering_1)))
with(PowerData1,lines(Time,as.numeric(Sub_metering_2)),col="red")
with(PowerData1,lines(Time,as.numeric(Sub_metering_3),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(PowerData1$Time,as.numeric(PowerData1$Global_reactive_power), 
     type = "l", 
     xlab = "datetime",
     ylab = "Global Reactive Power")