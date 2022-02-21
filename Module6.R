install.packages("tidyverse")
library(tidyverse)
ipl <- read.csv("deliveries.csv")
match <- read.csv("matches.csv")
summary(ipl)
summary(match)
str(ipl)
str(match)
match$umpire3 <- NULL
match$city <- as.character(match$city)
match$umpire1 <- as.character(match$umpire1)
match$umpire2 <- as.character(match$umpire2)
install.packages("ggplot2")
library(ggplot2)
library(magrittr)
summary(ipl$batting_team)
summary(ipl$bowling_team)
length(which(is.na(ipl)))  
length(which(is.na(matches)))  
ipl$wickets <- as.numeric(ifelse(ipl$player_dismissed=="","",1))
ipl$wickets
high_run <- ipl %>% group_by(batsman) %>% summarize(total_runs=sum(batsman_runs)) %>%
  arrange(desc(total_runs)) %>% ungroup() %>% head(10) 
ggplot(data=high_run,aes(x=reorder(batsman,total_runs),y=total_runs)) +
  geom_bar(stat="identity",fill="gray62") +
  coord_flip() +
  geom_text(aes(label=total_runs,hjust=1)) +
  labs(title="Highest run getters in IPL",x="Batsman",y="Runs") +
  theme_bw()
library(dplyr)
high_wkts <- ipl %>% 
  group_by(bowler) %>% 
  summarize(wkts=sum(wickets,na.rm=T)) %>%
  arrange(-wkts) %>%
  head(10)
match <- rename(match,match_id=id)
ipl_data <- ipl %>% left_join(match,by=c("match_id"))
ggplot(data=high_bat,aes(x=season,y=total_runs,fill=batsman)) +
  geom_bar(stat="identity") +
  coord_flip() +
  geom_text(aes(label=batsman,hjust=1)) +
  labs(title="Top run scorers by season",x="Seasons",y='Total Runs') +
  theme_bw()
ggplot(data=high_wkts,aes(x=reorder(bowler,wkts),y=wkts)) +
  geom_bar(stat="identity",fill="green2") +
  coord_flip() +
  geom_text(aes(label=wkts,hjust=1)) +
  labs(title="Highest wicket takers in IPL",x="Bowlers",y="Total Wickets") +
  theme_bw()
match$match_result_after_toss_win <- ifelse(as.character(match$toss_winner)==as.character(match$winner),"Win","Loss")
match$match_result_after_toss_win
ggplot(match[which(!is.na(match$match_result_after_toss_win)),],aes(match_result_after_toss_win, fill = match_result_after_toss_win))+ 
  geom_bar()+
  labs(x="Toss", y="Number of matches won" ,title = "How much of a advantage is winning the toss")

dis <- ipl_data[!is.na(ipl_data$dismissal_kind),] %>%  group_by(season,dismissal_kind) %>%
  summarize(count=n())

dis
ggplot(dis,aes(x=dismissal_kind,y=count,fill=season)) +
  geom_bar(stat="identity",position="stack",width=0.6) +
  coord_flip() +
  labs(x="Mode Of dismissals",y="Count",title=" Dismissal season wise")

ipl_data$season <- as.factor(ipl_data$season)

sea_bat <- ipl_data %>% group_by(season,batsman) %>% summarize(total_runs=sum(batsman_runs)) %>%
  filter(total_runs==max(total_runs)) %>% ungroup()

ggplot(data=sea_bat,aes(x=season,y=total_runs,fill=season)) +
  geom_bar(stat="identity") +
  coord_flip() +
  geom_text(aes(label=batsman,hjust=1)) +
  labs(title="Highest run scorers by season",x="Seasons",y='Total Runs') +
  theme_bw()
sea_bowl <- ipl_data %>% group_by(season,bowler) %>% summarize(total_wkts=sum(wickets,na.rm=T)) %>%
  filter(total_wkts==max(total_wkts)) %>% ungroup()

ggplot(data=sea_bowl,aes(x=season,y=total_wkts,fill=season)) +
  geom_bar(stat="identity") +
  coord_flip() +
  geom_text(aes(label=bowler,hjust=1)) +
  labs(title="Highest wicket takers by season",x="Seasons",y='Total Wickets') +
  theme_bw()
