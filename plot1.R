## Import data
library(sqldf)
fi<-file("household_power_consumption.txt")
ElectricPower<-sqldf("select * from fi where (date='1/2/2007' or date='2/2/2007') and Global_active_power!='?'",
                            file.format = list(header = TRUE, sep = ";"))
close(fi) 

## Draw plot 1 Frequency of Global Active Power
png(filename="plot1.png", 
    width=480, height=480, units="px")
hist(ElectricPower$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power(kilowatts)", col="red")
dev.off()