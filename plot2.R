## script to create plot2


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
png("plot2.png",width=480,height=480,units="px", bg = "transparent")

# plotting the data 
plot(data$DateTime, data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

# close graphics device (the png file) and revert to local settings
dev.off()
Sys.setlocale("LC_TIME", "")