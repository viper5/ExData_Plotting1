# file in your working directory
data <-read.csv("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y") 

## only be using data from the dates 2007-02-01 and 2007-02-02
scope <- subset(data, data$Date =="2007-02-01" | data$Date == "2007-02-02")

scope$Global_active_power <- as.numeric(scope$Global_active_power)


#########
# PLOT 1
#########

with(scope, hist(Global_active_power, main = "Global active power", xlab="Global active power (kilowatts)", col="red"))

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off() 
