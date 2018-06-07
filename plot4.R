# Read the data into Data object

Data <- read.table("household_power_consumption.txt", sep=";", header=TRUE,  na.strings=c("?", "NA"))

# Subset Data. We need only the data from 2 dates

sub <- Data[Data$Date == "1/2/2007" | Data$Date == "2/2/2007",]

#Convert Date variable to Date class
 sub$Date <- as.Date(sub$Date, "%d/%m/%Y")

# Create a new variable DateTime by merging Date and Time variables

sub$DateTime<- paste(sub$Date, sub$Time)

# Change the format of DateTime 

sub$DateTime <-  strptime(sub$DateTime, format ="%Y-%m-%d %H:%M:%S")

#open graphics device

png(filename="plot4.png", width=480, height=480, bg="white")

par(mfrow=c(2,2))

plot(sub$DateTime,sub$Global_active_power, type="l", ylab = "Global Active Power(kilowatts)", xlab="")

plot(sub$DateTime, sub$Voltage, type="l", xlab = "datetime", ylab="Voltage")

plot(sub$DateTime, sub$Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1,bty="n", cex=.5)

lines(sub$DateTime, sub$Sub_metering_2, col="red", type="l")

lines(sub$DateTime, sub$Sub_metering_3, col="blue", type="l")

plot(sub$DateTime, sub$Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power")



dev.off()
