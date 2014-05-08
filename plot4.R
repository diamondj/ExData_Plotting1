##This function makes plot1 to a png file with resolution of 480 times 480
plot4 <-function()
{
    library(sqldf)
    str<- "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
    
    ##read the original file, mtach Dates between 1/2/2007 to 2/2/2007
    ##combine original Date and Time (time)
    ##strip time (timenew) and combine with the orignal data (Datanew)
    Data <- read.csv.sql("household_power_consumption.txt",  sql = str, sep =";")
    time <- paste(Data$Date, ";", Data$Time)
    timenew <- strptime(time, "%d/%m/%Y ; %H:%M:%S")
    Datanew <- cbind(Data, timenew)
    
    ##launch a png device and set parameters
    png("plot4.png", width = 480, height = 480, bg ="transparent")
    
    ## set 2 times 2 multiple plots
    par(mfrow = c(2,2))
    
    ## call plot function to draw the line and annotate (type="l" produces line connection)
    ## figure 1
    with(Datanew, plot(timenew, Global_active_power, type="l", ylab="Global Active Power", xlab=""))
    
    ## figure 2
    with(Datanew, plot(timenew, Voltage, type="l", ylab="Voltage", xlab="datetime"))
    
    
    ## figure 3
    ## add two more lines of sub metering 2 and 3 with function lines
    ## use colname from col 7 to 9 as the legend name
    ## annotate the legend with line type, color and lengend name with no legend frame
    with(Datanew, plot(timenew, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col= "black"))
    with(Datanew, lines(timenew, Sub_metering_2, col= "red"))
    with(Datanew, lines(timenew, Sub_metering_3, col= "blue"))
    word <- c(names(Data[7:9]))
    legend("topright", lty = c(1,1,1), col=c("black", "red", "blue"), legend=word, bty="n")
    
    ## figure 4
    with(Datanew, plot(timenew, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime"))
    ## close graphic device
    dev.off()
}