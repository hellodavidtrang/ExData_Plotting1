# This R script produce 4 plot and save it to a png file.
# Requires the packate 'sqldf'


query <- "select * from file where Date='1/2/2007' or Date = '2/2/2007'"
a<-read.csv.sql("household_power_consumption.txt", sep=";", sql=query)


b<-paste(a$Date, a$Time)
c<-strptime(b, "%d/%m/%Y %H:%M:%S")

# create and save graph to png file
png(file="plot4.png", width=480, height=480)


par(mfrow=c(2,2))

# Creating plot 1
plot(c, a$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Creating Plot 2
plot(c, a$Voltage,type="l", xlab="datetime", ylab="Voltage")

# Creating plot 3
plot(c, a$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(c, a$Sub_metering_2, type="l", col="red")
lines(c, a$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Creating plot 4
plot(c, a$Global_reactive_power,type="l", xlab="datetime", ylab="Global_active_power")

dev.off()