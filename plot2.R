hpc<-read.csv.sql("household_power_consumption.txt", 
                  sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', 
                  header = TRUE, sep = ";")
hpc$dt <- as.POSIXlt(strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S"))
png("plot2.png")
with(hpc,plot(dt, Global_active_power, type ="n", xlab = "", ylab = "Global Active Power(kilowatts)"))
with(hpc,lines(dt, Global_active_power))
dev.off()