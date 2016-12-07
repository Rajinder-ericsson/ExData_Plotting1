
data1<- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(data1) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


head(data1)
# making a dataset of data1 of 1 and 2nd feb
subset_data1<- subset(data1, data1$Date=="1/2/2007" | data1$Date=="2/2/2007")

dev.set=2
#creating simple histogram for global_active_ power variable

png(filename="C:\\Users\\eklopqk\\Documents\\R\\Exploratory analysis\\Plot1.png")
hist(as.numeric(as.character(subset_data1$Global_active_power)), col= "red", main = "Global Active Power", xlap = subset_data1)
dev.off()