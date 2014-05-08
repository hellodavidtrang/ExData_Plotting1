# This R script produce a histogram of the Global Active Power in Killowatts.
# Requires the packate 'sqldf'


query <- "select * from file where Date='1/2/2007' or Date = '2/2/2007'"
a<-read.csv.sql("household_power_consumption.txt", sep=";", sql=query)

# create the histogram and save it to a png file.
png(file="plot1.png", width=480, height=480)
hist(a$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main=paste("Global Active Power"))
dev.off()