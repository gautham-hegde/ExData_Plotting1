#read in the data file
electricPower <- read.csv('data/household_power_consumption.txt', sep=';', na.strings='?')

electricPower$Date <- as.Date(electricPower$Date, format='%d/%m/%Y')

#get only the 2007 set
electricPower <- electricPower[electricPower$Date >= '2007-02-01' & electricPower$Date <= '2007-02-02',]

electricPower$DateTime <- paste(electricPower$Date, electricPower$Time)
electricPower$DateTime <- strptime(electricPower$DateTime, format = "%Y-%m-%d %H:%M:%S")

plot(electricPower$DateTime, electricPower$Sub_metering_1, type = 'n', ylab = 'Energy Sub Metering')
lines(electricPower$DateTime, electricPower$Sub_metering_1, type = 'l', col='black')
lines(electricPower$DateTime, electricPower$Sub_metering_2, type = 'l', col='red')
lines(electricPower$DateTime, electricPower$Sub_metering_3, type = 'l', col='blue')

label <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", label, lwd = 2, col = c("black","red","blue"))


dev.copy(png, file='figure/plot3.png')

dev.off()


