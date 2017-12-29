+++
image = "img/portfolio/bridge1.jpg"
showonlyimage = false
date = "2016-11-05T19:44:32+05:30"
title = "Time Series"
categories = [ "Travel" ]
draft = false
weight = 2
+++

A time series has two sets of data with one of the sets of data being time. As a result, they are very useful for showing changes over time.

<!--more-->

We will use a time series graph to show Babe Ruth's homeruns over his twenty-two seasons.

The first three packages that we need to install :

```{r setup, warning=FALSE, message=FALSE}
library(Lahman)
library(sqldf)
library(ggplot2)
```
We will run a query to create the dataset that shows Babe Ruth's homeruns. 

```{r}
query<-"SELECT yearID,HR FROM Batting WHERE playerID='ruthba01'"
result<-sqldf(query)
```

We will show the data as a time series visualization 

```{r}
ggplot()+
  geom_point(data=result,aes(x=yearID,y=HR),size=1/2)+
  geom_line(data=result,aes(x=yearID,y=HR))+
  ggtitle("Babe Ruth's Homeruns by Year")+
  xlab("Year")+
  ylab("Number of Homeruns")
```


