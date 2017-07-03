dataFile <- ".//household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(subsetdata$Global_active_power)

submeter_1 <- as.numeric(subsetdata$Sub_metering_1)
submeter_2 <- as.numeric(subsetdata$Sub_metering_2)
submeter_3 <- as.numeric(subsetdata$Sub_metering_3)

datetime <- strptime(paste(subsetdata$Date,subsetdata$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot3.png",width= 480, height = 480)
plot(datetime, submeter_1,type="l", ylab = "Energy Sub metering", xlab = "")
lines(datetime, submeter_2,col= "red", type = "l")
lines(datetime, submeter_3,col= "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()