## script to create plot3

# reading in the data
table<- read.table("household_power_consumption.txt", 
                   nrows = 2075259, sep = ";", header = TRUE, na.strings="?") 

# subsetting the data for the required dates
data <- table[which(table$Date=="1/2/2007" | table$Date == "2/2/2007"),]

# setting the local settings to English to have the correct x-labels
Sys.setlocale("LC_TIME", "English")

# creating an additional vector for the timepoint 
# to have date and time as one variable
data$DateTime <- paste(data$Date, data$Time)

# converting the data to the correct date and time format
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

# creating png with the requirements
png("plot4.png",width=480,height=480,units="px", bg = "transparent")

# creating the 2 by 2 layout for the four plots
par(mfrow = c(2,2))

# creating the topleft plot
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "")

# creating the topright plot
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# creating the lowerleft plot 
# plotting the metering 1 data
plot(data$DateTime, data$Sub_metering_1, col = "black", type = "l",
     xlab = "", ylab = "Energy sub metering")
# adding the metering 2 data
          lines(data$DateTime, data$Sub_metering_2, col ="red", type = "l")
# adding the metering 3 data
          lines(data$DateTime, data$Sub_metering_3, col = "blue", type = "l")
# adding the legend 
legend("topright", lwd = 1, lty = 1, bty = "n", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plotting the line diagram for global reactive power
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# close graphics device (the png file) and revert to local settings
dev.off()
Sys.setlocale("LC_TIME", "")
