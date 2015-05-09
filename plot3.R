## Make sure that the date file "household_power_consumption.txt" is downloaded and located in the folder where the script will be run.
## Make sure the sqldf package is installed and loaded in R - 
## install.packages("sqldf") 
## library(sqldf)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest="household_power_consumption.zip", mode="wb")
unzip ("household_power_consumption.zip", exdir = ".")
bigdf <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date ='2/2/2007'", header = TRUE, sep = ";")
bigdf$DateTime <- paste(bigdf$Date, bigdf$Time, sep = " ")
bigdf$DateTime <- strptime(bigdf$DateTime, "%d/%m/%Y %H:%M:%S")
png("plot3.png")
plot(bigdf[,10],bigdf[,7],type="l",col="black", xlab="",  ylab="Energy sub metering")
lines(bigdf[,10],bigdf[,8],col="red")
lines(bigdf[,10],bigdf[,9],col="blue")
legend('topright', c("Sub_metering_1" ,"Sub_metering_2" , "Sub_metering_3") , 
       lty=1, col=c('black', 'red', 'blue'), bty='o')
dev.off()

## Plot on default screen
plot(bigdf[,10],bigdf[,7],type="l",col="black", xlab="",  ylab="Energy sub metering")
lines(bigdf[,10],bigdf[,8],col="red")
lines(bigdf[,10],bigdf[,9],col="blue")
legend('topright', c("Sub_metering_1" ,"Sub_metering_2" , "Sub_metering_3") , 
       lty=1, col=c('black', 'red', 'blue'), bty='o')