# This R script produce a line graph of the Sub Metering by Dates.
# Requires the packate 'sqldf'


query <- "select * from file where Date='1/2/2007' or Date = '2/2/2007'"
a<-read.csv.sql("household_power_consumption.txt", sep=";", sql=query)


b<-paste(a$Date, a$Time)
c<-strptime(b, "%d/%m/%Y %H:%M:%S")

# create and save graph to png file
png(file="plot3.png", width=480, height=480)
plot(c, a$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(c, a$Sub_metering_2, type="l", col="red")
lines(c, a$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
