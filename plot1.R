################################################################################
#
#  Code Fragment that generates plot #1 from household_power_consumption.txt
#
#  Plot #1 is a histogram of the data collected during 1-Feb-2007 and 2-Feb-2007
#    The histogram tracks frequency of global active power values
#    Dates are stored in the "Date" column using no leading zeros on day/month
#      and are formatted as "day"/"month"/"four digit year"
# Load the full data set
  total_hpc <- read.table("household_power_consumption.txt",
                         header = TRUE,sep = ";",na.strings = "?", 
                         as.is = c("Date","Time"))

# Trim data to the set of interest
  my_hpc <- subset(total_hpc,Date == "1/2/2007" | Date == "2/2/2007")

# Generate the histogram
  hist(my_hpc$Global_active_power, xlab = "Global Active Power (kilowatts)", 
       main = "Global Active Power", col = "Red")
  # On my device, default background is transparent, which doesn't show well in png
  par(bg = "white")

# copy impage to .png. Both commands are needed for the image to be saved.
  dev.copy(png,"plot1.png", width = 480, height = 480) 
  dev.off()
