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
#Plot2
plot(mydata$dateTime,mydata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
