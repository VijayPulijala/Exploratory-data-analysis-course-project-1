Plot3 <- read.table("household_power_consumption.txt",sep=";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
Plot3 <- subset(Plot3, Plot3$Date %in%  c("1/2/2007","2/2/2007"))

Plot3$Sub_metering_1 <- as.numeric(Plot3$Sub_metering_1)
Plot3$Sub_metering_2 <- as.numeric(Plot3$Sub_metering_2)
Plot3$Sub_metering_3 <- as.numeric(Plot3$Sub_metering_3)

dayofweek <- strptime(paste(Plot3$Date, Plot3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("Plot_3.png", width = 480, height = 480)

with (Plot3, 
      {
        plot(dayofweek, Sub_metering_1, type = "l", ylab = "Energy Sub Metering")
        lines(dayofweek, Sub_metering_2,col = 'Red')
        lines(dayofweek, Sub_metering_3,col = 'Blue')
        }
      )


legend("topright", col=c("black", "red", "blue"), 
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, lwd = 2)


dev.off()


