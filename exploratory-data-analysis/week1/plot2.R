plot2 <- function() {
  header <- read.table("household_power_consumption.txt", header = FALSE, sep =';', stringsAsFactors = FALSE, nrows = 1)
  data <- read.table("household_power_consumption.txt", header = FALSE, sep =';', skip = 66637, nrows = 2880, na.strings = "?")
  colnames(data) <- unlist(header)
  data$Time <- paste(data$Date, data$Time, sep = " ")
  data$Date <- as.Date(data$Date,format='%d/%m/%Y')
  data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")
  
  png("plot2.png", width = 480, height = 480)
  Sys.setlocale("LC_ALL", "English")
  with(data, {
    plot(Time, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
    lines(Time, Global_active_power, type = "l")
  })
  Sys.setlocale("LC_ALL", local = "Dutch")
  dev.off()
}