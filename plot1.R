unzip("exdata_data_household_power_consumption.zip")

assign_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

plot1_data <- subset(assign_data, Date %in% c("1/2/2007","2/2/2007"))
plot1_data$Date <- as.Date(plot1_data$Date, format="%d/%m/%Y")
date_time <- paste(as.Date(plot1_data$Date), plot1_data$Time)
plot1_data$Date_time <- as.POSIXct(date_time)

hist(plot1_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()