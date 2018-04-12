library(rvest)
install.packages("RCrawler")

##############################
#NOKIA8_Reviews#

#METHOD1#

url <- "https://www.amazon.in/Nokia-8-Polished-Blue-64GB/product-reviews/B0714DP3BJ/ref=cm_cr_getr_d_show_all?showViewpoints=1&pageNumber=1&reviewerType=all_reviews"
webpage <- read_html(url)

reviews_data <- html_nodes(webpage, '.a-color-base')
reviews <- html_text(reviews_data)


description_data <- html_nodes(webpage, '.review-text')
description <- html_text(description_data)



buyer_data <- html_nodes(webpage, '.author')
buyer <- html_text(buyer_data)


Amazon_reviews_nokia  <- data.frame(REVIEWS = reviews, DESCRIPTION = description, BUYER = buyer)
View(Amazon_reviews_nokia)

#METHOD2#

library(rvest)
library(purrr)

url_base <- "https://www.amazon.in/Nokia-8-Polished-Blue-64GB/product-reviews/B0714DP3BJ/ref=cm_cr_getr_d_paging_btm_1?showViewpoints=1&pageNumber=%d&reviewerType=all_reviews&filterByStar=positive"

map_df(1:32, function(i) {
  
  
  cat(".")
  
  pg <- read_html(sprintf(url_base, i))
  
  data.frame(REVIEWS=html_text(html_nodes(pg, ".a-color-base")),
             DESCRIPTION=html_text(html_nodes(pg, ".review-text")),
             BUYER=html_text(html_nodes(pg, ".author")),
             stringsAsFactors=FALSE)
  
}) -> Nokia8_Amazonreviews

View(Nokia8_Amazonreviews)

##################################

#Oneplus5T_Reviews#

library(rvest)
library(purrr)
        
url_base <- "https://www.amazon.in/OnePlus-Midnight-Black-64GB-memory/product-reviews/B0756ZFXVB/ref=cm_cr_arp_d_viewopt_sr?showViewpoints=1&pageNumber=%d&filterByStar=five_star&formatType=all_formats"
map_df(1:921, function(i) {
  
 
  cat(".")
  
  pg <- read_html(sprintf(url_base, i))
  
  data.frame(RATING = 5,
             REVIEWS=html_text(html_nodes(pg, ".a-color-base")),
             DESCRIPTION=html_text(html_nodes(pg, ".review-text")),
             BUYER=html_text(html_nodes(pg, ".author")),
             DATE = html_text(html_nodes(pg, "#cm_cr-review_list .review-date")),
             PRODUCT = html_text(html_nodes(pg,".a-link-normal.a-color-secondary")),
             
             stringsAsFactors=FALSE)
  
}) -> Oneplus5T_Amazonreviews_1



url_base <- "https://www.amazon.in/OnePlus-Midnight-Black-64GB-memory/product-reviews/B0756ZFXVB/ref=cm_cr_arp_d_viewopt_sr?showViewpoints=1&pageNumber=%d&filterByStar=four_star&formatType=all_formats"

map_df(1:163, function(i){
  
  cat("boom ")
  pg <- read_html(sprintf(url_base,i))
  
data.frame(RATING=4,
           REVIEWS=html_text(html_nodes(pg, ".a-color-base")),
           DESCRIPTION=html_text(html_nodes(pg, ".review-text")),
           BUYER=html_text(html_nodes(pg, ".author")),
           DATE = html_text(html_nodes(pg, "#cm_cr-review_list .review-date")),
           PRODUCT = html_text(html_nodes(pg,".a-link-normal.a-color-secondary")),
           stringsAsFactors=FALSE)

}) -> Oneplus5T_Amazonreviews_2


url_base <- "https://www.amazon.in/OnePlus-Midnight-Black-64GB-memory/product-reviews/B0756ZFXVB/ref=cm_cr_arp_d_viewopt_sr?showViewpoints=1&pageNumber=%d&filterByStar=three_star&formatType=all_formats"

map_df(1:35, function(i){
  
  cat("boom ")
  pg <- read_html(sprintf(url_base,i))
  
  data.frame(RATING=3,
             REVIEWS=html_text(html_nodes(pg, ".a-color-base")),
             DESCRIPTION=html_text(html_nodes(pg, ".review-text")),
             BUYER=html_text(html_nodes(pg, ".author")),
             DATE = html_text(html_nodes(pg, "#cm_cr-review_list .review-date")),
             PRODUCT = html_text(html_nodes(pg,".a-link-normal.a-color-secondary")),
             stringsAsFactors=FALSE)
  
}) -> Oneplus5T_Amazonreviews_3



url_base <- "https://www.amazon.in/OnePlus-Midnight-Black-64GB-memory/product-reviews/B0756ZFXVB/ref=cm_cr_arp_d_viewopt_sr?showViewpoints=1&pageNumber=%d&filterByStar=two_star&formatType=all_formats"

map_df(1:19, function(i){
  
  cat("boom ")
  pg <- read_html(sprintf(url_base,i))
  
  data.frame(RATING=2,
             REVIEWS=html_text(html_nodes(pg, ".a-color-base")),
             DESCRIPTION=html_text(html_nodes(pg, ".review-text")),
             BUYER=html_text(html_nodes(pg, ".author")),
             DATE = html_text(html_nodes(pg, "#cm_cr-review_list .review-date")),
             PRODUCT = html_text(html_nodes(pg,".a-link-normal.a-color-secondary")),
             stringsAsFactors=FALSE)
  
}) -> Oneplus5T_Amazonreviews_4


url_base <- "https://www.amazon.in/OnePlus-Midnight-Black-64GB-memory/product-reviews/B0756ZFXVB/ref=cm_cr_arp_d_viewopt_sr?showViewpoints=1&pageNumber=%d&filterByStar=one_star&formatType=all_formats"
map_df(1:65, function(i){
  
  cat("boom ")
  pg <- read_html(sprintf(url_base, i))
  
  
  data.frame(REVIEWS=html_text(html_nodes(pg, ".a-color-base")),
             DESCRIPTION=html_text(html_nodes(pg, ".review-text")),
             BUYER=html_text(html_nodes(pg, ".author")),
             DATE = html_text(html_nodes(pg, "#cm_cr-review_list .review-date")),
             PRODUCT = html_text(html_nodes(pg,".a-link-normal.a-color-secondary")),
             stringsAsFactors=FALSE)
  
}) -> Oneplus5T_Amazonreviews_5

Oneplus5T_Amazonreviews_5 <- cbind(RATING=1,Oneplus5T_Amazonreviews_5)


Oneplus5T_Amazonreviews <- rbind(Oneplus5T_Amazonreviews_1,Oneplus5T_Amazonreviews_2,Oneplus5T_Amazonreviews_3
                                 ,Oneplus5T_Amazonreviews_4,Oneplus5T_Amazonreviews_5)

View(Oneplus5T_Amazonreviews)

library(xlsx)
write.xlsx(Oneplus5T_Amazonreviews,file = "OnePlus5T Amazon Reviews.xlsx")
