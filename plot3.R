##plot3
if(!file.exists("data.zip")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, destfile = "data.zip", method = "curl")
}

unzip("data.zip")

## READ TABLE
data<- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

##PARCE Date & Time
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
start <- which(data$DateTime == strptime("2007-02-01", "%Y-%m-%d"))
end <- which(data$DateTime == strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
data <- data[start:end,]

## CREATE PLOT
plot(data$DateTime, as.numeric(as.character(data$Sub_metering_1)), type = "s", 
     ylab = "Energy Sub metering", xlab = "")
lines(data$DateTime, as.numeric(as.character(data$Sub_metering_2)), type = "s", col = "red")
lines(data$DateTime, as.numeric(as.character(data$Sub_metering_3)), type = "s", col = "blue")
legend("topright", c("Sub metering 1","Sub metering 2","Sub metering 3"),
       lty = c(1, 1, 1),col = c("black", "red", "blue"))

#CREATE PNG
png("plot3.png", width = 480, height = 480)
plot(data$DateTime, as.numeric(as.character(data$Sub_metering_1)), type = "s", 
     ylab = "Energy Sub metering", xlab = "")
lines(data$DateTime, as.numeric(as.character(data$Sub_metering_2)), type = "s", col = "red")
lines(data$DateTime, as.numeric(as.character(data$Sub_metering_3)), type = "s", col = "blue")
legend("topright", c("Sub metering 1","Sub metering 2","Sub metering 3"),
       lty = c(1, 1, 1),col = c("black", "red", "blue"))
dev.off()