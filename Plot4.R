
#Data File Name
FileName <- "household_power_consumption.txt"

#Reading the data
Data <- read.table(FileName, sep = ";", header = TRUE, na.strings = "?",
                   nrows = -1)
#Filtering the data
Data <- Data[(Data$Date == "1/2/2007" | Data$Date == "2/2/2007"), ]

#Creation of a new field
datetime <- paste(Data$Date, Data$Time)
Data$DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

#png Device
png("plot4.png",width = 480, height = 480)

#Setting the margins
par(mfrow = c(2, 2), mar = c(4,4,1,1), oma = c(1,0,0,0))

#First Graph
with(Data, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

#Second Graph
with(Data, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

#Third Graph
with(Data, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(Data, lines(DateTime, Sub_metering_2,col='Red'))
with(Data, lines(DateTime, Sub_metering_3,col='Blue'))
legend("topright", pch = -1, col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n" )

#Fourth Graph
with(Data, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

#Closing the device
dev.off() ## Don't forget to close the PNG device!