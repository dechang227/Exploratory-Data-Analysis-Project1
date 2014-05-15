hpc<-read.csv.sql("household_power_consumption.txt", 
                  sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', 
                  header = TRUE, sep = ";")
hpc$dt <- as.POSIXlt(strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S"))

png("plot3.png")
with(hpc,plot(dt, Sub_metering_1, type ="n", ylab = "Energy sub metering", xlab = ""))
with(hpc,lines(dt, Sub_metering_1, col = "black"))
with(hpc,lines(dt, Sub_metering_2, col = "red"))
with(hpc,lines(dt, Sub_metering_3, col = "blue"))
legend("topright", lty = c(1, 1, 1), col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()