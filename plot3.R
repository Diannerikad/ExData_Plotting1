
#read dataset file
EPC <- read.table("household_power_consumption.txt", sep = ";", skip = 1)
#rename column names
names(EPC) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#subset was used to return vectors which meet conditions
subEPC <- subset(EPC, EPC$Date == "1/2/2007" |EPC$Date == "2/2/2007")

#plot3
datetime <- strptime(paste(subEPC$Date, subEPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub_metering_1 <- as.numeric(subEPC$Sub_metering_1)
sub_metering_2 <- as.numeric(subEPC$Sub_metering_2)
sub_metering_3 <- as.numeric(subEPC$Sub_metering_3)
active_power <- as.numeric(subEPC$Global_active_power)

png("plot3.png", width = 480, height = 480)

plot(datetime, sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = " ")
lines(datetime, sub_metering_2, type = "l", col ="red")
lines(datetime, sub_metering_3, type = "l", col ="blue")

legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

dev.off()
