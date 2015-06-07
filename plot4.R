#
mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
mydata$Date<-as.Date(mydata$Date,format="%d/%m/%Y")
mydata<-mydata[mydata$Date=="2007-02-01"|mydata$Date=="2007-02-02",]
mydata$dateTime<-strptime(paste(mydata$Date,mydata$Time),"%Y-%m-%d %H:%M:%S")
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
mydata$Global_reactive_power<-as.numeric(mydata$Global_reactive_power)
mydata$Voltage<-as.numeric(mydata$Voltage)
mydata$Sub_metering_1<-as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2<-as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3<-as.numeric(mydata$Sub_metering_3)
# Remove missing data
mydata<-mydata[!is.na(mydata$Voltage),]
#Plot4
par(mfrow=c(2,2))
#
plot(mydata$dateTime,mydata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#
plot(mydata$dateTime,mydata$Voltage,type="l",xlab="datetime",ylab="Voltage")
#
plot(mydata$dateTime,mydata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(mydata$dateTime,mydata$Sub_metering_1,type="l",col="black")
points(mydata$dateTime,mydata$Sub_metering_2,type="l",col="red")
points(mydata$dateTime,mydata$Sub_metering_3,type="l",col="blue")
legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#
plot(mydata$dateTime,mydata$Global_reactive_power,type="l",xlab="datetime",ylab="Global reactive power")


