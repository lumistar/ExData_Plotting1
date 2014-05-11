epc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";",
                  col.names = colnames(read.table(
                          "household_power_consumption.txt",
                          nrow = 1, header = T, sep = ";")))

datetime <- strptime(paste(epc$Date, epc$Time), 
                     format = "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", bg = "transparent")
par(mfcol = c(2, 2), mar = c(4, 4, 1, 1), oma = c(0, 0, 0, 0))
with(epc, plot(datetime, Global_active_power, type = "l", xlab = "", 
          ylab = "Global Active Power (kilowatts)"))    
with(epc, plot(datetime, Sub_metering_1, xlab = "", 
          ylab = "Energy sub metering", type = "n"))     
with(epc, points(datetime, Sub_metering_1, type = "l"))     
with(epc, points(datetime, Sub_metering_2, type = "l", col = "red"))     
with(epc, points(datetime, Sub_metering_3, type = "l", col = "blue"))     
with(epc, legend("topright", bty = "n", lty = c(1, 1, 1), col = c("black", "red", "blue"),
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))     
with(epc, plot(datetime, Voltage, type = "l"))
with(epc, plot(datetime, Global_reactive_power, type = "l"))
dev.off()