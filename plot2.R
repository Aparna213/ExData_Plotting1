table1<- read.table("C:/Users/Aparna Sathyan/Desktop/Aparna cousera/course 4/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- subset(table1,table1$Date=="1/2/2007" | table1$Date =="2/2/2007")
library(dplyr)
library(lubridate)
maindata<- mutate(subSetData,date_time=dmy_hms(paste(Date,Time)),Date = dmy(Date),Time=hms(Time),Global_active_power=as.numeric(Global_active_power))
png("C:/Users/Aparna Sathyan/Desktop/Aparna cousera/course 4/Plot2.png",width = 480, height = 480, units = "px",bg="white")
# calling the basic plot function
plot(maindata$date_time,maindata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
# annotating graph
title(main="Global Active Power Vs Time")
dev.off()

