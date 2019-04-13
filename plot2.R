#read dataset file
EPC <- read.table("household_power_consumption.txt", sep = ";", skip = 1)
#rename column names
names(EPC) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#subset was used to return vectors which meet conditions
subEPC <- subset(EPC, EPC$Date == "1/2/2007" |EPC$Date == "2/2/2007")

#plot2
Date <- as.Date(subEPC$Date, format("%d/%m/%Y"))
Time <- strptime(subEPC$Time, format = ("%H:%M:%S"))

datetime <- strptime(paste(subEPC$Date, subEPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
active_power <- as.numeric(subEPC$Global_active_power)

png("plot2.png", width = 480, height = 480 )
plot(datetime,active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)") 

dev.off()
