## Plot3: Plotting Energy sub metering for 2 days 

# Working directory must be set appropiately.

# reads all and then extract 2 days data.
power.all <- read.csv("../data/household_power_consumption.txt", sep=";")
power.2days <- power.all[((as.Date(power.all$Date, format="%d/%m/%Y") >= "2007-02-01") & 
  (as.Date(power.all$Date, format="%d/%m/%Y") <= "2007-02-02")),]

# plotting "Energy sub metering"
quartz()
plot.new()
Sys.setlocale(category="LC_ALL", "en_US")

DateTime <- strptime (paste(power.2days$Date, power.2days$Time, " "), format="%d/%m/%Y %H:%M:%S  ") 

submeters <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colors <- c("black","red","blue")

# First line plotting
sub <- as.numeric(as.character(power.2days[, submeters[1]]))
plot(DateTime, sub, main = "", xlab = "", ylab = "Energy sub metering", 
     col = colors[1], type="l", ylim = range(sub))

# Other lines plotting
for (i in 2:3) {
  sub <- as.numeric(as.character(power.2days[, submeters[i]]))
  lines(DateTime, y = sub, col=colors[i])
}

# Adding legend
legend("topright", legend = submeters, lty = 1, col = colors)

dev.copy(png, file = "plot3.png")
dev.off()
