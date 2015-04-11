## Reading file

file <- read.table("household_power_consumption.txt", header = TRUE, sep=";", dec=".",
                       na.strings = "?",nrows = 2075259)
## formating date column 
file$Date <- as.Date(file$Date , "%d/%m/%Y")

## filtering data to keep only the dates we want
filtered.data <- file[file$Date %in% as.Date(c('01/02/2007', '02/02/2007'), "%d/%m/%Y"),]

## writing histogram into file
png(filename = "plot1.png", width = 480, height = 480, units = "px")

## creating the histogram with color and information
hist(filtered.data[,3], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()