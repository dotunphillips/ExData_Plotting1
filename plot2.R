# Load the power consumption data separated by ";" 
# Convert the "?" to NAs
power_consump <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert Date variable from character to Date
power_consump$Date <- as.POSIXct(strptime(paste(power_consump$Date, power_consump$Time), "%d/%m/%Y %H:%M:%S"))

# Subset data to display data from 2007-02-01 to 2007-02-02
power_consump_feb <- subset(power_consump, Date >= "2007-02-01" & Date < "2007-02-03"  )

# A line chart plotting the Global Active Power 
plot(power_consump_feb$Date, power_consump_feb$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

# Copy the plot to a png file
dev.copy(png, file="plot2.png", width=480, height=480)

# Close png device
dev.off()

