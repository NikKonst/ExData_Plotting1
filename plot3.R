# read data
df <- read.table("input/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# creating datetime column
datetimeFormat <- "%d/%m/%Y %H:%M:%S"
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- strptime(df$DateTime, datetimeFormat)

# subsetting
dfClr <- df[strptime("02/02/2007 23:59:59", datetimeFormat) >= df$DateTime
            & df$DateTime >= strptime("01/02/2007 00:00:00", datetimeFormat), ]

# grapchic device
png("plot3.png", width = 480, height = 480, units = "px")

# plotting
par(mfrow = c(1, 1))
plot(dfClr$DateTime, dfClr$Sub_metering_1, type = "n", xlab = NA, ylab = "Energy sub metering")
lines(dfClr$DateTime, dfClr$Sub_metering_1)
lines(dfClr$DateTime, dfClr$Sub_metering_2, col = "red")
lines(dfClr$DateTime, dfClr$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

# close device
dev.off()
