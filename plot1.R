## Plot1 Histogram

# Working directory must be set appropiately.

# reads all and then extract 2 days data.
power.all <- read.csv("../data/household_power_consumption.txt", sep=";")
power.2days <- power.all[((as.Date(power.all$Date, format="%d/%m/%Y") >= "2007-02-01") & 
  (as.Date(power.all$Date, format="%d/%m/%Y") <= "2007-02-02")),]

# plotting "Global Active Power"
Global_Active_Power <- as.numeric(as.character(power.2days$Global_active_power))
hist(Global_Active_Power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
