dataFile <- ".//household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


globalActivePower <- as.numeric(subsetdata$Global_active_power)
datetime <- strptime(paste(subsetdata$Date,subsetdata$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot2.png",width= 480, height = 480)
plot(datetime,globalActivePower,type="l", ylab = "Global Active Power (kilowats)", xlab = "")
dev.off()