# USOPC-Project

Home of code for USOPC job application project, May 2023.

Web scraping done in R, then transferred to Tableau for visualizations / reports.

### `data_scraping.R`

This file goes through and scrapes several different data sources:

1.  Mixed Relay Rankings (which were outdated and thus discarded - haven't been updated since 2021)
2.  Results from Mixed Relay Qualification Event in Montreal, June 2022
3.  Men's World Triathlon Championship Series (WTCS) Rankings
4.  Women's World Triathlon Championship Series (WTCS) Rankings

The 5th dataset `timeline.xlsx` was compiled manually, using the World Triathlon Schedule of events. This dataset included important rankings selection dates, mixed relay qualification events, and WTCS and World Triathlon Cup events. With more time, I would have liked to automate the scraping to only pull events that contribute to the Olympic Qualification Rankings.

Note: [Olympic Qualification Rankings](https://triathlon.org/rankings/olympic_qualification/male) are present on the World Triathlon Website, but have not been updated since 2021, and thus were not used. The WTCS were the most recently updated rankings and thus they were used as an indicator for what rankings might look like at the moment. Additionally, because the relay rankings have not been updated, the Mixed Relay Event Results from 2022 were used as an indicator of Mixed Relay Rankings.
