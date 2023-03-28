setwd("c:/Rdata")
getwd()
#데이터정제?
df=data.frame(gender=c("M","F",NA,"M","F"),
              score=c(5,4,3,4,NA))
df
#NA:결측치:어떤내용인지 모르는 데이터.
x=c(1,3,4,NULL,5)#NA vs NULL은 상호 다름.
sum(x)
mean(x)
df
is.na(df)
table(is.na(df))
table(is.na(df$gender))
table(is.na(df$score))

mean(df$score,na.rm = T)
sum(df$score,na.rm = T)

#전처리함수인dplyr pkg활용?
library(dplyr)
aa=df %>% 
  filter(!is.na(score))
mean(aa$score)
sum(aa$score)


bb=df %>% 
  filter(!is.na(gender) & !is.na(score))
bb
df
na.omit(df) #na가포함된것은 다제거됨.
df
mean(df$score,na.rm=T)

#외부데이터불러오기?
exam=read.csv("csv_exam.csv")
exam[c(3,8,15),"math"]=NA
exam %>% 
  summarise(mean_math=mean(math,na.rm=T),
            sum_math=sum(math,na.rm=T),
            median_math=median(math,na.rm=T))
#median?
x=c(sample(1:20,10,replace=F))
x
median(x)
sort(x)
exam
#결측치를 평균값으로 대체하기?
mean(exam$math,na.rm=T)
exam$math=ifelse(is.na(exam$math),55,exam$math)
exam
mean(exam$math)

mpg=as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),"hwy"]=NA
#Q1.
table(is.na(mpg$drv))
table(is.na(mpg$hwy))
#Q2.
mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy))


#이상한데이터를 처리?
outlier=data.frame(gender=c(1,2,1,3,2,1),
                   score=c(5,4,3,4,2,6))
outlier$gender=ifelse(outlier$gender==3,NA,outlier$gender)
outlier$score=ifelse(outlier$score==6,NA,outlier$score)
outlier
#outlier파일에서na를 제거하고 성별로 스코어평균을 제시하라?
data.frame(outlier %>% 
             filter(!is.na(gender) & !is.na(score)) %>% 
             group_by(gender) %>% 
             summarise(mean_score=mean(score)))

#또다른 데이터를 정제하는 방법?
##boxplot을 이용함.
mpg=data.frame(ggplot2::mpg)
hist(mpg$hwy,probability = T)
lines(density(mpg$hwy),type='h',col=2,lwd=2)
boxplot(mpg$hwy,horizontal = T,col=2)
IQR(mpg$hwy)
1.5*9
quantile(mpg$hwy)
18-13.5
27-18
9*1.5
boxplot(mpg$hwy)$stats
mpg$hwy=ifelse(mpg$hwy<12 | mpg$hwy>37,NA,mpg$hwy)
table(is.na(mpg$hwy))

x=sample(10:20,9,replace=F)
x
boxplot(x)
quantile(x)
IQR(x)
13-(1.5*IQR(x))


#mpg안에 불순물이 있을때 처리?
mpg=as.data.frame(ggplot2::mpg)
class(mpg)
table(mpg$drv)
mpg[c(10,14,58,93),"drv"]="k"
mpg[c(29,43,129,203),"cty"]=c(3,4,39,42)
mpg$drv=ifelse(mpg$drv %in%c("4","f","r"),mpg$drv,NA)
table(is.na(mpg$drv))
#Q2.
boxplot(mpg$cty)$stats
mpg$cty=ifelse(mpg$cty<9 | mpg$cty>26,NA,mpg$cty)
table(is.na(mpg$cty))
boxplot(mpg$cty)
#Q3
data.frame(mpg %>% 
             filter(!is.na(cty) & !is.na(drv)) %>% 
             group_by(drv) %>% 
             summarise(mean_cty=mean(cty)))

#ggplot2 pkg?
library(ggplot2)
mpg=data.frame(ggplot2::mpg)
head(mpg)
#aes:axes(축)
ggplot(data=mpg,aes(x=displ,y=hwy))+
  geom_point()+
  xlim(3,6)+
  ylim(10,30)

#ggplot의 막대그래프표현?
#mpg데이터에서 구동타입별로 평균고속도로연비를 출력하고 시각화하라?
df_mpg=data.frame(mpg %>% 
                    group_by(drv) %>% 
                    summarise(mean_hwy=round(mean(hwy))))
df_mpg
ggplot(data=df_mpg,aes(x=reorder(drv,-mean_hwy),y=mean_hwy))+
  geom_col(fill=rainbow(3))+
  geom_text(aes(label=paste(mean_hwy,"mpg")),vjust=-0.2,col=2,cex=8)

#막대그래프의 또다른 표현으로는 geom_bar()도 있음.
##이는 카운터를 그릴때 주로 사용함.
ggplot(data=mpg,aes(x=drv))+
  geom_bar()

ggplot(data=mpg,aes(x=cty))+
  geom_bar()

ggplot(data=mpg,aes(x=hwy))+
  geom_bar()


# suv차종의 도시 연비를 가진 데이터를 추출!
ggplot(data = mpg[mpg$class == "suv",] %>% # 파이프 연산자는 앞서 계산한 값을 다음 함수로 전달.
         group_by(manufacturer) %>% #회사별로 데이터를 그룹화합니다.
         summarize(avg_cty = mean(cty)) %>% #각 그룹에서 cty(도시 연비)의 평균을 계산합니다.
         arrange(desc(avg_cty)) %>% # 평균도시연비가 높은 순으로 정렬합니다.
         head(5), #상위 5개의 데이터만 선택합니다.
       aes(x = reorder(manufacturer, avg_cty), y = avg_cty)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(x = "Manufacturer", y = "Average City MPG") +
  ggtitle("Top 5 SUV manufacturers with the highest city MPG")


#Q1
df=data.frame(mpg %>% 
                filter(class=="suv") %>% 
                group_by(manufacturer) %>% 
                summarise(mean_cty=round(mean(cty))) %>% 
                arrange(desc(mean_cty)) %>% 
                head(5))
df


ggplot(data=df,aes(x=reorder(manufacturer,-mean_cty),y=mean_cty))+
  geom_col(fill=rainbow(5))+
  geom_text(aes(label=paste(mean_cty,"mpg")),vjust=-0.2,col=2,cex=8)


