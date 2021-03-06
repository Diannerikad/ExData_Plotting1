
#read dataset file
EPC <- read.table("household_power_consumption.txt", sep = ";", skip = 1)
#rename column names
names(EPC) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#subset was used to return vectors which meet conditions
subEPC <- subset(EPC, EPC$Date == "1/2/2007" |EPC$Date == "2/2/2007")

#plot1
png("plot1.png", width = 480, height = 480)
hist(as.numeric(subEPC$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
title(main = "Global Active Power")

dev.off()
