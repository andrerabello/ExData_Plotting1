## Read Original File
## Define sep = ; , header = TRUE, replace "?" char for NA's, define colClasses
dt_base <- read.table(file = "~/Coursera/power/household_power_consumption.txt", na.strings = "?", header = TRUE, sep = ";", colClass = c(rep("character",2), rep("numeric", 7)))

## Subset the dt_base (Only qui, sex and sáb) (Corresponds to Thu, Fri, Sat)
dt_filtered <- dt_base[dt_base$Date == "1/2/2007" | dt_base$Date == "2/2/2007", ]

## Creates a new collum DateTime
dt_filtered$DateTime <- strptime(paste(dt_filtered$Date, dt_filtered$Time), format="%d/%m/%Y %H:%M:%S")

## Create a plot
plot(dt_filtered$DateTime, dt_filtered$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")