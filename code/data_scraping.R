
# Purpose: Begin web scraping triathlon rankings --------------------------



# Load in libraries -------------------------------------------------------


library(rvest)
library(xlsx)
library(tidyverse)

# https://triathlon.org/results/result/2022_world_triathlon_sprint_relay_championships_montreal/547005


# Mixed Relay Rankings --------------------------------------------

mixed_rankings_url <- "https://www.triathlon.org/rankings/mixed_relay"

relay_rankings <- html_table(read_html(mixed_rankings_url), fill = T)[[1]] %>% 
  select(-1, -3, -11) %>%
  separate(Team, 
           sep = " I ", 
           into = c("Team Num", "Country"))



# Mixed Relay Qual Event 2022 ---------------------------------------------

mixed_qual22_url <- "https://triathlon.org/results/result/2022_world_triathlon_sprint_relay_championships_montreal/547005"

mixed_qual22 <- html_table(read_html(mixed_qual22_url), fill = T)[[1]] %>%
  select(-1, -11) %>%
  rename(NOC = "Country") %>%
  separate(Team, 
           sep = " I ", 
           into = c("Team Num", "Country")) %>%
  filter(!Pos %in% c("DNF", "DNS", "DSQ"))



# Men Rankings ------------------------------------------------------------

men_rankings_url <- "https://triathlon.org/rankings/world_triathlon_championship_series/male"

men_rankings <- html_table(read_html(men_rankings_url), fill = T)[[1]] %>% 
  select(-1, , -3,-10) %>%
  rename(NOC = "CountryNOC",
         First_Name = "First Name",
         Last_Name = "Last Name")



# Women Rankings ----------------------------------------------------------

women_rankings_url <- "https://triathlon.org/rankings/world_triathlon_championship_series/female"

women_rankings <- html_table(read_html(women_rankings_url), fill = T)[[1]] %>% 
  select(-1, , -3,-10) %>%
  rename(NOC = "CountryNOC",
         First_Name = "First Name",
         Last_Name = "Last Name")


# Write datasets to csv ---------------------------------------------------

write_list <- list(relay_rankings = relay_rankings,
               mixed_qual22 = mixed_qual22,
               men_rankings = men_rankings,
               women_rankings = women_rankings)

for(i in names(write_list)){
  write.xlsx(write_list[[i]], paste0("data/",i,".xlsx"))
}

