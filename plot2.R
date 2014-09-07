plot2 <- function() {
  ## Set directory
  vDir="/Users/Administrator/Coursera/Exploratory Data Analysis/Course Project 1"
  setwd(vDir)

  ## Read the Household Power Consumption data into table
  hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",blank.lines.skip=TRUE)
  
  ## nrow(hpc) 2075259 rows  

  ## Subset Plot2
  hpc_0201_0202 <- subset(hpc,as.Date(hpc$Date,"%d/%m/%Y")=="2007-02-01"|as.Date(hpc$Date,"%d/%m/%Y")=="2007-02-02")
  hpcDF <- data.frame(hpc_0201_0202$Date,weekdays(as.Date(hpc_0201_0202$Date,"%d/%m/%Y"),abbreviate=TRUE),paste(as.Date(hpc_0201_0202$Date,"%d/%m/%Y"),format(hpc_0201_0202$Time,format="%H:%M:%S")),as.numeric(as.character(hpcDF$Global_active_power)))
  names(hpcDF) <- c("Date","Weekday","Time","Global_active_power")
  
  ## Generate a PNG file with the name plot2.png
  png(file="plot2.png",width = 480, height = 480, units = "px")
  
  ## Plot the histogram with labels
  plot(strptime(hpcDF$Time,format="%Y-%m-%d %H:%M:%S"),hpcDF$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  dev.off()
}