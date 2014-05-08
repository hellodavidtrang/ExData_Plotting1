# This R script produce a line graph of the Global Active Power in Killowatts.
# Requires the packate 'sqldf'


query <- "select * from file where Date='1/2/2007' or Date = '2/2/2007'"
a<-read.csv.sql("household_power_consumption.txt", sep=";", sql=query)


b<-paste(a$Date, a$Time)
c<-strptime(b, "%d/%m/%Y %H:%M:%S")

# create and save graph to png file
png(file="plot2.png", width=480, height=480)
plot(c, a$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
