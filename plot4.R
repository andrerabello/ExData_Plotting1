## Read Original File
## Define sep = ; , header = TRUE, replace "?" char for NA's, define colClasses
dt_base <- read.table(file = "~/Coursera/power/household_power_consumption.txt", na.strings = "?", header = TRUE, sep = ";", colClass = c(rep("character",2), rep("numeric", 7)))

## Subset the dt_base (Only qui, sex and sáb) (Corresponds to Thu, Fri, Sat)
dt_filtered <- dt_base[dt_base$Date == "1/2/2007" | dt_base$Date == "2/2/2007", ]

## Creates a new collum DateTime
dt_filtered$DateTime <- strptime(paste(dt_filtered$Date, dt_filtered$Time), format="%d/%m/%Y %H:%M:%S")

# Configure system settings as to get weekdays abbreviations in English
Sys.setlocale("LC_TIME", "English")

## Format display graphics and margins
par(mfrow=c(2,2), mar = c(3,2,1,1), oma=c(0,0,0,0))

## Create first plot
plot(dt_filtered$DateTime, dt_filtered$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Create second plot
plot(dt_filtered$DateTime, dt_filtered$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

## Create third plot
plot(dt_filtered$DateTime, dt_filtered$Sub_metering_1, ylab = "Energy sub metering", xlab = "", "n")
lines(dt_filtered$DateTime, dt_filtered$Sub_metering_1, col = "black")
lines(dt_filtered$DateTime, dt_filtered$Sub_metering_2, col = "red")
lines(dt_filtered$DateTime, dt_filtered$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = "solid", col = c("black", "red", "blue"))

## Create fourth plot
plot(dt_filtered$DateTime, dt_filtered$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

