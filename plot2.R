################################################################################
#
#  Code Fragment that generates plot #2 from household_power_consumption.txt
#
#  Plot #2 is a line plot of the data collected during 1-Feb-2007 and 2-Feb-2007
#    This plot compares Global Active power to Time
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

# Plot the data
  plot(x = my_hpc$Datetime, xlab = "", y = my_hpc$Global_active_power, 
       ylab = "Global Active Power (kilowatts)", type = "l")
  # On my device, default background is transparent, which doesn't show well in png
  par(bg = "white")

# copy impage to .png. Both commands are needed for the image to be saved.
  dev.copy(png,"plot2.png", width = 480, height = 480) 
  dev.off()
