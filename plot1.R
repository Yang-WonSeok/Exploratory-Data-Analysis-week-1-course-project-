
## EDA week1 course project plot1

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

## plot1 

hist(febpower$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480 )
dev.off()
png(filename = "plot1.png", width = 480, height = 480)
