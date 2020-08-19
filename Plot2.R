
FileName <- "household_power_consumption.txt"
Data <- read.table(FileName, sep = ";", header = TRUE, na.strings = "?",
                   nrows = -1)

Data <- Data[(Data$Date == "1/2/2007" | Data$Date == "2/2/2007"), ]
datetime <- paste(Data$Date, Data$Time)
datetime

Data$DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

png("plot2.png",width = 480, height = 480)

with(Data, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off() ## Don't forget to close the PNG device!
