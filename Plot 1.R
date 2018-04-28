#Plot 1 
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

assigmentsubset$Datetime <- as.POSIXct(datetime)
hist(assigmentsubset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
