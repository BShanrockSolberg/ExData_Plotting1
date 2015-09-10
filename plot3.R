################################################################################
#
#  Code Fragment that generates plot #3 from household_power_consumption.txt
#
#  Plot #3 is a plot of the data collected during 1-Feb-2007 and 2-Feb-2007
#    The three submeters are plotted against time.
#    Dates are stored in the "Date" column using no leading zeros on day/month
#      and are formatted as "day"/"month"/"four digit year"

# Load the full data set
  total_hpc <- read.table("household_power_consumption.txt",
                         header = TRUE,sep = ";",na.strings = "?", 
                         as.is = c("Date","Time"))

# Trim data to the set of interest
  my_hpc <- subset(total_hpc,Date == "1/2/2007" | Date == "2/2/2007")
  # Create a datetime field so we can extract the days of the week
  my_hpc$Datetime <- strptime(paste(my_hpc[,"Date"],my_hpc[,"Time"]),
                            format="%d/%m/%Y %H:%M:%S")

# Plot the Data
  plot(x = my_hpc$Datetime, xlab = "", y = my_hpc$Sub_metering_1, 
       ylab = "Energy sub metering", type = "l")
  points(x = my_hpc$Datetime, y = my_hpc$Sub_metering_2, 
         type = "l",col = "red")
  points(x = my_hpc$Datetime, y = my_hpc$Sub_metering_3, 
         type = "l",col = "blue")
  legend('topright',lty = 1, col = c("black", "red", "blue"), cex = .75,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
         
  # On my device, default background is transparent, which doesn't show well in png
  par(bg = "white")

# copy impage to .png. Both commands are needed for the image to be saved.
  dev.copy(png,"plot3.png", width = 480, height = 480) 
  dev.off()
