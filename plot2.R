data1<- read.table("household_power_consumption.txt", skip = 1, sep = ";")

names(data1) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


head(data1)
# making a dataset of data1 of 1 and 2nd feb
subset_data1<- subset(data1, data1$Date=="1/2/2007" | data1$Date=="2/2/2007")

subset_data1$Date <- as.Date(subset_data1$Date, format="%d/%m/%Y")
subset_data1$Time <- strptime(subset_data1$Time, format="%H:%M:%S")
subset_data1[1:1440,"Time"] <- format(subset_data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subset_data1[1441:2880,"Time"] <- format(subset_data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

dev.set=2
#creating simple histogram for global_active_ power variable

png(filename="C:\\Users\\eklopqk\\Documents\\R\\Exploratory analysis\\plot2.png")

plot(subset_data1$Time,as.numeric(as.character(subset_data1$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")

Title("Global Active Power")
dev.off()
