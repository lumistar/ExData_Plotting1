epc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";",
                  col.names = colnames(read.table(
                  "household_power_consumption.txt",
                  nrow = 1, header = T, sep = ";")))

par(mar = c(4, 4, 1, 1))
png(file = "plot1.png", bg = "transparent")
hist(epc$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()