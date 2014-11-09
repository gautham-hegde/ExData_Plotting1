#read in the data file
electricPower <- read.csv('data/household_power_consumption.txt', sep=';', na.strings='?')

electricPower$Date <- as.Date(electricPower$Date, format='%d/%m/%Y')
##electricPower$Time <- strptime(electricPower$Time,)

#get only the 2007 set
electricPower <- electricPower[electricPower$Date >= '2007-02-01' & electricPower$Date <= '2007-02-02',]

hist(electricPower$Global_active_power, col='red',xlab = 'Global Active Power (kilowatts)')