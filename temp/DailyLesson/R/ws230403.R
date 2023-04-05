setwd("c:/Rdata")
getwd()
install.packages("treemap")
library(treemap)
data("GNI2014") #pkg 내의 데이터를 활성화하는 방법명령어임.
head(GNI2014)
treemap(GNI2014,#대륙-국가
        index=c("continent", "iso3"),
        vSize="population",#타일의 크기
        vColor="GNI", #타일의 컬러링방법
        type="value",
        #bg.labels="yellow",
        title="world's GNI")

#2.mosaicplot 시각화
head(mtcars)
mosaicplot(~gear+vs,data = mtcars,color=TRUE,
           main="Gear and Vs")
?mosaicplot()
mosaicplot(Titanic,main="Survival on the Titanic", color = TRUE)

library(ggplot2)
#3.histogram()
ggplot(iris,aes(x=Petal.Length))+
  geom_histogram(binwidth = 0.5)
x=rnorm(100,175,1)
hist(x,probability = T)
lines(density(x),type="h",col=2,lwd=2)
shapiro.test(x)
#4.boxplot()
x=rnorm(100)
boxplot(x,horizontal = T,col = 2)
x1=sample(0:100,80,replace=T)
boxplot(x1,horizontal = T,col=2)
#boxplot의 시각화는 이상치를 점검할때 많이 사용함.
mpg=as.data.frame(ggplot2::mpg)
kk=boxplot(mpg$hwy,horizontal = T,col = 2)
kk$stats

#Rtsne pkg: 데이터의 차원을 낮추고 이것으로 산점도를 작성하는 방법임.
install.packages("Rtsne")
library(Rtsne)
ds=iris[,-5]
ds
#중복데이터 제거?
dup=which(duplicated(ds))
dup
ds=ds[-dup,]
pca=prcomp(ds)
plot(pca)
ds.y=iris$Species[-dup]
tsne=Rtsne(ds,dims=2,perplexity=10)
df.tsne=data.frame(tsne$Y)
head(df.tsne)
ggplot(df.tsne,aes(x=x1,y=x2,color=ds.y))+
  geom_point(size=2)

#5. 지도시각화?
install.packages("ggmap")
library(ggmap)
register_google(key="AIzaSyC89exKe3F47BE4U2m0YhBvo6y_vDfgvww")
cen=as.numeric(geocode(enc2utf8("군포시")))
gc=geocode(enc2utf8("군포시"))
cen # 경도 위도
map=get_googlemap(center=cen,
                  zoom=9,
                  size = c(640,640),
                  maptype='roadmap',
                  marker=gc) #terrain/satellite'hybrid
ggmap(map)

#여러위치정보데이터를 가져와서 지도시각화 하는방법?
names=c("용두암","성산일출봉","정방폭포","중문관광단지",
        "한라산1100고지","차귀도")
addr=c("제주시 용두암길 15",
       "서귀포시 성산읍 성산리",
       "서귀포시 동홍동 299-3",
       "서귀포시 중문동 2614-1",
       "서귀포시 색달동 산1-2",
       "제주시 한경면 고산리 125")
gc=geocode(enc2utf8(addr))
gc
df=data.frame(name=names,
             lon=gc$lon,
             lat=gc$lat)
df
cen=c(mean(df$lon),mean(df$lat))
map=get_googlemap(center=cen,
                  maptype="roadmap",
                  zoom=10,
                  size=c(640,640),
                  marker=gc)
ggmap(map)
gmap=ggmap(map)
gmap+geom_text(data=df,
               aes(x=lon,y=lat),
               size=5,
               label=df$name)
geom_path()
names=c("남부기술교육원", "우리집")
addr=c("경기 군포시 고산로 589", "경기 군포시 산본로432번길 25")
gc=geocode(enc2utf8(addr))
gc
df=data.frame(name=names,
              lon=gc$lon,
              lat=gc$lat)
df
cen=c(mean(df$lon),mean(df$lat))
map=get_googlemap(center=cen,
                  maptype="roadmap",
                  zoom=16,
                  size=c(640,640),
                  marker=gc)
ggmap(map)
gmap=ggmap(map)
gmap+geom_text(data=df,
               aes(x=lon,y=lat),
               size=5,
               label=df$name)+
  geom_path(data=df,aes(x=lon,y=lat),lwd=1,col=2)

geocode(enc2utf8(addr))

#서울시 구청위치정보의 지도시각화?
getmap = get_googlemap("seoul")
ggmap(getmap)
loc=read.csv("서울시구청위치정보.csv",fileEncoding="CP949",header=T)
loc
kor=get_map("seoul",
            zoom=13,
            maptype="roadmap")
ggmap(kor)+geom_text(data=loc,
                      aes(x=LON,y=LAT+0.002,label=구청명,col=2),size=5)+
  geom_point(data=loc,
            aes(x=LON,y=LAT),size=2,alpha=1,col=1)
