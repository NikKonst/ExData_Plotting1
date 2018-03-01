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
png("plot1.png", width = 480, height = 480, units = "px")

# plotting
par(mfrow = c(1, 1))
hist(dfClr$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# close device
dev.off()
