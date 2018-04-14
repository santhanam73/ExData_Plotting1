## Draw Plot2 and save as plot2.png
plot(powerdata$Global_active_power~powerdata$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()