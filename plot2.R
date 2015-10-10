## Import data
library(sqldf)
fi<-file("household_power_consumption.txt")
ElectricPower<-sqldf("select * from fi where (date='1/2/2007' or date='2/2/2007') and Global_active_power!='?'",
                            file.format = list(header = TRUE, sep = ";"))
close(fi) 

## Draw plot 2 time vs global active power
png(filename="plot2.png", 
    width=480, height=480, units="px")
plot(strptime(paste(ElectricPower$Date,ElectricPower$Time), format='%d/%m/%Y %H:%M:%S'), ElectricPower$Global_active_power, type="l",
     ylab="Global Active Power(kilowatts)", xlab='')
dev.off()