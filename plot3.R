## Generates the third plot
## Assuming the household_power_consumption.txt data is in the same directory as this script

## Start and end dates for analysis, inclusive
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")


## Loads required data for household power consumption between 2007-02-01 and 2007-02-02
dat <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)

## Converts Date and Time vars to Date/POSIXct data types, for plotting
## Subsetting before the time-intensive time conversion
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat <- dat[dat$Date>=start_date & dat$Date<=end_date, ]
dat$Time <- as.POSIXct(strptime(paste(dat$Date,dat$Time),format ="%Y-%m-%d %H:%M:%S"))

## Make relevant data numeric, so we can graph them
dat$Sub_metering_1<-as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2<-as.numeric(dat$Sub_metering_2)
dat$Sub_metering_3<-as.numeric(dat$Sub_metering_3)

## Generate plot and save into plot3.png
png(file="plot3.png",width = 480, height = 480)
plot(dat$Time,dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dat$Time,dat$Sub_metering_2, col="red")
lines(dat$Time,dat$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
