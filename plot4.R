# loading data
electricPowerFullData <- read.csv2("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

#concatenating dates and time
dateTimeConcat <- as.POSIXct(paste(electricPowerFullData$Date, electricPowerFullData$Time), format = "%d/%m/%Y %H:%M:%S")

# binding columns
electricPowerFullData <- cbind(electricPowerFullData, dateTimeConcat)

# converting dates
electricPowerFullData$Date <- as.Date(electricPowerFullData$Date, format = "%d/%m/%Y")

# subsetting the data
electricPowerData <- subset(electricPowerFullData, Date == "2007-02-01" | Date == "2007-02-02")

# Converting to numeric format
electricPowerData$Global_active_power <- as.numeric(as.character(electricPowerData$Global_active_power))

electricPowerData$Sub_metering_1 <- as.numeric(as.character(electricPowerData$Sub_metering_1))
electricPowerData$Sub_metering_2 <- as.numeric(as.character(electricPowerData$Sub_metering_2))
electricPowerData$Sub_metering_3 <- as.numeric(as.character(electricPowerData$Sub_metering_3))

electricPowerData$Voltage <- as.numeric(as.character(electricPowerData$Voltage))
electricPowerData$Global_reactive_power <- as.numeric(as.character(electricPowerData$Global_reactive_power))

# starting the png device and plotting 
png(filename = "plot4.png", height = 480, width = 480, bg = "white")

# plots
par(mfcol= c(2,2))
plot(electricPowerData$dateTimeConcat, electricPowerData$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

plot(electricPowerData$dateTimeConcat, electricPowerData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
lines(electricPowerData$dateTimeConcat, electricPowerData$Sub_metering_2, col = "red")
lines(electricPowerData$dateTimeConcat, electricPowerData$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c ("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

plot(electricPowerData$dateTimeConcat, electricPowerData$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")
plot(electricPowerData$dateTimeConcat, electricPowerData$Global_reactive_power, ylab = "Golbal_Reactive_power", xlab = "datetime", type = "l")

# turning off the device
dev.off()