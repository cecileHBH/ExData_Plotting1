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
png(filename = "plot2.png", width = 480, height = 480, units = "px")

## creating the plot with information
plot(filtered.data[,10], filtered.data[,3], type = "l", xlab = "", ylab="Global Active Power (kilowatts)")

dev.off()