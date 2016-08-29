# file in your working directory
data <-read.csv("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y") 

## only be using data from the dates 2007-02-01 and 2007-02-02
scope <- subset(data, data$Date =="2007-02-01" | data$Date == "2007-02-02")

scope$Global_active_power <- as.numeric(scope$Global_active_power)


#########
# PLOT 3
#########

#date formatting
temp_date <- paste(scope$Date, scope$Time)
scope$x_date <- strptime(temp_date, "%Y-%m-%d %H:%M:%S")

plot(scope$x_date, scope$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")

lines(scope$x_date, scope$Sub_metering_2, col="red")
lines(scope$x_date, scope$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), lty=1:1)

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()