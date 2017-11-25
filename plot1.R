# loading data
electricPowerFullData <- read.csv2("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

# converting dates
electricPowerFullData$Date <- as.Date(electricPowerFullData$Date, format = "%d/%m/%Y")

# subsetting the data
electricPowerData <- subset(electricPowerFullData, Date == "2007-02-01" | Date == "2007-02-02")

# Converting to numeric format
electricPowerData$Global_active_power <- as.numeric(electricPowerData$Global_active_power)

# starting the png device and plotting 
png(filename = "plot1.png", height = 480, width = 480, bg = "white")

# histogram
hist(electricPowerData$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")

# turning off the device
dev.off()