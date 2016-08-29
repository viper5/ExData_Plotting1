# file in your working directory
data <-read.csv("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y") 

## only be using data from the dates 2007-02-01 and 2007-02-02
scope <- subset(data, data$Date =="2007-02-01" | data$Date == "2007-02-02")

scope$Global_active_power <- as.numeric(scope$Global_active_power)


#########
# PLOT 4
#########

#date formatting
temp_date <- paste(scope$Date, scope$Time)
scope$x_date <- strptime(temp_date, "%Y-%m-%d %H:%M:%S")

# dividing screen to four slots
par(mfrow=c(2,2))

# first plot
plot(scope$x_date, scope$Global_active_power, type="l", ylab="Global active power", xlab="")

# second plot
plot(scope$x_date, scope$Voltage, type="l", ylab="Voltage", xlab="datetime")

#third plot
plot(scope$x_date, scope$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(scope$x_date, scope$Sub_metering_2, col="red")
lines(scope$x_date, scope$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), lty=1:1, bty = "n", x.intersp=2)

#fourth plot
plot(scope$x_date, scope$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")


dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()