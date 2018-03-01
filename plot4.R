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
png("plot4.png", width = 480, height = 480, units = "px")

# plotting
par(mfrow = c(2, 2))

# 1-st plot
plot(dfClr$DateTime, dfClr$Global_active_power, type = "n", xlab = NA, ylab = "Global Active Power")
lines(dfClr$DateTime, dfClr$Global_active_power)

# 2-nd plot
plot(dfClr$DateTime, dfClr$Voltage, type = "n", xlab = NA, ylab = "Voltage")
lines(dfClr$DateTime, dfClr$Voltage)

# 3-rd plot
plot(dfClr$DateTime, dfClr$Sub_metering_1, type = "n", xlab = NA, ylab = "Energy sub metering")
lines(dfClr$DateTime, dfClr$Sub_metering_1)
lines(dfClr$DateTime, dfClr$Sub_metering_2, col = "red")
lines(dfClr$DateTime, dfClr$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1,
        bty = "n")

# 4-th plot
plot(dfClr$DateTime, dfClr$Global_reactive_power, type = "n", xlab = NA, ylab = "Global Reactive Power")
lines(dfClr$DateTime, dfClr$Global_reactive_power)

# close device
dev.off()
