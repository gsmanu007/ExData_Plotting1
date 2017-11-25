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
electricPowerData$Global_active_power <- as.numeric(electricPowerData$Global_active_power)

# starting the png device and plotting 
png(filename = "plot2.png", height = 480, width = 480, bg = "white")

# plotting
plot(electricPowerData$dateTimeConcat, electricPowerData$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

# turning off the device
dev.off()