z=matrix(1:12,3)
z[3,3]
z[2,c(2,3)]
z[c(-1,-3),]

#array?
y=array(1:48,c(4,3,4))
y

#Data Frame()
x1=c(24,18,31,25)
y1=c("F","M","F","F")
xy=data.frame(x1,y1)
xy
xy=data.frame(age=x1,gender=y1)
xy
xy_add=data.frame(age=32,gender="M")
xy_add
xy=rbind(xy,xy_add)
xy
xyz=cbind(xy,income=c(2000,3000,4000,1500,2500))
xyz[[1]]
xyz[1]
xyz[['age']]
xyz['age']
xyz$income
xyz
xyz[c(1,3)]
xyz[,c(1,3)]
xyz[c('age','income')]

a=c("a","b","c")
a
b=1:10
c=matrix(1:9,3)
c
class(f_gender)
class(xyz)
L=list(vec=a,b,mat=c,f_gender,df=xyz)
class(L)

data()
head(airquality)
data=airquality
head(data)
dim(data)
str(data)
tail(data)
names(data)
length(data)
x=scan()
24
35
28 21
x
y=scan()
24
35
28 21
y
y=sacn(what="character")
park kim jang
lee
jung
y

xyz=data.frame()
kk=edit(xyz)
kk$ht
kk$wt
data=read.csv("chickwts.csv")
dim(data)
kk
write.csv(kk,"women.csv",rome.names=F)
write.tale(kk,"kk.txt")
write.table(kk,"kk1.txt",row.names = F)

#vector다루기?
x=1:3
x
x=c(x,4,5)
x
y=6:8
x=c(x,y)
x
1:5
1.1:2.8
seq(0,5)
seq(1,10,by=2)
seq(0,1,length=5)
rep(1,5)
rep(c(1,2),5)
rep(c(10,20),c(2,3))

x=1:5
y=seq(2,10,2)
y
x+y
x+10
x
x*c(10,20)
#paste()
paste("BIG","Data",sep=":")
paste0("BIG","DATA","2023")

paste("BIG","DATA",2024:2030,sep="-")

#strsplit()
cities=c("Kookmin University,Korea","Penn State University,USA",
         "Tokyo University,JAPAN")
cities
cities=strsplit(cities,split=",")
cities
univ=c(cities[[1]][1],cities[[2]][1],cities[[3]][1])
univ
x="Kookmin University is close to Korea University"
x
gsub("University","Univ",x)
sub("University","Univ",x)
x
substr(x,5,7)
toupper("korea")
tolower("KOREA")

x=c(3,8,2)
y=c(5,4,2)
x>y
x==y
x!=y
x>2
x<=2 | x>4
any(x==5)
all(x==3)
x=1:100
sum(x>50)
mean(x>=30 & x<=60)

x=1:10
class(x)
is.numeric(x)
y=as.character(x)
y
is.numeric(y)
x=1:3
y=5:7
cbind(x,y)
rbind(x,y)

x=1:3
y=5:7
A=cbind(x,y)
A
B=rbind(x,y)
B
rownames(A)=c("R1","R2","R3")
A
colnames(B)=c("C1","C2","C3")
B

A=matrix(1:4,2)
B=matrix(5:8,2)
A
B
A*B
A%*%B
A
rowMeans(A)
colMeans(A)
apply(A,1,mean)
apply(A,2,mean)
apply(airquality,1,mean)
