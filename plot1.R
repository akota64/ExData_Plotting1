## Generates the first plot
## Assuming the household_power_consumption.txt data is in the same directory as this script

## Start and end dates for analysis, inclusive
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")


## Loads required data for household power consumption between 2007-02-01 and 2007-02-02
dat <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)

## Converts Date and Time vars to Date/POSIXlt data types, 
## Subsetting before the time-intensive time conversion
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat <- dat[dat$Date>=start_date & dat$Date<=end_date, ]
dat$Time <- strptime(paste(dat$Date,dat$Time),format ="%Y-%m-%d %H:%M:%S" )

## Make relevant data numeric, so we can graph them
dat$Global_active_power<-as.numeric(dat$Global_active_power)

## Plot generated and saved as png
png(file="plot1.png",width = 480, height = 480)
hist(dat$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     main = "Global Active Power", col = "red")
dev.off()
