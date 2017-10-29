plot1 <- function() {
  header <- read.table("household_power_consumption.txt", header = FALSE, sep =';', stringsAsFactors = FALSE, nrows = 1)
  data <- read.table("household_power_consumption.txt", header = FALSE, sep =';', skip = 66637, nrows = 2880, na.strings = "?")
  colnames(data) <- unlist(header)
  data$Time <- paste(data$Date, data$Time, sep = " ")
  data$Date <- as.Date(data$Date,format='%d/%m/%Y')
  data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")
  
  png("plot1.png", width = 480, height = 480)
  hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  dev.off()
}