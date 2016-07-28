Plot4 <- read.table("household_power_consumption.txt",sep=";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
Plot4 <- subset(Plot4, Plot4$Date %in%  c("1/2/2007","2/2/2007"))


dayofweek <- strptime(paste(Plot4$Date, Plot4$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Plot4$Global_active_power<- as.numeric(Plot4$Global_active_power)
Plot4$Sub_metering_1 <- as.numeric(Plot4$Sub_metering_1)
Plot4$Sub_metering_2 <- as.numeric(Plot4$Sub_metering_2)
Plot4$Sub_metering_3 <- as.numeric(Plot4$Sub_metering_3)
Plot4$Voltage<- as.numeric(Plot4$Voltage)
Plot4$Global_reactive_power<- as.numeric(Plot4$Global_reactive_power)

png("Plot_4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1))
    
with (Plot4, 
      {
        plot(dayofweek,Global_active_power,type = "l", ylab = "Global Active Power" )
        plot(dayofweek,Voltage,type = "l", xlab = "datetime",ylab = "Voltage" )
        plot(dayofweek, Sub_metering_1, type = "l", ylab = "Energy Sub Metering")
           lines(dayofweek, Sub_metering_2,col = 'Red')
           lines(dayofweek, Sub_metering_3,col = 'Blue')
                legend("topright", col=c("black", "red", "blue"), 
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, lwd = 2)
        plot(dayofweek, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Energy sub metering")
                
        }
      )


dev.off()


