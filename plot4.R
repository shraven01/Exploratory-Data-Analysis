plot4 <- function() {

  ## Set directory
  vDir="/Users/Administrator/Coursera/Exploratory Data Analysis/Course Project 1"
  setwd(vDir)
  
  ## Read the Household Power Consumption data into table
  hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",blank.lines.skip=TRUE)
  ## nrow(hpc) 2075259 rows  
  
  ## Subet Plot and Convert to Data Frame
  hpc_0201_0202 <- subset(hpc,as.Date(hpc$Date,"%d/%m/%Y")=="2007-02-01"|as.Date(hpc$Date,"%d/%m/%Y")=="2007-02-02")
  hpcDF <- data.frame(hpc_0201_0202$Date,weekdays(as.Date(hpc_0201_0202$Date,"%d/%m/%Y"),abbreviate=TRUE),paste(as.Date(hpc_0201_0202$Date,"%d/%m/%Y"),format(hpc_0201_0202$Time,format="%H:%M:%S")),as.numeric(as.character(hpc_0201_0202$Global_active_power)),as.numeric(as.character(hpc_0201_0202$Global_reactive_power)),as.numeric(as.character(hpc_0201_0202$Voltage)),as.numeric(as.character(hpc_0201_0202$Sub_metering_1)),as.numeric(as.character(hpc_0201_0202$Sub_metering_2)),as.numeric(as.character(hpc_0201_0202$Sub_metering_3)))
  names(hpcDF) <- c("Date","Weekday","Time","Global_active_power","Global_reactive_power","Voltage","Sub_metering_1","Sub_metering_2","Sub_metering_3")  
  datetime <- strptime(hpcDF$Time,format="%Y-%m-%d %H:%M:%S")
  
  ## Generate a PNG file with the name plot4.png  
  png(file="plot4.png", width = 480, height = 480,units = "px",bg="white")
  par(mfrow=c(2,2))
  ## Plot graph 1 histogram with labels
  ##par()
  hist(hpcDF$Global_active_power,main="Global Active Power",col="red",xlab="",ylab="Frequency",plot=TRUE)
  
  ## Plot graph 2 Voltage with labels
  plot(datetime,hpcDF$Voltage,xlab="datetime",ylab="Voltage",type="l")

  ## Plot graph 3 with sub metering values and legend
  plot(datetime,hpcDF$Sub_metering_1,type="l",xlab="",ylab="Energy Sub metering")
  lines(datetime,hpcDF$Sub_metering_2,type="l",col="red")
  lines(datetime,hpcDF$Sub_metering_3,type="l",col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")

  ## Plot graph 4 Global Reactive Power with labels
  plot(datetime,hpcDF$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  dev.off()
}