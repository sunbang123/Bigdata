setwd("c:/Rdata")
getwd()
data()
head(iris)
table(iris$Species)
plot(iris$Sepal.Length)

names(mtcars)
head(mtcars)
wt=mtcars$wt
hist(wt,breaks=3,probability = T)
lines(density(wt),type='h',col=2,lwd=2)
plot(wt,col=ifelse(wt>3.2,2,1),pch=ifelse(wt>3.2,10,25),
     xlab="x축",
     ylab="y축",main="제목")
abline(h=3.2,col=2,lwd=5)
mean(wt)

names(mtcars)
vars=c("mpg","disp","drat","wt")
vars
target=mtcars[,vars]
head(target)
pairs(target,
      main="Multi Plot")

head(iris)
iris2=iris[,3:4]
head(iris2)
point=as.numeric(iris$Species)
point
table(iris$Species)
color=c("red","green","blue")
plot(iris2,
    main="iris plot",
    pch=c(point),col=color[point])

#상관계수?
beers=c(5,2,9,8,3,7,3,5,3,5)
bal=c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07,0.06,0.02,0.05)
tbl=data.frame(beers,bal)
tbl
aa=plot(bal~beers,data=tbl)
aa=lm(bal~beers,data=tbl)
abline(aa,col=2)
cor(beers,bal)
summary(aa)

#선그래프?
month=c(1:12)
month[2]
month[10]
month
late=c(5,8,7,9,4,6,12,13,8,6,6,4)
late
plot(month,late,
     main="지각생통계",
     type="l",
     lty=1,
     lwd=1,
     xlab="Month",ylab="Late cnt")
lines(month,late2,
      type='b',col="blue")

#자료탐색?
install.packages("mlbench")
library(mlbench)
data("BostonHousing")
myds=BostonHousing[,c("crim", "rm", "dis", "tax", "medv")]
head(myds)
summary(myds$medv)
nrow(myds)
grp=c()
for(i in 1:nrow(myds)){
  if(myds$medv[i]>=25.0){
    grp[i]='H'
  }else if(myds$medv[i]<=17.0){
    grp[i]='L'
  }else{
    grp[i]='M'
  }
}
class(grp)
grp=as.factor(grp)
grp=factor(grp,levels=c("H","M","L"))
myds=data.frame(myds,grp)
myds

kk=table(myds$grp)
class(myds)

str(myds)
tt=barplot(kk,col=rainbow(3),ylim=c(0.270))
text(tt,kk,label=paste0(kk,"개"),pos=3,col=2,cex=2)
frame()

frame()
par(mfcol=c(2,3))
for(i in 1:5){
  hist(myds[,i],main=colnames(myds)[i],col="yellow")
}
colnames(myds)
par(mfrow=c(2,3))
for(i in 1:5)
  hist(myds[,i],main=colnames(myds)[i],col="yellow")

plot.new()
par(mfrow=c(2,3))
for(i in 1:5){
  boxplot(myds[,i],main=colnames(myds)[i],col="red")
}
par(mfrow=c(1,1))
frame()
boxplot(myds$crim~myds$grp)
boxplot(myds$rm~myds$grp)
boxplot(myds$tax~myds$grp)
boxplot(myds$dis~myds$grp)
head(myds)
