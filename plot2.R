library(dplyr)
library(lubridate)

data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE)
as.Date(data$Date, "%d/%m/%Y") -> data$Date
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
paste(data$Date,data$Time,sep = " ") -> data$Time
strptime(data$Time, format = "%Y-%m-%d %H:%M:%S") -> data$Time
data$Date <- NULL
colnames(data)[1] <- "DateTime"
as.numeric(data$Global_active_power) -> data$Global_active_power
as.numeric(data$Global_reactive_power) -> data$Global_reactive_power
as.numeric(data$Voltage) -> data$Voltage
as.numeric(data$Global_intensity) -> data$Global_intensity
as.numeric(data$Sub_metering_1) -> data$Sub_metering_1
as.numeric(data$Sub_metering_2) -> data$Sub_metering_2
as.numeric(data$Sub_metering_3) -> data$Sub_metering_3

png(file = "plot2.png")
plot(data$DateTime,data$Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)"
     ,xlab = "")
dev.off()