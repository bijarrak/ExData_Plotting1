###changing working directory#####
setwd("F:/Data Science Assignment/Exp_data_analysis/exdata_data_household_power_consumption")

#######reading the data#######
dt<-read.table("./household_power_consumption.txt",header = TRUE,sep = ";")

###changing the data type######
dt$Date <- as.Date(dt$Date,"%d/%m/%Y")

class(dt$Date)

head(dt$Date)

dt1<-subset(dt,Date>=as.Date("2007-02-01","%Y-%m-%d") & Date <= as.Date("2007-02-02","%Y-%m-%d") )

min(dt1$Date)

max(dt1$Date)

class(dt1$Time)

dt1$DATETIME <-paste(dt1$Date,dt1$Time,sep = " ")

class(dt1$DATETIME)

dt1$DATETIME <-strptime(dt1$DATETIME,"%Y-%m-%d %H:%M:%S")

class(dt1$DATETIME)


class(dt1$Global_active_power)

dt1$Global_active_power<-as.numeric(as.character(dt1$Global_active_power))

str(dt1$Global_active_power)



dt1$Sub_metering_1<-as.numeric(as.character(dt1$Sub_metering_1))
dt1$Sub_metering_2<-as.numeric(as.character(dt1$Sub_metering_2))
dt1$Sub_metering_3<-as.numeric(as.character(dt1$Sub_metering_3))

dt1$Voltage<-as.numeric(as.character(dt1$Voltage))

dt1$Global_reactive_power<-as.numeric(as.character(dt1$Global_reactive_power))

class(dt1$Global_reactive_power)

##########plot#####
png(filename = "plot4.png")

par(mfrow=c(2,2))

with(dt1,plot(DATETIME,Global_active_power,type="l",xlab = "",
              ylab = "Global Active Power(kilowatts)"))

with(dt1,plot(DATETIME,Voltage,type="l",xlab = "datetime",
              ylab = "Voltage"))

with(dt1,plot(DATETIME,Sub_metering_1,type="n",ylab= "Energy sub metering"))

with(dt1,lines(DATETIME,Sub_metering_1))

with(dt1,lines(DATETIME,Sub_metering_2,col="red"))

with(dt1,lines(DATETIME,Sub_metering_3,type="l",col="blue"))

legend("topright",
       lty = c(1,1,1),
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

with(dt1,plot(DATETIME,Global_reactive_power,type="l",xlab = "datetime",
              ylab = "Global_reactive_power"))

dev.off()