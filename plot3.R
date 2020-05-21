unzip("exdata_data_household_power_consumption.zip")

assign_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

plot3_data <- subset(assign_data, Date %in% c("1/2/2007","2/2/2007"))
plot3_data$Date <- as.Date(plot3_data$Date, format="%d/%m/%Y")
date_time <- paste(as.Date(plot3_data$Date), plot3_data$Time)
plot3_data$Date_time <- as.POSIXct(date_time)

with(plot3_data, plot(Sub_metering_1~Date_time, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
lines(Sub_metering_2~Date_time,plot3_data, col='Red')
lines(Sub_metering_3~Date_time,plot3_data, col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()