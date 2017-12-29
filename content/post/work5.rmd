+++
image = "img/portfolio/railroad-forest1.jpg"
showonlyimage = true
draft = false
date = "2016-11-05T19:53:42+05:30"
title = "Histogram"
categories = [ "photography" ]
weight = 5
+++

According to Dictionary.com, a histogram is a graph of a frequency distribution in which rectangles with bases on the horizontal axis are given widths equal to the class intervals and heights equal to the corresponding frequencies.
<!--more-->
 
We will be looking at the weights of MLB players from the Lahman database, specifically the Master Table. We will exclude the rows which do not have a numerical value.

The first three packages that we need to install :


```{r setup, warning=FALSE, message=FALSE}
library(Lahman)
library(sqldf)
library(ggplot2)
```

We will use a query to pull the weights of players. 

```{r}
query<-"SELECT weight FROM Master"
result<-sqldf(query)
```

We will now show the data in the form of a histogram. This histogram has 65 bins.

```{r}
ggplot()+
  geom_histogram(data=result,aes(x=weight),color="pink",fill="black",bins=65)+
  ggtitle("Baseball Player Bodyweight Distribution")+
  xlab("Weight of player")+
  ylab("Number of players")
```  
  
# We removed 854 rows containing non-finite values (stat_bin).