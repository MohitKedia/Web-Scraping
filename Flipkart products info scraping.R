library(rvest)

library(purrr)




link_base <- "https://www.flipkart.com/search?count=40&otracker=CLP_filters&page=%d&sid=tyy%2F4io&viewType=list"

map_df(1:374, function(i){
  
  cat("boom ")
  
  page <- read_html(sprintf(link_base,i))
  
  data.frame(PRODUCT_NAME = html_text(html_nodes(page,"._3wU53n")),
             RAM = html_text(html_nodes(page,".OiPjke")),
             RATINGS = html_text(html_nodes(page,"._38sUEc span span:nth-child(1)")),
             REVIEWS = html_text(html_nodes(page,"._1VpSqZ+ span")),
             DESCRIPTION = html_text(html_nodes(page,".vFw0gD")),
             PRICE = html_text(html_nodes(page,"._2rQ-NK")),
             EMI = html_text(html_nodes(page, "._3MCpsc")),
             stringsAsFactors = FALSE)
  
}) -> Smartphones_flipkart

###################################################

#METHOD 2#

Product_Name  <- lapply(paste0('https://www.flipkart.com/search?count=40&otracker=CLP_filters&page=&sid=tyy%2F4io&viewType=list', 1:20),
                  function(url){
                    url %>% read_html() %>% 
                      html_nodes("._3wU53n") %>% 
                      html_text()
                  })
             
RATINGS <- lapply(paste0('https://www.flipkart.com/search?count=40&otracker=CLP_filters&page=&sid=tyy%2F4io&viewType=list', 1:20),
                  function(url){
                    url %>% read_html() %>% 
                      html_nodes("._38sUEc span span:nth-child(1)") %>% 
                      html_text()
                  })
  
REVIEWS <-  lapply(paste0('https://www.flipkart.com/search?count=40&otracker=CLP_filters&page=&sid=tyy%2F4io&viewType=list', 1:20),
                   function(url){
                     url %>% read_html() %>% 
                       html_nodes("._1VpSqZ+ span") %>% 
                       html_text()
                   })
  
DESCRIPTION <-  lapply(paste0('https://www.flipkart.com/search?count=40&otracker=CLP_filters&page=&sid=tyy%2F4io&viewType=list', 1:20),
                       function(url){
                         url %>% read_html() %>% 
                           html_nodes(".vFw0gD") %>% 
                           html_text()
                       })

PRICE <- lapply(paste0('https://www.flipkart.com/search?count=40&otracker=CLP_filters&page=&sid=tyy%2F4io&viewType=list', 1:20),
                function(url){
                  url %>% read_html() %>% 
                    html_nodes("._2rQ-NK") %>% 
                    html_text()
                })


Product_Name <- unlist(Product_Name)
RAM <- unlist(RAM)
RATINGS <- unlist(RATINGS)
REVIEWS <- unlist(REVIEWS)
DESCRIPTION <- unlist(DESCRIPTION)
PRICE <- unlist(PRICE)


Flipkart_products <- cbind.data.frame(Product_Name,RATINGS,REVIEWS,PRICE,DESCRIPTION)
View(Flipkart_products)
