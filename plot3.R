table1<- read.table("C:/Users/Aparna Sathyan/Desktop/Aparna cousera/course 4/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- subset(table1,table1$Date=="1/2/2007" | table1$Date =="2/2/2007")
library(dplyr)
library(lubridate)
maindata<- mutate(subSetData,date_time=dmy_hms(paste(Date,Time)),Date = dmy(Date),Time=hms(Time),Global_active_power=as.numeric(Global_active_power))
subMetering1 <- as.numeric(maindata$Sub_metering_1)

subMetering2 <- as.numeric(maindata$Sub_metering_2)

subMetering3 <- as.numeric(maindata$Sub_metering_3)
png("C:/Users/Aparna Sathyan/Desktop/Aparna cousera/course 4/Plot3.png",width = 480, height = 480, units = "px",bg="white")
plot(maindata$date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(maindata$date_time, subMetering2, type="l", col="red")

lines(maindata$date_time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()