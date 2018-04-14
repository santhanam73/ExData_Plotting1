##Load powerdata and pull necessary information
powerdata <- read.table("C:\\santhanam\\DatascienceToolkit\\ExplorartoryDataAnalysis\\week1project\\household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
  
## Retrieve dataset between Feb. 1, 2007 to Feb. 2, 2007
powerdata <- subset(powerdata,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
  
## filter out incomplete observation
powerdata <- powerdata[complete.cases(powerdata),]

## process date and time
dateTime <- paste(powerdata$Date, powerdata$Time)
dateTime <- setNames(dateTime, "DateTime")
powerdata <- powerdata[ ,!(names(powerdata) %in% c("Date","Time"))]
powerdata <- cbind(dateTime, powerdata)
powerdata$dateTime <- as.POSIXct(dateTime)


##Draw plot 1 and create the histogram
hist(powerdata$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
## save the plot1 figure and close the device.
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()