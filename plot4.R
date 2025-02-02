unzip("exdata_data_household_power_consumption.zip")

# Load the power consumption data separated by ";" 
# Convert the "?" to NAs
power_consump <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Subset data to display data from 2007-02-01 to 2007-02-02
power_consump_feb <- subset(power_consump, Date == "1/2/2007" | Date == "2/2/2007")

# Convert Date variable from character to Date
power_consump_feb$Date <- as.POSIXct(strptime(paste(power_consump_feb$Date, power_consump_feb$Time), 
                                              "%d/%m/%Y %H:%M:%S"))

# Four charts with energy data
par(mfrow=c(2,2), mar=c(4, 4, 2.5, 1))

# Chart 1
plot(power_consump_feb$Date, power_consump_feb$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

# Chart 2
with(power_consump_feb, plot(Date, Voltage, type="l", xlab="datetime"))

# Chart 3
with(power_consump_feb, plot(Date, Sub_metering_1, ylab="Energy sub metering", xlab="", type="l"))
with(power_consump_feb, lines(Date, Sub_metering_2, col="red", lty=2))
with(power_consump_feb, lines(Date, Sub_metering_3, col="blue"))
legend("topright", col=c("black", "red", "blue"), legend=paste0("Sub_metering_", 1:3), lty=rep(1, 3), bty="n")

# Chart 4
with(power_consump_feb, plot(Date, Global_reactive_power, type="l", xlab="datetime"))

# Copy the plot to a png file
dev.copy(png, file="plot4.png", width=480, height=480)

# Close png device
dev.off()
