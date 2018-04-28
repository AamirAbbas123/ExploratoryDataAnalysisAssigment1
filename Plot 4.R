#Plot 2 
ZIP.url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dir <- getwd()
zip.file <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
zip.combine <- as.character(paste(dir, zip.file, sep = "/"))
download.file(ZIP.url, destfile = zip.combine)
unzip(zip.file)
assigment1 <- read.csv("C:/Users/aamir/OneDrive/Documents/data/household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
assigment1$Date <- as.Date(assigment1$Date, format="%d/%m/%Y")
class(assigment1$Date)
assigmentsubset <- subset(assigment1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(assigment1)

class(assigmentsubset$Date)
datetime <- paste(as.Date(assigmentsubset$Date), assigmentsubset$Time)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(assigmentsubset$Global_active_power~assigmentsubset$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="Time and Date")
plot(assigmentsubset$Voltage~assigmentsubset$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="Time and Date")
with(assigmentsubset, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="Time and Date")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.30)
plot(assigmentsubset$Global_reactive_power~assigmentsubset$Datetime, type="l",
     ylab="Global Reactive Power (kilowatts)", xlab="Time and Date")



## Saving to file
dev.copy(png, file="Plot4.png", height=480, width=480)
dev.off()

