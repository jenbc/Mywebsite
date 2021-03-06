+++
draft = false
image = ""
showonlyimage = false
date = "2016-11-05T19:50:47+05:30"
title = "Bar Graph"
categories = [ "code" ]
weight = 4
+++

According to Dictionary.com a bar graph is a diagram in which the values of variables are represented by the height or length of lines or rectangles of equal width.

<!--more-->

Compared to other data visualizations, the main difference in creating a bar graph is using geom_bar, adding stat='identity' for labelling purposes and using coord_flip to make horizontal bars.

We will begin by installing the packages needed to create this bar graph. These are the packages needed. 

The four packages that we need to install are :

```{r setup, warning=FALSE, message=FALSE}
library(Lahman)
library(sqldf)
library(ggplot2)
library(devtools)
```
 
Firstly, we will create a query that determines the total number of homeruns per team in 1980.

```{r}
query<-"SELECT name,HR FROM Teams WHERE yearID=1980
ORDER BY HR"

result<-sqldf(query)

result$name<-factor(result$name,levels=result$name)
```

This next section will visualize the data as a bar graph.

```{r}
ggplot()+
  geom_bar(data=result,aes(x=name,y=HR),stat='identity')+
  coord_flip()+
  xlab("Team name")+
  ylab("Homeruns")+
  ggtitle("Total Team Homerun Distribution")
  ```
  