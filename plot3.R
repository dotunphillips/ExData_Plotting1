# Load the power consumption data separated by ";" 
# Convert the "?" to NAs
power_consump <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert Date variable from character to Date
power_consump$Date <- as.POSIXct(strptime(paste(power_consump$Date, power_consump$Time), "%d/%m/%Y %H:%M:%S"))

# Subset data to display data from 2007-02-01 to 2007-02-02
power_consump_feb <- subset(power_consump, Date >= "2007-02-01" & Date < "2007-02-03"  )

# Line charts displaying the energy sub metering
with(power_consump_feb, plot(Date, Sub_metering_1, ylab="Energy sub metering", xlab="", type="l"))
  with(power_consump_feb, lines(Date, Sub_metering_2, col="red", lty=2))
  with(power_consump_feb, lines(Date, Sub_metering_3, col="blue"))
  legend("topright", col=c("black", "red", "blue"), legend=paste0("Sub_metering_", 1:3), lty=rep(1, 3))

# Copy the plot to a png file
dev.copy(png, file="plot3.png", width=480, height=480)
  
# Close png device
dev.off()
