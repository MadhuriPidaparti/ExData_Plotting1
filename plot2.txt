# Read the data into Data object

Data <- read.table("household_power_consumption.txt", sep=";", header=TRUE,  na.strings=c("?", "NA"))

# Subset Data. We need only the data from 2 dates

sub <- Data[Data$Date == "1/2/2007" | Data$Date == "2/2/2007",]

 sub$Date <- as.Date(sub$Date, "%d/%m/%Y")

# Create a new variable DateTime by merging Date and Time variables

sub$DateTime<- paste(sub$Date, sub$Time)

# Change the format of DateTime 

sub$DateTime <-  strptime(sub$DateTime, format ="%Y-%m-%d %H:%M:%S")

plot(sub$DateTime,sub$Global_active_power, type="l", ylab = "Global Active Power(kilowatts)", xlab="")

png(filename="plot2.png", width=480, height=480, bg="white")

dev.off()