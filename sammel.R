library(ggplot2)


#---plot mit multiplen linien

simple.df$unit<-as.factor(simple.df$unit)

mod<-lm(y~unit+x-1,data=simple.df)
cf<-data.frame(ic=mod$coef[1:30],sl=rep(mod$coef[31],30))

p<-ggplot(simple.df,aes(x,y))+
  geom_point(colour=simple.df$unit)+
  geom_abline(aes(intercept=ic,slope=sl),data=cf,color=unique(simple.df$unit),alpha=0.3)+
  geom_smooth(method="lm",formula=y~x,size=2,color="black")


p

#----- out files einlesen und darstellen

tmp<-scan("rifs.out",what="raw",sep="\n")
cr<-rep("\n",length(tmp))
cat(paste(tmp,cr,sep=""))


# my.scan<-function(file){
#   tmp<-scan(file,what="raw",sep="\n")
#   cr<-rep("\n",length(tmp))
#   out<-cat(paste(tmp,cr,sep="")) # cat: nur an konsole?
#   return(out)
# }


