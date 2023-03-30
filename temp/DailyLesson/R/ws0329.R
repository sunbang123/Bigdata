setwd("c:/Rdata")
getwd()
install.packages("foreign")
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

raw_welfare=read.spss(file = "Koweps_hpc10_2015_beta1.sav",
                      to.data.frame = T)
welfare=raw_welfare
head(welfare)
tail(welfare)
View(welfare)
welfare=rename(welfare,
               gender=h10_g3,#성별별
               birth=h10_g4,#태어난연도
               mariage=h10_g10,#혼인상태
               religion=h10_g11,#종교유무
               code_job=h10_eco9,#직종
               income=p1002_8aq1,#소득
               code_region=h10_reg7)#지역코드
welfare
#1.성별에 따른 월급차이를 분석하라?
#-데이터 타입을 체크함.
class(welfare$gender)
table(welfare$gender)
welfare$gender=ifelse(welfare$gender==9,NA,welfare$gender)
table(is.na(welfare$gender))
welfare$gender=ifelse(welfare$gender==1,"male","female")
kk=table(welfare$gender)
tt=barplot(kk,col=rainbow(2),ylim=c(0,10000))
text(tt,kk,label=paste0(kk,"명"),pos=3,col=2,cex=2)
frame()
#income의 변수타입체크?
class(welfare$income)
summary(welfare$income)
qplot(welfare$income)
welfare$income=ifelse(welfare$income %in%c(0,9999),NA,welfare$income)
table(is.na(welfare$income))

gender_income=data.frame(welfare %>% 
                           filter(!is.na(income)) %>% 
                           group_by(gender) %>% 
                           summarise(mean_income=round(mean(income))))
gender_income

ggplot(data=gender_income,aes(x=gender,y=mean_income))+
  geom_col(fill=c("red","blue"))+
  geom_text(aes(label=paste(gender_income$mean_income,"만원")),
            vjust=-0.2,col=2,cex=8)

#2.나이와 월급의 관계--몇살때 월급을 가장많이 받을까?
class(welfare$birth)
summary(welfare$birth)           
qplot(welfare$birth)
table(is.na(welfare$birth))
welfare$birth=ifelse(welfare$birth==9999,NA,welfare$birth)
table(is.na(welfare$birth))
welfare$age=2015-welfare$birth+1
summary(welfare$age)
qplot(welfare$age)
age_income=data.frame(welfare %>% 
                        filter(!is.na(income)) %>% 
                        group_by(age) %>% 
                        summarise(mean_income=round(mean(income))))
age_income
kk=ggplot(data=age_income,aes(x=age,y=mean_income))+
  geom_line()
install.packages("plotly")
library(plotly)
ggplotly(kk)

#3.연령대에 따른 월급차이-어떤연령대가 월급이 가장많을까?
welfare$ageg=ifelse(welfare$age<30,"young",
                    ifelse(welfare$age<=59,"middle","old"))
kk=table(welfare$ageg)
tt=barplot(kk,col=rainbow(3),ylim=c(0,7000))
text(tt,kk,label=paste0(kk,"명"),pos=3,col=2,cex=2)
frame()
ageg_income=data.frame(welfare %>% 
                         filter(!is.na(income)) %>% 
                         group_by(ageg) %>% 
                         summarise(mean_income=round(mean(income))))
ageg_income
kk=ggplot(data=ageg_income,aes(x=reorder(ageg,mean_income),y=mean_income))+
  geom_col(fill=rainbow(3))+
  geom_text(aes(label=paste(ageg_income$mean_income,"만원")),
            vjust=-0.2,col=2,cex=8)
ggplotly(kk)

#4.연령대 및 성별 월급차이-성별월급차이는 연령대별로 다른지?
summary(welfare$income)
gender_income
kk_income=as.data.frame(welfare %>% 
                          filter(!is.na(income)) %>% 
                          group_by(ageg,gender) %>% 
                          summarise(mean_income=round(mean(income))))
kk_income
ggplot(data=kk_income,aes(x=ageg,y=mean_income,fill=gender))+
  geom_col(position="dodge")+
  scale_x_discrete(limits=c("young","middle","old"))
