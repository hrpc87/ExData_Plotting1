##plot2
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
plot(data$DateTime, as.numeric(as.character(data$Global_active_power)),
     type = "s",ylab = "Global Active Power (Kilowatts)", xlab = "")

#CREATE PNG
png("plot2.png", width = 480, height = 480)
plot(data$DateTime, as.numeric(as.character(data$Global_active_power)),
     type = "s",ylab = "Global Active Power (Kilowatts)", xlab = "")
dev.off()