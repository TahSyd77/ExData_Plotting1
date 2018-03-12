plot3<-function(){
        fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileurl,destfile="zipfile.zip")
        unzip("zipfile.zip")
        
        household_consumption<-read.table("household_power_consumption.txt",sep=";",skip=grep("1/2/2007|2/2/2007",
                readLines("household_power_consumption.txt")),nrows=2879,stringsAsFactors=FALSE)
        
        hhld_cons<-household_consumption
        hhld_cons$V1<-paste(household_consumption$V1,household_consumption$V2)
       
        hhld_cons$V1<-as.POSIXlt(hhld_cons$V1,format="%d/%m/%Y %H:%M:%S")
        
        par(mfrow=c(1,1))
        
        plot(hhld_cons$V1,hhld_cons$V7,type="l",xlab="",ylab="Energy sub metering")
        lines(hhld_cons$V1,hhld_cons$V8,type="l",col="red")
        lines(hhld_cons$V1,hhld_cons$V9,type="l",col="blue")
        
        legend("topright",col=c("black","red","blue"),lty=1, cex=.6,legend=c("Sub_metering_1    ","Sub_metering_2    ","Sub_metering_3    "))
        
        dev.copy(png,file="plot3.png",width=480,height=480)
        dev.off()
}