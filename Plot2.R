#setwd("./...") do not forget to set up your work direction

#reading data
df <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE)
#get the data for 1/2/2017 and 2/2/2017
assignmentData <- df[df$Date %in% c("1/2/2007","2/2/2007"), ]


#getting data for this plot and plotting that into a png file
datetime <- strptime(paste(assignmentData$Date, assignmentData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(assignmentData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()