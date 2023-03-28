setwd("c:/Rdata")
getwd()
#데이터 합치기?
require(dplyr)
test1=data.frame(id=c(1,2,3,4,5),
                 midterm=c(60,80,70,90,85))
test1
test2=data.frame(id=c(1:5),
                 final=c(70,83,65,95,80))
test2
total=left_join(test1,test2,by="id")
total

#다른데이터를 이용해 변수추가하기?
exam=read.csv("csv_exam.csv")
exam
name=data.frame(class=c(1:5),
                teacher=c("kim","jang","lee","park","jeung"))
name
exam_new=left_join(exam,name,by="class")
View(exam_new)
#세로로 합치기?
group_a=data.frame(id=c(1:5),
                   test=c(60,80,70,90,85))
group_a
group_b=data.frame(id=c(6:10),
                   test=c(70,83,65,95,80))
group_b
group_all=bind_rows(group_a,group_b)
group_all
#HW
mpg=data.frame(ggplot2::mpg)
table(mpg$fl)
fuel=data.frame(fl=c("c","d","e","p","r"),
                price=c(2.35,2.38,2.11,2.76,2.22))
mpg_new=left_join(mpg,fuel,by="fl")
mpg_new$price
mpg_new %>% 
  select(model,fl,price) %>% 
  head(5)

#1.조건에 맞는 데이터만 추출하기 :filter()
#2.여러조건을 동시충족 :filter()
#3.필요한 변수만 출력 :select()
#4.순서대로 정렬하기: arrange()
#5.파생변수 추가하기:mutate()
#6.집단별로 요약하기:group by ~ summarise()
#7.데이터 합치기:가로/세로-left_join()/bind_rows()


midwest=data.frame(ggplot2::midwest)
head(midwest)
midwest=midwest %>% 
  mutate(child_ratio=round((poptotal-popadults)/poptotal*100,1))
head(midwest$child_ratio)
midwest %>% 
  arrange(desc(child_ratio)) %>% 
  select(county,child_ratio) %>% 
  head(5)
midwest=midwest %>% 
  mutate(grade=ifelse(child_ratio>=40,"larage",
                      ifelse(child_ratio>=30,"middle","small")))
kk=table(midwest$grade)
tt=barplot(kk,col=rainbow(3),ylim=c(0,430))
text(tt,kk,label=paste0(kk,"건"),pos=3,col=2,cex=2)

midwest %>% 
  mutate(ratio_asian=(popasian/poptotal*100)) %>% 
  arrange(ratio_asian) %>% 
  select(state,county,ratio_asian) %>% 
  head(10)


#crawling?
##인터넷싸이트에서 원하는 정보를 가져오는 방법?
##필요한 패키지? rvest(read_html html_nodes html_text
##/ stringr(trim...)
install.packages("rvest")
install.packages("stringr")
library(rvest)
library(stringr)
title=c()
press=c()
time=c()
url1=c()

url="https://news.daum.net/breakingnews?page="

t_css="#mArticle .tit_thumb .link_txt"
pt_css=".info_news"
b_css=".desc_thumb .link_txt"

for(i in 1:100){
  cr_url=paste0(url,i)
  
  hdoc=read_html(cr_url)
  t_node=html_nodes(hdoc,t_css)
  pt_node=html_nodes(hdoc,pt_css)
  b_node=html_nodes(hdoc,b_css)
  
  title_part=html_text(t_node)
  pt_part=html_text(pt_node)
  time_part=str_sub(pt_part,-5)
  press_part=str_sub(pt_part,end=-9)
  url_part=html_attr(t_node,"href")
  
  title=c(title,title_part)
  press=c(press,press_part)
  time=c(time,time_part)
  urlx=c(url1,url_part)
}
news1=data.frame(title,press,time,urlx)
View(news1)
write.csv(news1,"news1.csv",fileEncoding = "CP949")


#창세기 크롤링?
cnt=c()
url="https://www.bskorea.or.kr/bible/korbibReadpage.php?version=GAE&book=gen&chap="
t_css="#tdBible1 span"

for(i in 1:50){
  cr_url=paste0(url,i)
  hdoc=read_html(cr_url)
  n_css=html_nodes(hdoc,t_css)
  cnt_part=html_text(n_css)
  cnt_part=gsub("\\d+","",cnt_part)
  cnt_part=str_trim(cnt_part,side="both")
  cnt=c(cnt,cnt_part)
  
}
library(KoNLP)
txt=sapply(cnt,extractNoun,USE.NAMES = F)
class(txt)
txt=unlist(txt)
class(txt)
txt
word=Filter(function(x){nchar(x)>=2},txt)
word
word=table(word)
word
kk=head(sort(word,decreasing = T),20)
kk
frame()
tt=barplot(kk,col=rainbow(20),ylim=c(0,270),las=2)
text(tt,kk,label=paste0(kk,"개"),pos=3,col=2,cex=1.5)

library(wordcloud)
display.brewer.all()
palate=brewer.pal(9,"Set1")
wordcloud(names(word),#단어의내용들
          freq=word,
          min.freq=2,
          rot.per = 0.25,
          scale = c(5,0.5),#폰트의 크기
          random.order = F,#단어들이 많은것이 중심에.
          random.color = T,
          colors=palate)
library(wordcloud2)
wordcloud2(data=word,
           size=0.4,
           shape="star")

