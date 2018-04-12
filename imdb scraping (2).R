library(rvest)

url <- "http://www.imdb.com/search/title?year=2017,2017&title_type=feature&sort=moviemeter,asc"
webpage <- read_html(url)

rank_data_html <- html_nodes(webpage, '.text-primary')
rank_data <- html_text(rank_data_html)
View(rank_data)
View(rank_data_html)
head(rank_data)

title_data_html <- html_nodes(webpage, '.lister-item-header a')
title_data <- html_text(title_data_html)
head(title_data)


description_data_html <- html_nodes(webpage, '.text-muted+ .text-muted , .ratings-bar+ .text-muted')
description_data <- html_text(description_data_html)
head(description_data)

genre_data_html <- html_nodes(webpage, '.genre')
genre_data <- html_text(genre_data_html)
head(genre_data)


director_data_html <- html_nodes(webpage, '.lister-item-content a:nth-child(1)')
director_data <- html_text(director_data_html)
head(director_data)


cast_data_html <- html_nodes(webpage, 'a+ a , .lister-item-content .ghost+ a')
cast_data <- html_text(cast_data_html)
head(cast_data)





movies_data_2017 <- data.frame(RANK = rank_data, TITLE = title_data, 
                               DESCRIPTION = description_data, 
                               GENRE = genre_data)
View(movies_data_2017)

library(xlsx)
write.xlsx(movies_data_2017,"imdb2017.xlsx")
