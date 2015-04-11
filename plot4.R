## Reading file

file <- read.table("household_power_consumption.txt", header = TRUE, sep=";", dec=".",
                   na.strings = "?",nrows = 2075259)

## creating a new column with the date and time values
file$dateTime <- strptime(paste(file$Date, file$Time, sep=" "),
                          format = "%d/%m/%Y %H:%M:%S")
## formating date column 
file$Date <- as.Date(file$Date , "%d/%m/%Y")

## filtering data to keep only the dates we want
filtered.data <- file[file$Date %in% as.Date(c('01/02/2007', '02/02/2007'), "%d/%m/%Y"),]

## writing plot into file
png(filename = "plot4.png", width = 480, height = 480, units = "px")

## defining grid
par(mfcol = c(2,2))

## creating the plot with information

## top left plot
plot(filtered.data[,10], filtered.data[,3], type = "l", xlab = "", ylab="Global Active Power (kilowatts)")

## bottom left plot
plot(filtered.data[,10], filtered.data[,7], type = "l", xlab = "", ylab="Energy sub metering")
points(filtered.data[,10], filtered.data[,8], col = "red", type = "l")
points(filtered.data[,10], filtered.data[,9], col = "blue", type = "l")
legend('topright', legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty =1)

## top right plot
plot(filtered.data[,10], filtered.data[,5], type = "l", xlab = "datetime", ylab="Voltage")

## bottom right plot
plot(filtered.data[,10], filtered.data[,4], type = "l", xlab = "datetime", ylab="Global_reactive_power")

dev.off()