
# Purpose: Begin web scraping triathlon rankings --------------------------



# Load in libraries -------------------------------------------------------


library(rvest)
library(tidyverse)

# https://triathlon.org/results/result/2022_world_triathlon_sprint_relay_championships_montreal/547005


# Mixed Relay Rankings --------------------------------------------

# https://www.triathlon.org/rankings/mixed_relay

mixed_rankings_url <- "https://www.triathlon.org/rankings/mixed_relay"

relay_rankings <- html_table(read_html(mixed_rankings_url), fill = T)[[1]] %>% 
  select(-1, -3, -11) %>%
  separate(Team, 
           sep = " I ", 
           into = c("Team Num", "Country"))



# Mixed Relay Qual Event 2022 ---------------------------------------------

mixed_qual22_url <- "https://triathlon.org/results/result/2022_world_triathlon_sprint_relay_championships_montreal/547005"

mixed_quall22 <- html_table(read_html(mixed_qual22_url), fill = T)[[1]] %>%
  select(-1, -11) %>%
  rename(NOC = "Country") %>%
  separate(Team, 
           sep = " I ", 
           into = c("Team Num", "Country")) %>%
  filter(!Pos %in% c("DNF", "DNS", "DSQ"))



# Men Rankings ------------------------------------------------------------

men_rankings_url <- "https://www.triathlon.org/rankings/world_triathlon_rankings/male"

men_rankings <- html_table(read_html(men_rankings_url), fill = T)[[1]] %>% 
  select(-1, , -3,-13) %>%
  rename(First_Name = "Given Name",
         Last_Name = "Family Name")



# Women Rankings ----------------------------------------------------------

women_rankings_url <- "https://www.triathlon.org/rankings/world_triathlon_rankings/female"

women_rankings <- html_table(read_html(women_rankings_url), fill = T)[[1]] %>% 
  select(-1, , -3,-13) %>%
  rename(First_Name = "Given Name",
         Last_Name = "Family Name")


# Write datasets to csv ---------------------------------------------------

write_list <- list(relay_rankings = relay_rankings,
               mixed_quall22 = mixed_quall22,
               men_rankings = men_rankings,
               women_rankings = women_rankings)
for(i in names(write_list)){
  write_csv(write_list[[i]], paste0("data/",i,".csv"))
}

