# Original data was filtered using Linux commands (It was considered more efficient):
# cat household_power_consumption.txt | grep '^[12]/2/2007' >> hpc.txt

# Load data
data <- read.csv("./data/hpc.txt", sep=";")
# Create a new column for date and time
data$DateTime <- strptime(paste(data$Date,data$Time),'%d/%m/%Y %T')

# Change device to PNG
png(file="plot2.png", units="px", width=480, height=480)
# Make the graphic
with(data, plot(DateTime,Global_active_power, ylab = "Global Active Power (kilowatts)", xlab=NA, type="l"))
# Close device
dev.off()