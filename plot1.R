# Read the data into Data object

Data <- read.table("household_power_consumption.txt", sep=";", header=TRUE,  na.strings=c("?", "NA"))

# Subset Data. We need only the data from 2 dates

sub <- Data[Data$Date == "1/2/2007" | Data$Date == "2/2/2007",]

# Save this plot into a PNG file with width of 480 pixels and height of 480 pixels


 png(filename="plot1.png", width=480, height=480,bg="white")

# Plot a histogram 

plot1 <- hist(sub$Global_active_power, main= "Global Active Power", xlab="Global Active Power", col="red")


 
 dev.off()
