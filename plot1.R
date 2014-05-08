##This function makes plot1 to a png file with resolution of 480 times 480
plot1 <-function()
{
    library(sqldf)
    str<- "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
    
    ##read the original file, mtach Dates between 1/2/2007 to 2/2/2007
    Data <- read.csv.sql("household_power_consumption.txt",  sql = str, sep =";")
    
    ##launch a png device and set parameters
    png("plot1.png", width = 480, height = 480, bg ="transparent")
    
    ## call hist function to draw histogram and annotate
    hist(Data$Global_active_power, col ="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
    
    ## close graphic device
    dev.off()
}