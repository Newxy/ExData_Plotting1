## Import data
library(sqldf)
fi<-file("household_power_consumption.txt")
ElectricPower<-sqldf("select * from fi where date='1/2/2007' or date='2/2/2007'",
                            file.format = list(header = TRUE, sep = ";"))
ElectricPower[ElectricPower=="?"]=NA
close(fi) 

## Draw plot 4 
png(filename="plot4.png", 
    width=480, height=480, units="px")
par(mfrow=c(2,2))

plot(strptime(paste(ElectricPower$Date,ElectricPower$Time), format='%d/%m/%Y %H:%M:%S'), ElectricPower$Global_active_power, type="l",
     ylab="Global Active Power(kilowatts)", xlab='')


plot(strptime(paste(ElectricPower$Date,ElectricPower$Time), format='%d/%m/%Y %H:%M:%S'), ElectricPower$Voltage, type="l",
     ylab="Voltage", xlab='datetime')

plot(strptime(paste(ElectricPower$Date,ElectricPower$Time), format='%d/%m/%Y %H:%M:%S'), ElectricPower$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab='')
lines(strptime(paste(ElectricPower$Date,ElectricPower$Time), format='%d/%m/%Y %H:%M:%S'), ElectricPower$Sub_metering_2, type="l", col="red")
lines(strptime(paste(ElectricPower$Date,ElectricPower$Time), format='%d/%m/%Y %H:%M:%S'), ElectricPower$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),col=c("black", "red", "blue"))

plot(strptime(paste(ElectricPower$Date,ElectricPower$Time), format='%d/%m/%Y %H:%M:%S'), ElectricPower$Global_reactive_power, type="l",
     ylab="Global_reactive_power", xlab='datetime')

dev.off()