#4.1나이및 성별 월급차이 분석하기
gender_age=data.frame(welfare %>% 
                        filter(!is.na(income)) %>% 
                        group_by(age,gender) %>% 
                        summarise(mean_income=round(mean(income))))
gender_age
tt=ggplot(data=gender_age,aes(x=age,y=mean_income,col=gender))+
  geom_line()
ggplotly(tt)

#직업별 월급차이?
names(welfare)
table(is.na(welfare$code_job))

list_job=data.frame(read_excel("Koweps_Codebook.xlsx", sheet=2))
head(list_job)
welfare=left_join(welfare,list_job,by="code_job")
welfare$job
welfare %>% 
  filter(!is.na(welfare$job)) %>% 
  select(code_job,job) %>% 
  head(10)

table(is.na(welfare$income))
table(is.na(welfare$job))

job_income=data.frame(welfare %>% 
                        filter(!is.na(income)&!is.na(job)) %>% 
                        group_by(job) %>% 
                        summarise(mean_income=round(mean(income))))
job_income
top10=job_income %>% 
  arrange(desc(mean_income)) %>% 
  head(10)
top10

#시각화?

ggplot(data=top10,aes(x=job,y=mean_income))+
  geom_col(fill=rainbow(10))+
  coord_flip()+
  geom_text(aes(label=paste(top10$mean_income, "만원")),hjust=-0.002,
            col=2,cex=5)

#소득의 하위10위 추출?
bottom10=job_income %>% 
  arrange(mean_income) %>% 
  head(10)
bottom10

ggplot(data=bottom10,aes(x=reorder(job,-mean_income),y=mean_income))+
  geom_col(fill=rainbow(10))+
  coord_flip()+
  geom_text(aes(label=paste(bottom10$mean_income,"만원")),hjust=-0.002,
            col=2,cex=5)
#성별직업빈도?
job_male=data.frame(welfare %>% 
                      filter(!is.na(job)&gender=='male') %>% 
                      group_by(job) %>% 
                      summarise(count=n()) %>% 
                      arrange(desc(count)) %>% 
                      head(10))
job_male

ggplot(data=job_male,aes(x=reorder(job,count),y=count))+
  geom_col(fill=rainbow(10))+
  coord_flip()+
  geom_text(aes(label=paste(job_male$count,"명")),
            hjust=-0.02,col=2,cex=5)
job_male

job_female=data.frame(welfare %>% 
                        filter(!is.na(job)&gender=='female') %>% 
                        group_by(job) %>% 
                        summarise(count=n()) %>% 
                        arrange(desc(count)) %>% 
                        head(10))
job_female

ggplot(data=job_female,aes(x=reorder(job,count),y=count))+
  geom_col(fill=rainbow(10))+
  coord_flip()+
  geom_text(aes(label=paste(job_female$count,"명")),
            hjust=-0.02,col=2,cex=5)
job_female


#지역별 연령대 비율?-노년층이 많은 지역은 어디일까?
table(welfare$code_region)
list_region=data.frame(code_region=c(1:7),
                       region=c("서울","수도권(인천/경기)",
                                "부산/경남/울산","대구/경북",
                                "대전/충남","강원/충북",
                                "광주/전남/전북/제주도"))
list_region
welfare=left_join(welfare,list_region,by="code_region")
table(welfare$region)

region_ageg=data.frame(welfare %>%
                         group_by(region,ageg) %>%
                         summarise(count=n()) %>% 
                         mutate(tot_group=sum(count),
                                pct=round(count/tot_group*100),2))
head(region_ageg)
417/1257*100

#시각화?
tt=ggplot(data=region_ageg,aes(x=region,y=pct,fill=ageg))+
  geom_col()+
  coord_flip()
library(plotly)
ggplotly(tt)

#평균과 중앙값?
x=c(1,3,4,5,7)
sum(x)
length(x)
sum(x)/length(x)
mean(x)
median(x)
x=c(5,7,1,3,4,8)
sort(x)
median(x)

x
quantile(x)
boxplot(x,horizontal = T,col=2)
