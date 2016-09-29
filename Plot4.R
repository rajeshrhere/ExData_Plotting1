setwd("C:/GIT/datasharing/PowerConsumption")
pc <- read.csv("household_power_consumption.txt", sep = ";")
#head(pc)

pc$Global_active_power <-  as.numeric(pc$Global_active_power)
pc$Global_reactive_power <-  as.numeric(pc$Global_reactive_power)
pc$Voltage <-  as.numeric(pc$Voltage)
pc$Global_intensity <-  as.numeric(pc$Global_intensity)
pc$Sub_metering_1 <-  as.numeric(pc$Sub_metering_1)
pc$Sub_metering_2 <-  as.numeric(pc$Sub_metering_2)
pc$Sub_metering_3 <-  as.numeric(pc$Sub_metering_3)

pc$Date <- strptime(pc$Date, "%d/%m/%Y")
pc$Time <- strptime(pc$Time, "%H:%M:%S")
pc <- subset(pc, Date == strptime("01-02-2007", "%d-%m-%Y") | Date == strptime("02-02-2007", "%d-%m-%Y"))

par(mfrow = c(2, 2)) 

plot(pc$Time, pc$Global_active_power/1000, type = "l", xlab = "", ylab = "Global Active Power (k.watts)")
plot(pc$Time, pc$Voltage, type = "l", xlab = "", ylab = "Voltage");
plot(pc$Time, pc$Global_reactive_power, type = "l");
plot(pc$Time, pc$Sub_metering_1, type = "l", col = "blue", xlab = "", ylab = "Energy Sub Metering");
lines(pc$Time, pc$Sub_metering_2, type = "l", col = "red");
lines(pc$Time, pc$Sub_metering_3, type = "l", col = "orange");
plot(pc$Time, pc$Global_reactive_power/1000, type = "l", xlab = "", ylab = "Global Reactive Power (k.watts)")

dev.copy(png, "Plot4.png", width=480, height=480);
dev.off();
