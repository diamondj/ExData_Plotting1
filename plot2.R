##This function makes plot1 to a png file with resolution of 480 times 480
plot2 <-function()
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
    png("plot2.png", width = 480, height = 480, bg ="transparent")
    
    ## call plot function to draw the line and annotate (type="l" produces line connection)
    with(Datanew, plot(timenew, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
    
    ## close graphic device
    dev.off()
}