## Web Scripting CronR Project

## Libraries

library(tidyverse)
library(janitor)
library(rvest)
library(blastula)


## Web Scrapping Pull

date_time <- add_readable_time()

pg <- read_html('https://www.myhrfuture.com/blog')

text <- pg %>% html_element("article") %>% html_text2()

link <- pg %>% html_element("link") %>% html_attr("href")

## Email

email <-
  compose_email(
    body = md(glue::glue("
      
      **HR Digital Leader Blog**
      
      *{date_time}*
        
      
      {text}
")

),
    footer = md("[Link](https://www.myhrfuture.com/blog/2022/3/2/how-can-people-analytics-deliver-solutions-at-scale-through-productisation)"))#md([Article Link](link)

  email   

