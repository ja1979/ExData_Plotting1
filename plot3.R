# Original data was filtered using Linux commands (It was considered more efficient):
# cat household_power_consumption.txt | grep '^[12]/2/2007' >> hpc.txt

# Load data
data <- read.csv("./data/hpc.txt", sep=";")
# Create a new column for date and time
data$DateTime <- strptime(paste(data$Date,data$Time),'%d/%m/%Y %T')

# Change device to PNG
png(file="plot3.png", units="px", width=480, height=480)
# Make the graphic
with(data, plot(DateTime,Sub_metering_1, type="l", ylab=NA, xlab=NA))
with(data, lines(DateTime,Sub_metering_2, col = "red"))
with(data, lines(DateTime,Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1,1))
title(ylab = "Energy sub metering")
# Close device
dev.off()