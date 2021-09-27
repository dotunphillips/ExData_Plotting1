# unzip the household power consumption data
unzip("exdata_data_household_power_consumption.zip")

# Load the power consumption data separated by ";" 
# Convert the "?" to NAs
power_consump <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Subset data to display data from 2007-02-01 to 2007-02-02
power_consump_feb <- subset(power_consump, Date == "1/2/2007" | Date == "2/2/2007")

# Convert Date variable from character to Date
power_consump_feb$Date <- as.POSIXct(strptime(paste(power_consump_feb$Date, power_consump_feb$Time), 
                                              "%d/%m/%Y %H:%M:%S"))

# A histogram in red of the Global Active Power data 
par(mfrow=c(1, 1), mar=c(4.5, 4.5, 2, 1))
hist(power_consump_feb$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", 
     main="Global Active Power")

# Copy the plot to a png file
dev.copy(png, file="plot1.png", width=480, height=480)

# Close png device
dev.off()
