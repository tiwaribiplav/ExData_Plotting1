unzip("exdata_data_household_power_consumption.zip")

assign_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

plot4_data <- subset(assign_data, Date %in% c("1/2/2007","2/2/2007"))
plot4_data$Date <- as.Date(plot4_data$Date, format="%d/%m/%Y")
date_time <- paste(as.Date(plot4_data$Date), plot4_data$Time)
plot4_data$Date_time <- as.POSIXct(date_time)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(plot4_data, plot(Global_active_power~Date_time, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
with(plot4_data, plot(Voltage~Date_time, type="l", ylab="Voltage (volt)", xlab=""))
with(plot4_data, plot(Sub_metering_1~Date_time, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
lines(Sub_metering_2~Date_time,plot4_data, col='Red')
lines(Sub_metering_3~Date_time, plot4_data,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(plot4_data, plot(Global_reactive_power~Date_time, type="l", ylab="Global Rective Power (kilowatts)",xlab=""))

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()