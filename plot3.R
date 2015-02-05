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
png("plot3.png",width=480,height=480,units="px",bg = "transparent")

# plotting the data of sub_metering1 at first
plot(data$DateTime, data$Sub_metering_1, col = "black", type = "l", 
     xlab = "", ylab = "Energy sub metering")

# adding the metering 2 in red
lines(data$DateTime, data$Sub_metering_2, col ="red", type = "l")

# adding the metering 3 in blue
lines(data$DateTime, data$Sub_metering_3, col = "blue", type = "l")

# adding the legend in the top right corner
legend("topright", lwd = 1, lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# close graphics device (the png file) and revert to local settings
dev.off()
Sys.setlocale("LC_TIME", "")
