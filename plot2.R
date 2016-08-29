# file in your working directory
data <-read.csv("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y") 

## only be using data from the dates 2007-02-01 and 2007-02-02
scope <- subset(data, data$Date =="2007-02-01" | data$Date == "2007-02-02")

scope$Global_active_power <- as.numeric(scope$Global_active_power)


#########
# PLOT 2
#########

#date formatting
temp_date <- paste(scope$Date, scope$Time)
scope$x_date <- strptime(temp_date, "%Y-%m-%d %H:%M:%S")

plot(scope$x_date, scope$Global_active_power, type="l", ylab="Global active power (kilowatts)", xlab="")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
