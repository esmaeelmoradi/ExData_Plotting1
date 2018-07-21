#setwd("./...") do not forget to set up your work direction

#reading data
df <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE)
#get the data for 1/2/2017 and 2/2/2017
assignmentData <- df[df$Date %in% c("1/2/2007","2/2/2007"), ]


#getting data for this plot and plotting that into a png file
datetime <- strptime(paste(assignmentData$Date, assignmentData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(assignmentData$Sub_metering_1)
subMetering2 <- as.numeric(assignmentData$Sub_metering_2)
subMetering3 <- as.numeric(assignmentData$Sub_metering_3)
GlobalActivePower <- as.numeric(assignmentData$Global_active_power)
Voltage <- as.numeric(assignmentData$Voltage)
Golbal_reactive_Power <- as.numeric(assignmentData$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfcol = c(2,2), mgp = c(2,1,0), mar = c(3,3,2,1))

plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex.lab=0.6)

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="", cex.lab=0.6)
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty = "n", cex = 0.6)

plot(datetime, Voltage, type= "l", xlab = "datetime", ylab = "Voltage", cex.lab=0.6)

plot(datetime, Golbal_reactive_Power, type= "l", xlab = "datetime", ylab = "Golbal_reactive_Power", cex.lab=0.6)
dev.off()