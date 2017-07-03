dataFile <- ".//household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subsetting using date
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#variable for active power
globalActivePower <- as.numeric(subsetdata$Global_active_power)


#variable for the sub meters
submeter_1 <- as.numeric(subsetdata$Sub_metering_1)
submeter_2 <- as.numeric(subsetdata$Sub_metering_2)
submeter_3 <- as.numeric(subsetdata$Sub_metering_3)

#variable for voltage
voltage <- as.numeric(subsetdata$Voltage)

#variable for reactive power
reactive_power <- as.numeric(subsetdata$Global_reactive_power)

#convert to date
datetime <- strptime(paste(subsetdata$Date,subsetdata$Time,sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot4.png",width= 480, height = 480)

par(mfrow= c(2,2))

 #plot for global active power
plot(datetime,globalActivePower,type="l", ylab = "Global Active Power (kilowats)", xlab = "")

#plot for voltage
plot(datetime,voltage,type="l", ylab = "Voltage", xlab = "datetime")

#plot for submetering
plot(datetime, submeter_1,type="l", ylab = "Energy Sub metering", xlab = "")
lines(datetime, submeter_2,col= "red", type = "l")
lines(datetime, submeter_3,col= "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#plot for reactive power
plot(datetime,reactive_power,type="l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()