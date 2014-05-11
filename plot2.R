epc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";",
                  col.names = colnames(read.table(
                          "household_power_consumption.txt",
                          nrow = 1, header = T, sep = ";")))

datetime <- strptime(paste(epc$Date, epc$Time), 
                     format = "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", bg = "transparent")
plot(datetime, epc$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts")
dev.off()