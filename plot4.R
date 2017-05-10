
## EDA week1 course project plot 4 

power <- read.table("household_power_consumption.txt", header = T , sep=";")
head(power)
febpower <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")
head(febpower)

class(febpower$Global_active_power)
febpower$Global_active_power <- as.numeric(as.character(febpower$Global_active_power))
febpower$Global_reactive_power <- as.numeric(as.character(febpower$Global_reactive_power))
febpower$Voltage <- as.numeric(as.character(febpower$Voltage))
febpower$Sub_metering_1 <- as.numeric(as.character(febpower$Sub_metering_1))
febpower$Sub_metering_2 <- as.numeric(as.character(febpower$Sub_metering_2))
febpower$Sub_metering_3 <- as.numeric(as.character(febpower$Sub_metering_3))
class(febpower$Global_active_power)

library(dplyr)
library(lubridate)

febpower <- mutate(febpower, time = paste(Date, Time), time = dmy_hms(time))%>%
  select(-Date, -Time)

head(febpower)

## plot 4 

par(mfrow = c(2,2))

plot(febpower$time, febpower$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power(kilowatts)")

plot(febpower$time, febpower$Voltage, type = "l", xlab ="datetime", ylab = "Voltage")

plot(febpower$time, febpower$Sub_metering_1, type ="l", xlab = "", ylab ="Energy sub metering")
lines(febpower$time, febpower$Sub_metering_2, col = "red")
lines(febpower$time, febpower$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1)

plot(febpower$time, febpower$Global_reactive_power, type ="l", xlab = "datetime", ylab = "Global_reactive_power")

png(filename = "plot4.png", width = 480, height = 480 )