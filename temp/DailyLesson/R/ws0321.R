setwd("c:/Rdata")
getwd()
exam=read.csv("csv_exam.csv")
head(exam) #6개를 읽어줌
dim(exam)#차원의 수를 알려줌
str(exam)#structure의 줄인말
summary(exam)#요약하여 주는 명령어

#exam데이터에서 수학점수를 분석하라?
boxplot(exam$math,horizontal = T,col = 2)
quantile(exam$math)
#exam데이터에서 수학점수를 히스토그램으로 분석하라?
hist(exam$math,probability = T)
lines(density(exam$math),type='h',col=2,lwd=2)
#-30~40r구간의 데이터는 없음.

library(ggplot2)
data(package="ggplot2")

mpg=as.data.frame(ggplot2::mpg)
head(mpg)
table(mpg$drv)
table(mpg$class)
dim(mpg)
str(mpg)

summary(mpg)

#dplyr pkg:전처리 패키지?
install.packages("dplyr")
library(dplyr)
#변수명 바꾸기?
df_raw=data.frame(var1=c(1,2,1),
                  var2=c(2,3,2))
df_raw
df_new=rename(df_raw,v2=var2)
df_new

#문제1.ggplot2()의 mpg데이터를 사용하여 이를 변수명 mpg1으로 복사하여라?
mpg=as.data.frame(ggplot2::mpg)


#문제2.mpg1의 데이터중에서 cty는 city로, hwy는 highway로 변경하시오?
#문제3.이를 확인하시오.


#파생변수 만드는 방법?
exam$total=exam$math+exam$english+exam$science
head(exam)
exam$avg=round(exam$total/3,1)
head(exam)

#문제4.mpg의 통합연비를 total이라는 변수로 생성하라?
#(cty+hwy)/2=total
total=(cty+hwy)/2
#문제5.위의 내용으로 통합연비 변수(total)의 평균을 구하라?
mpg$total=(mpg$cty+mpg$hwy)/2
mean(mpg$total)
#문제6.통합연비를 가지고 중간이상에 대해 합격/불합격 기준의 test
#파생변수를 만들어라
summary(mpg$total)
mpg$test=ifelse(mpg$total>=20,"합격","불합격")
kk=table(mpg$test)
tt=barplot(kk,col=c('orange','blue'),ylim=c(0,140),las=2)
text(tt,kk,label=paste0(kk,"개"),pos=3,col='red',
     cex=2)#tt(x축) kk(y축)

#빠르게 시각화 하는 방법으로...qplot()
qplot(mpg$test)

#mpg의 total를 total>35 A, 30:B, 25:C, 20:D <20:F을
#변수grade로 파생변수로 생성하라?
mpg$grade=ifelse(mpg$total>35,"A",ifelse(mpg$total>30,"B",ifelse(mpg$total>25,"C",ifelse(mpg$total>20,"D","F"))))
#문제8.위의 내용을 막대그래프로 시각화 하라?
kk=table(mpg$grade)
tt=barplot(kk,col=rainbow(4),ylim = c(0,120))
text(tt,kk,label=paste0(kk,"개"),pos=3,col='red',cex = 1.5)

#문제9.mpg의 전체데이터를 표시하는 명령어는?
View(mpg)
#문제10.mpg의 grade의 빈도수를 나타내는 명령어는?
table(mpg$grade)
#문제11.quart별로 분류하는 명령어들을 아는대로 나타내라?
#1.summary
#2.boxplot
#3.quantile()
#문제12.패키지에서 데이터를 알아보는 명령어는?
#data(package=<"p/n">)
#문제13.빨리 그리는 ggplot2의 그래프함수는?
#qplot()
#문제14.외부의 .csv 데이터를 읽어오는 명령어는?
#read.csv("<.csv>")
#문제15.exam.csv파일을 외부로 작성하여 보내는 명령어는?
#write.csv(exam.csv,"exam.csv")

##Text Mining?
library(KoNLP)
install.packages("wordcloud")
library(wordcloud)
install.packages("wordcloud2")
library(wordcloud2)

txt=readLines("hong.txt",encoding="UTF-8")
nouns=sapply(txt,extractNoun,USE.NAMES=F)
class=(nouns)
nouns=unlist(nouns)
class(nouns)
nouns=Filter(function(x){nchar(x)>=2},nouns)
nouns
word=table(nouns)
kk=head(sort(word,decreasing = T),20)
tt=barplot(kk,col=rainbow(20),ylim = c(0,30),las=2)
text(tt,kk,label=paste0(kk,"개"),pos=3,col=2,cex = 1.5)
frame()
set.seed(1234)
rnorm(3)
palate=brewer.pal(9,"Set1")
wordcloud(names(word),#찍히는 문자열
          freq=word,#빈도수
          min.freq = 2,
          rot.per = 0.25,#전체대비 회전율
          random.order = F,#많은 빈도수는 중앙에 배치하는 옵션
          random.color = T,#색깔을 랜덤하게 배치하는 옵션
          color=palate
        )
wordcloud2(data=word,
           size=0.6,
           shape = 'diamond')
