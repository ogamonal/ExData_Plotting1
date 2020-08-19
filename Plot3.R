
FileName <- "household_power_consumption.txt"
Data <- read.table(FileName, sep = ";", header = TRUE, na.strings = "?",
                   nrows = -1)

Data <- Data[(Data$Date == "1/2/2007" | Data$Date == "2/2/2007"), ]
datetime <- paste(Data$Date, Data$Time)
datetime

Data$DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

png("plot3.png",width = 480, height = 480)

with(Data, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))

with(Data, lines(DateTime, Sub_metering_2,col='Red'))
with(Data, lines(DateTime, Sub_metering_3,col='Blue'))

legend("topright", pch = -1, col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off() ## Don't forget to close the PNG device!