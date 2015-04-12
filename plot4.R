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
par(mfrow = c(2, 2), # mar = c(3, 2, 2, 2), oma = c(0, 0, 0, 0)) 
    with(power.2days, {
      # Plot 1: Global Active Power
      plot(DateTime, as.numeric(as.character(Global_active_power)), main = "", xlab = "", 
           ylab = "Global Active Power", type="l")
      
      # Plot 2: Voltage
      plot(DateTime, as.numeric(as.character(Voltage)), main = "", ylab = "Voltage", type="l")
      
      # Plot 3: Energy sub metering
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
      legend("topright", legend = submeters, lty = 1, box.lty = 0, col = colors)

      # Plot 4: Global Reactive Power
      Global_reactive_power <- as.numeric(as.character(Global_reactive_power))
      plot(DateTime, Global_reactive_power, main = "", type="l")
  }
  )
)

dev.copy(png, file = "plot4.png")
dev.off()
