# Original data was filtered using Linux commands (It was considered more efficient):
# cat household_power_consumption.txt | grep '^[12]/2/2007' >> hpc.txt

# Load data
data <- read.csv("./data/hpc.txt", sep=";")
# Create a new column for date and time
data$DateTime <- strptime(paste(data$Date,data$Time),'%d/%m/%Y %T')

# Change device to PNG
png(file="plot4.png", units="px", width=480, height=480)
# Arrange multiple graphics
par(mfrow=c(2,2), mar=c(4,4,3,1), ps=14)
# Make the graphic
# 1
with(data, plot(DateTime,Global_active_power, type="l", ylab = "Global Active Power", xlab = NA))
# 2
with(data, plot(DateTime,Voltage, type="l", ylab = "Voltage", xlab = "datetime"))
# 3
with(data, plot(DateTime,Sub_metering_1, type="l", ylab=NA, xlab=NA))
with(data, lines(DateTime,Sub_metering_2, col = "red"))
with(data, lines(DateTime,Sub_metering_3, col = "blue"))
#legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1,1), bty = "n", x.intersp = -3.5, y.intersp = 0.3, adj = -1.3)
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1,1), bty = "n")
title(ylab = "Energy sub metering")
# 4
with(data, plot(DateTime,Global_reactive_power, type="l", xlab = "datetime"))
# Close device
dev.off()