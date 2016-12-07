####data1<- read.csv("household_power_consumption.txt", sep = "")
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

plot(subset_data1$Time, subset_data1$Sub_metering_1, type = "1", xlab = "", ylab = "Engery Sub Merging")
with(subset_data1,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subset_data1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subset_data1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

par(mfrow=c(2,2))

with(subset_data1,{
  plot(subset_data1$Time,as.numeric(as.character(subset_data1$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subset_data1$Time,as.numeric(as.character(subset_data1$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subset_data1$Time,subset_data1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subset_data1,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subset_data1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subset_data1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subset_data1$Time,as.numeric(as.character(subset_data1$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})




#creating simple histogram for global_active_ power variable

####plot(subset_data1$Time,as.numeric(as.character(subset_data1$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")


title("Global Active Power Vs Time")