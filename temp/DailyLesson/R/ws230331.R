setwd("c:/Rdata")
getwd()
x=c(5,4,3,NA,10)
sum(x,na.rm=T)
mean(x,na.rm=T)
table(is.na(x))

head(iris)
iris[1,2]<-NA
head(iris)
iris[1,3]=NA
head(iris)
x=iris
head(x)
x[6,2]=NA
for(i in 1:ncol(x)){
  this=is.na(x[,i])
  cat(colnames(x)[i],"\t",sum(this),"\n")
}
data()
names(attitude)
nrow(attitude)
dim(attitude)
apply(attitude,1,sum)
head(attitude)
head(x)

col_na=function(y){
  return(sum(is.na(y)))
}
na_count=apply(x,2,FUN=col_na)
na_count
rowSums(attitude)
apply(attitude,1,sum)
colSums(attitude)
apply(attitude,2,sum)
mpg=as.data.frame(ggplot2::mpg)
head(mpg)
kk=boxplot(mpg$hwy)
kk$stats
mpg$hwy=ifelse(mpg$hwy>37,NA,mpg$hwy)
table(is.na(mpg$hwy))
mean(mpg$hwy,na.rm=T)
data=mpg$hwy
summary(data)
data=na.omit(data)
summary(data)
x=c(sample(1:100,20))
sort(x)
sort(x,decreasing = T)
x=c(sample(1:10,5,replace=F))
x
sort(x)
order(x,decreasing = T)
iris
rm(list=ls())
head(iris)

sp=split(iris,iris$Species)
sp
summary(sp)

subset(iris,Species=="setosa")
subset(iris,Sepal.Length>7.5)
subset(iris,iris$Petal.Length>6.0)
subset(iris,Sepal.Length>7.6,
       select = c(Petal.Length,Petal.Width))

x=sample(1:100,size=10,replace = F)
x
nrow(iris)
idx=sample(1:nrow(iris),size=nrow(iris)*0.7,replace=F)
idx
iris_train=iris[idx,]
nrow(iris_train)
iris_train
iris_test=iris[-idx,]
nrow(iris_test)


set.seed(6054)
rnorm(3)

sample(1:10,3,replace=F)
combn(1:5,3)
combn(1:3,2)

x=c("red","green","blue","black","white")
x
com=combn(x,2)
com
for(i in 1:ncol(com)){
  cat(com[,i],"\n")
}

#데이터의 집계?
agg=aggregate(iris[,-5],by=list(중간값=iris$Species),
              FUN=median)
agg
iris[,-5]
mtcars
agg=aggregate(mtcars,by=list(cyl=mtcars$cyl,vs=mtcars$vs),FUN=max)
agg

x=data.frame(name=c("a","b","c"),
             math=c(90,80,40))
x
y=data.frame(name=c("a","b","d"),
             korean=c(75,60,90))
y
z=merge(x,y,by=c("name"))
z
merge(x,y,all.x=T)
merge(x,y,all.y=T)
merge(x,y,all=T)

x=data.frame(name=c("a","b","c"),
             math=c(90,80,40))
x
y=data.frame(sname=c("a","b","d"),
             korean=c(75,60,90))
y
merge(x,y,by.x=c("name"),by.y=c("sname"))


install.packages("ggmap")
library(ggmap)
register_google(key="AIzaSyC89exKe3F47BE4U2m0YhBvo6y_vDfgvww")
cen=as.numeric(geocode(enc2utf8("서울시")))
map=get_googlemap(center = cen)
ggmap(map)

cen=as.numeric(geocode(enc2utf8("군포시고산로589")))
map=get_googlemap(center = cen,
                  zoom=17,
                  size=c(640,640),
                  maptype = "satellite")
ggmap(map)

