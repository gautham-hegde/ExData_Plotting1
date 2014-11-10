#read in the data file
electricPower <- read.csv('data/household_power_consumption.txt', sep=';', na.strings='?')

electricPower$Date <- as.Date(electricPower$Date, format='%d/%m/%Y')

#get only the 2007 set
electricPower <- electricPower[electricPower$Date >= '2007-02-01' & electricPower$Date <= '2007-02-02',]

electricPower$DateTime <- paste(electricPower$Date, electricPower$Time)
electricPower$DateTime <- strptime(electricPower$DateTime, format = "%Y-%m-%d %H:%M:%S")

plot(electricPower$DateTime, electricPower$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)')

dev.copy(png, file='figure/plot2.png')

dev.off()

