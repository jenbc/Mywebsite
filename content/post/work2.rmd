+++
date = "2016-11-05T19:41:01+05:30"
title = "Scatterplot"
draft = false
image = "img/portfolio/logs1.jpg"
showonlyimage = false
categories = [ "Design"]
weight = 1
+++

For today we will be learning how to create Scatter Plots in R. We will be using a baseball database as an example specifically homeruns and strikeouts from the Lahman database.
<!--more-->

The first three packages that we need to install :

```{r setup, warning=FALSE, message=FALSE}
library(Lahman)
library(sqldf)
library(ggplot2)
```

For this graph we only want career homeruns and strikeouts from players who had more than 400 homeruns.


```{r, highlight=TRUE}
query<-"SELECT playerID,sum(HR) AS CareerHR,sum(SO) AS CareerSO
FROM Batting
GROUP BY playerID
HAVING sum(HR)>400"
result<-sqldf(query)
```

We will visualize the data as a scatterplot.

```{r}
ggplot()+
  geom_point(data=result,aes(x=CareerSO,y=CareerHR),size=3)+
  ggtitle("Career Strikeouts and Homeruns")+
  xlab("Career Strikeouts")+
  ylab("Career Homeruns")
```