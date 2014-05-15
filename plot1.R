hpc<-read.csv.sql("household_power_consumption.txt", 
                  sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', 
                  header = TRUE, sep = ";")
png("plot1.png")
hist(hpc$Global_active_power, xlab = "Global Active Power(kilowatts)", col ="red", main="Global Active Power")
dev.off()

