plot3 <- function() {
  header <- read.table("household_power_consumption.txt", header = FALSE, sep =';', stringsAsFactors = FALSE, nrows = 1)
  data <- read.table("household_power_consumption.txt", header = FALSE, sep =';', skip = 66637, nrows = 2880, na.strings = "?")
  colnames(data) <- unlist(header)
  data$Time <- paste(data$Date, data$Time, sep = " ")
  data$Date <- as.Date(data$Date,format='%d/%m/%Y')
  data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")

  png("plot3.png", width = 480, height = 480)
  Sys.setlocale("LC_ALL", "English")
  with(data, {
    plot(Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    lines(Time, Sub_metering_1, type = "l", col = "black")
    lines(Time, Sub_metering_2, type = "l", col = "red")
    lines(Time, Sub_metering_3, type = "l", col = "blue")
    legend("topright", lty=1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  })
  Sys.setlocale("LC_ALL", local = "Dutch")
  dev.off()
}