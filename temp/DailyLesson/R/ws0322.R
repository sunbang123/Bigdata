setwd("c:/Rdata")
getwd()
#filter() in dply pkg
library(dplyr)
exam=read.csv("csv_exam.csv")
view(exam)
head(exam)
tail(exam)
#1반의 학생들만 추출하여라?
exam %>% filter(class==1)
exam %>% filter(class==2 | class==3)
#1반이 아닌 반을 모두 출력하라?
exam %>% filter(class != 1)

#수학점수가 50점 이상인 학생들만 출력하라?
exam %>% filter(math>=50)
#영어점수가 60점이상이고 수학점수가 80점이상 학생들을 추출하시오?
exam %>% filter(english>=60 & math>=80)
#영어점수가 90점 이상이거나 수학점수가 90점이상인 학생은?
exam %>% filter(english>=90 | math>=90)
#1반,3반,5반 학생들을 추출하시오.
exam %>% filter(class==1 | class==3 | class==5)
exam %>% filter(class %in%c(1,3,5))
#1반학생들의 수학점수 평균을 구하시오?
class1=exam %>% filter(class==1)
mean(class1$math)

# mpg 데이터셋 불러오기
library(ggplot2)
data(package="ggplot2")
setwd("c:/Rdata")
getwd()
exam=read.csv("csv_exam.csv")
head(exam) #6개를 읽어줌
dim(exam)#차원의 수를 알려줌
str(exam)#structure의 줄인말
summary(exam)#요약하여 주는 명령어

#mpg 데이터 불러오기
library(ggplot2)
data(package="ggplot2")
mpg=as.data.frame(ggplot2::mpg)
head(mpg)

class2=mpg %>% filter(displ<=4)
mean(class2$hwy)
class3=mpg %>% filter(displ>=5)
mean(class3$hwy)

# 정답: 4이하인 자동차의 연비가 평균적으로 더 높다.

#mpg 데이터 불러오기
library(ggplot2)
data(package="ggplot2")
mpg=as.data.frame(ggplot2::mpg)
head(mpg)

class2=mpg %>% filter(manufacturer=="audi")
mean(class2$cty)
class3=mpg %>% filter(manufacturer=="toyota")
mean(class3$cty)

# 정답: toyota의 연비가 평균적으로 더 높다.

#mpg 데이터 불러오기
library(ggplot2)
data(package="ggplot2")
mpg=as.data.frame(ggplot2::mpg)
head(mpg)

class2=mpg %>% filter(manufacturer=="chevrolet" | manufacturer=="ford" | manufacturer=="honda")
mean(class2$hwy)

# 정답: 22.50943

#select()에 대한 이야기?
exam %>% select(math,english,science,id)
#수학과목만 빼고 다 출력하라?
exam %>% select(-math,-english)
#dplyr함수의 조합?
#1반 학생들의 영어점수만 출력하라?
exam %>%
  filter(class==1) %>%
  select(math)
#id와 수학점수의 일부만 출력하라?
exam %>%
  select(id,math,english) %>% 
  head


# mpg 데이터 불러오기
library(ggplot2)
data(package="ggplot2")
mpg=as.data.frame(ggplot2::mpg)

# class와 cty 변수만 추출하여 새로운 데이터 만들기
class3=mpg %>% 
  arrange(class,cty)
# 새로운 데이터 출력하여 변수 확인하기
head(class3)

#arrange() in dplyr?
exam %>% 
  arrange(math)
exam %>% 
  arrange(desc(math))
#반별 오름차순으로 수학점수를 정렬하시오?
exam %>% 
  arrange(class,math) %>% 
  head

mpg %>% 
  filter(manufacturer=="audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)

#mutate() in dplyr
exam %>% 
  mutate(total=math+english+science) %>% 
  head
exam %>%
  mutate(total=english+math+science,
                mean=round(total/3,1)) %>% 
  head
exam %>% 
  mutate(test=ifelse(science>=60,"pass","fail")) %>% 
  head
#시험점수 총합을 파생변수로 만들어서 이를 내림차순으로 정렬?
exam %>% 
  mutate(total=math+english+science) %>% 
  arrange(desc(total))

library(ggplot2)
data(package="ggplot2")
mpg=as.data.frame(ggplot2::mpg)

# class와 cty 변수만 추출하여 새로운 데이터 만들기
class3=mpg %>% 
  arrange(hwy) %>% 
  head(5)

# 새로운 데이터 출력하여 변수 확인하기

library(ggplot2)
mpg=as.data.frame(ggplot2::mpg)
mpg %>% 
  mutate(total=cty+hwy,mean=round(total/2,1)) %>% 
  arrange(desc(mean)) %>% 
  head(3)

#집단별로 요약하기: summarise/summarize in dplyr
exam %>% 
  summarise(mean_math=mean(math),
            mean_english=mean(english),
            mean_science=mean(science))
#반별로 수학평균을 출력하라?
#그룹바이-서머라이즈
data.frame(exam %>% 
  group_by(class) %>% 
  summarise(mean_math=round(mean(math)),
            sum_math=sum(math),
            median_math=median(math)))
#mpg 데이터에서 제조사별 구동방식별 펑균도시연비를
#내림차순으로 정렬하여 탑10을 출력하라?
data.frame(mpg %>% 
  group_by(manufacturer,drv) %>% 
  summarise(mean_cty=round(mean(cty),1)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(10))
