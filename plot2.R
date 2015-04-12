## Plot2: Plotting Global Active Power for 2 days 

# Working directory must be set appropiately.

# reads all and then extract 2 days data.
power.all <- read.csv("../data/household_power_consumption.txt", sep=";")
power.2days <- power.all[((as.Date(power.all$Date, format="%d/%m/%Y") >= "2007-02-01") & 
  (as.Date(power.all$Date, format="%d/%m/%Y") <= "2007-02-02")),]

# plotting "Global Active Power"
quartz()
plot.new()
Sys.setlocale(category="LC_ALL", "en_US")

Global_Active_Power <- as.numeric(as.character(power.2days$Global_active_power))
DateTime <- strptime (paste(power.2days$Date, power.2days$Time, " "), format="%d/%m/%Y %H:%M:%S  ") 
plot(DateTime, Global_Active_Power, main = "", xlab = "", ylab = "Global Active Power (kilowatts)", type="l")
# Searching measures to replace the x aixs as c("Thu","Fri","Sat"), 


dev.copy(png, file = "plot2.png")
dev.off()
