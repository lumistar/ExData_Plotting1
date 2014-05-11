epc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";",
                  col.names = colnames(read.table(
                          "household_power_consumption.txt",
                          nrow = 1, header = T, sep = ";")))

datetime <- strptime(paste(epc$Date, epc$Time), 
                     format = "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", bg = "transparent")
with(epc, plot(datetime, Sub_metering_1, xlab = "", 
               ylab = "Energy sub metering", type = "n"))
with(epc, points(datetime, Sub_metering_1, type = "l"))
with(epc, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(epc, points(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()