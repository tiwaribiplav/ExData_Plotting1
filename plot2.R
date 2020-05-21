unzip("exdata_data_household_power_consumption.zip")

assign_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

plot2_data <- subset(assign_data, Date %in% c("1/2/2007","2/2/2007"))
plot2_data$Date <- as.Date(plot2_data$Date, format="%d/%m/%Y")
date_time <- paste(as.Date(plot2_data$Date), plot2_data$Time)
plot2_data$Date_time <- as.POSIXct(date_time)

with(plot2_data, plot(Global_active_power~Date_time, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()