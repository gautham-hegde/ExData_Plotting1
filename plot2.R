#read in the data file
electricPower <- read.csv('data/household_power_consumption.txt', sep=';', na.strings='?')

electricPower$Date <- as.Date(electricPower$Date, format='%d/%m/%Y')
##electricPower$Time <- strptime(electricPower$Time,)

#get only the 2007 set
electricPower <- electricPower[electricPower$Date >= '2007-02-01' & electricPower$Date <= '2007-02-02',]

plot(electricPower$Global_active_power, type = 'l')

dev.copy(png, file='figure/plot2.png')

dev.off()

