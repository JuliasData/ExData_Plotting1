## script to create plot1
## histogram of global active power

# reading in the data
table<- read.table("household_power_consumption.txt", 
                   nrows = 2075259, sep = ";", header = TRUE, na.strings="?") 

# subsetting the data for the required dates
data <- table[which(table$Date=="1/2/2007" | table$Date == "2/2/2007"),]

# creating the png-file with the requirements
png("plot1.png", width=480, height=480, units="px", bg = "transparent")

# creating the histogram
hist(data$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# close graphics device (the png file)
dev.off()