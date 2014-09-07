plot1 <- function() {
  ## This R Code was developed by Venkatesh Thyagarajan
  ## Set directory
  vDir="/Users/Administrator/Coursera/Exploratory Data Analysis/Course Project 1"
  setwd(vDir)

  ## Read the Household Power Consumption data into table
  hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",blank.lines.skip=TRUE)
  
  ## Subet Plot and Convert to Data Frame
  hpc_0201_0202 <- subset(hpc,as.Date(hpc$Date,"%d/%m/%Y")=="2007-02-01"|as.Date(hpc$Date,"%d/%m/%Y")=="2007-02-02")
  hpcDF <- data.frame(hpc_0201_0202$Date,weekdays(as.Date(hpc_0201_0202$Date,"%d/%m/%Y"),abbreviate=TRUE),paste(as.Date(hpc_0201_0202$Date,"%d/%m/%Y"),format(hpc_0201_0202$Time,format="%H:%M:%S")),as.numeric(as.character(hpc_0201_0202$Global_active_power)),as.numeric(as.character(hpc_0201_0202$Global_reactive_power)),as.numeric(as.character(hpc_0201_0202$Voltage)),as.numeric(as.character(hpc_0201_0202$Sub_metering_1)),as.numeric(as.character(hpc_0201_0202$Sub_metering_2)),as.numeric(as.character(hpc_0201_0202$Sub_metering_3)))
  names(hpcDF) <- c("Date","Weekday","Time","Global_active_power","Global_reactive_power","Voltage","Sub_metering_1","Sub_metering_2","Sub_metering_3")  
  
  ## Generate a PNG file with the name plot1.png
  png(file="plot1.png",width = 480, height = 480, units = "px")

  ## Plot the histogram with labels
  hist(hpcDF$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red",plot=TRUE)
  dev.off()
}
