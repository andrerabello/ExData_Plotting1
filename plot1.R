## Read Original File
## Define sep = ; , header = TRUE, replace "?" char for NA's, define colClasses
dt_base <- read.table(file = "~/Coursera/power/household_power_consumption.txt", na.strings = "?", header = TRUE, sep = ";", colClass = c(rep("character",2), rep("numeric", 7)))

##Subset the dt_base (Only 01/02/2007 and 02/02/2007)
dt_filtered <- dt_base[dt_base$Date == "1/2/2007" | dt_base$Date == "2/2/2007", ]

##Generate Plot1
hist(dt_filtered$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")