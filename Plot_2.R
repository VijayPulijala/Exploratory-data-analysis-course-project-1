Plot2 <- read.table("household_power_consumption.txt",sep=";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
Plot2 <- subset(Plot2, Plot2$Date %in%  c("1/2/2007","2/2/2007"))

Plot2$Global_active_power <- as.numeric(Plot2$Global_active_power)

dayofweek <- strptime(paste(Plot2$Date, Plot2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("Plot_2.png", width = 480, height = 480)

plot(dayofweek,Plot2$Global_active_power,type = "l", ylab = "Global Active Power(kilowatts)")
dev.off()


