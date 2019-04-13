#read dataset file
EPC <- read.table("household_power_consumption.txt", sep = ";", skip = 1)
#rename column names
names(EPC) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#subset was used to return vectors which meet conditions
subEPC <- subset(EPC, EPC$Date == "1/2/2007" |EPC$Date == "2/2/2007")

#plot 4

datetime <- strptime(paste(subEPC$Date, subEPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub_metering_1 <- as.numeric(subEPC$Sub_metering_1)
sub_metering_2 <- as.numeric(subEPC$Sub_metering_2)
sub_metering_3 <- as.numeric(subEPC$Sub_metering_3)
active_power <- as.numeric(subEPC$Global_active_power)
voltage <- as.numeric(subEPC$Voltage)
reactive_power <- as.numeric(subEPC$Global_reactive_power)

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(datetime,active_power,type="l",xlab="",ylab="Global Active Power") 

plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = " ")
lines(datetime, sub_metering_2, type = "l", col ="red")
lines(datetime, sub_metering_3, type = "l", col ="blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty =1, lwd = 2.5, col = c("black", "red", "blue"), bty = "o")


plot(datetime, reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
