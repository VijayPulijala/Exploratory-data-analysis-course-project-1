setwd("C:/Users/varshith608/Documents/R/Exploratory-data-analysis-course_Project")

data1 <- read.table("household_power_consumption.txt",sep=";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
data1 <- subset(data1, data1$Date %in% c("1/2/2007","2/2/2007"))

data1$Global_active_power <- as.numeric(data1$Global_active_power)
png("Plot_1.png", width = 480, height = 480)

hist(data1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power(Kilowats)", ylab = "Frequency", col = "red")

dev.off()