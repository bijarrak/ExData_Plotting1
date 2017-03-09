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



##########plot#####
png(filename = "plot2.png")

with(dt1,plot(DATETIME,Global_active_power,type="l",xlab = "",ylab = "Global Active Power(kilowatts)"))

dev.off()