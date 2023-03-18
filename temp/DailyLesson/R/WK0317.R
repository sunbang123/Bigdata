setwd("c:/Rdata")
getwd()
speed=c(12,24,33,35,45,9)
speed[5]
a<-12
b=15
a+b

mean(speed)
x=rnorm(100,0,1)
x
hist(x,probability = T)
lines(density(x),type = 'h',col=2,lwd=2)

shapiro.test(x)

frame()

5+8
3+(4*5)
a<-10
print(a)
b=20
b

install.packages("ggplot2")
library(ggplot2)
data(package="ggplot2")
mpg=as.data.frame(ggplot2::mpg)
mpg

2+3
(3+6)*8
2^3
10%%3 # 나머지
10/3
10%/%3 # 몫

log(10)
sqrt(4)
max(5,4,3,1)
log(10,base=10)
abs(-100)
factorial(6)
sin(30)
sin(90)
sin(pi/2)
sin(pi/6)
a=10
b=20
c <- a+b
c
str=c('jang','kim','lee')
str
a=c(TRUE,TRUE,FALSE)
a
b=c(3,4,NA,5)
b
sum(b)
c=c(3,4,NULL,5)
c
sum(c)
sqrt(-3)

a=10
b=20
a+b
a='A'
a
a+b

wt=c(56,67,84,63,65,56,49,90)
length(wt)
mean(wt)
sum(wt)

x=c(1:3)
x
y=c("a","b","c")
y[2]
z=c(TRUE,TRUE,FALSE,FALSE)
z[2]

w=c(1,2,3,4,"a")
v1=10:15
v1[6]
v1=c(10:15)
v1
v2=c(1,2,3,50:60)
v2
v3=seq(1,101,3)
v3
v3=seq(1,10,1)
v3
v3=seq(0,1,0.1)
v3
rep(1,5)
rep(1:3,4)

score=c(90,80,70)
names(score)
names(score)=c("jang","tom","lee")
score
names(score)

d=c(1,4,3,7,8)
d
d[c(1,3,5)]
d[1:3]
d[seq(1,5,2)]
d[-2]
d[-c(3:5)]


d
2*d
d-5
3*d+4

x=1:3
y=4:6
x
y
x+y
x*y
z=x+y
z
a=c(1,2)
x
a
x+a

d=1:10
d
sum(d)
length(d)
mean(d)
max(d)
min(d)
sort(d)
sort(d,decreasing = T)
median(d)
a=c(1,3,7,4,2,6)
median(a)
sort(a)

y=function(x){
  return (x+10)
}
y(5)
?sort()

a=1:100
sum(a>50) # TRUE가 1이고 FALSE가 0이기 때문에.
mean(a>50) # 총 갯수가 100이라서!

ds=c(90,85,70,84)
ds

my.info=list(name='Tom',age=60,status=TRUE,score=ds)
my.info
bt=c('A','B','B','O','AB','A')
bt
bt_new=factor(bt)
bt_new
is.factor(bt_new)
is.vector(bt)
levels(bt_new)

#KoNLP패키지 설치
install.packages("multilinguer")
library(multilinguer)
install_jdk()
install.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type = "binary")
install.packages("remotes")
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
library(KoNLP) #최종적으로 "KoNLP" 패키지를 불러옵니다
extractNoun("나는 남부교육원의 빅데이터 담당 장영완 교수 입니다.")

data()
head(airquality,3)
tail(airquality)
str(airquality) # 데이터의 구조
names(airquality)
dim(airquality)
View(airquality)
nrow(airquality)
