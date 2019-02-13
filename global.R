## global.r #####

library(dplyr)
library(googleVis)
library(rworldmap)
library(plotly)
library(ggplot2)
library(googleVis)
library(sp)
library(rgdal)
library(ggalt)
library(ggthemes)
library(tidyverse)
library(rsconnect)
library(tidyr)
library(dplyr)
library(leaflet)
## comparison of rapper google search count #####
## dataframes
googlesearches <- read.csv(file="googlesearches.csv",head=TRUE,sep=",")
googlesearches[[1]] <- as.Date(googlesearches[[1]])
Week = googlesearches[, 1]
Searches = googlesearches[, -1]
## convert csv files to dataframes
df_googlesearches = data.frame(googlesearches)
head(df_googlesearches)
searches <- df_googlesearches %>%
  select(Week, cardi.b, jay.z, drake, kanye.west, X21.savage) %>%
  gather(key = "SearchTerm", value = "Searches", -Week)
head(searches, 3)
## graphs
## google searches trend plot
googlesearchesPlot = ggplot(searches, aes(x = Week, y = Searches)) + 
  geom_area(aes(color = SearchTerm, fill = SearchTerm),
            alpha = 0.5, position = position_dodge(0.8)) +
  scale_color_manual(values = c("#00AFBB", "#E7B800", "#EED5B7", "darksalmon", "darkseagreen2")) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800", "#EED5B7", "darksalmon", "darkseagreen2")) +
  labs(title = "Google searches of rappers' names in the past 5 years", subtitle = waiver(), caption = waiver(), 
        tag = waiver())
googlesearchesPlot
# cardi b endorsements #####
# dataframe
cardiendorsements <- read.csv(file = "cardibendorsements.csv", head = TRUE, sep = ",")
cardiendorsements[[1]] <- as.Date(cardiendorsements[[1]])
Week = cardiendorsements[, 1]
Searches = cardiendorsements[, -1]
# convert csv files to dataframes
df_cardiendorsements = data.frame(cardiendorsements)
cardiendorsementss <- df_cardiendorsements %>%
  select(Week, cardi.b, fashion.nova, pepsi, amazon.alexa, cardi.b.fashion.nova, cardi.b.pepsi, cardi.b.amazon.alexa) %>%
  gather(key = "SearchTerm", value = "Searches", -Week)
# plot
cardiendorsementsPlot = ggplot(cardiendorsementss, aes(x = Week, y = Searches)) + 
  geom_area(aes(color = SearchTerm, fill = SearchTerm),
            alpha = 0.5, position = position_dodge(0.8)) +
  scale_color_manual(values = c("#00AFBB", "#E7B800", "#EED5B7", "darksalmon", "lightpink3", "lightcyan3", "navajowhite3")) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800", "#EED5B7", "darksalmon", "lightpink3", "lightcyan3", "navajowhite3")) +
  labs(title = "Cardi B vs. endorsement brand interest by Google searches", subtitle = waiver(), caption = waiver(), 
       tag = waiver())
cardiendorsementsPlot
# jay z endorsements #####
# dataframe
jayendorsements <- read.csv(file = "jayzendorsements.csv", head = TRUE, sep = ",")
jayendorsements[[1]] <- as.Date(jayendorsements[[1]])
Week = jayendorsements[, 1]
Searches = jayendorsements[, -1]
# convert csv files to dataframes
df_jayendorsements = data.frame(jayendorsements)
jayendorsementss <- df_jayendorsements %>%
  select(Week, jay.z, samsung.galaxy, Sprint, tidal, air.force.1, jay.z.samsung.galaxy, jay.z.sprint, jay.z.tidal, jay.z.air.force.1) %>%
  gather(key = "SearchTerm", value = "Searches", -Week)
# plot
jayendorsementsPlot = ggplot(jayendorsementss, aes(x = Week, y = Searches)) + 
  geom_area(aes(color = SearchTerm, fill = SearchTerm),
            alpha = 0.5, position = position_dodge(0.8)) +
  scale_color_manual(values = c("#00AFBB", "#E7B800", "#EED5B7", "darksalmon", "darkseagreen2", "lightpink3", "lightcyan3", "navajowhite3", "lightskyblue1")) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800", "#EED5B7", "darksalmon", "darkseagreen2", "lightpink3", "lightcyan3", "navajowhite3", "lightskyblue1")) +
  labs(title = "Jay Z vs. endorsement brand interest by Google searches", subtitle = waiver(), caption = waiver(), 
       tag = waiver())
jayendorsementsPlot
# drake endorsements #####
# dataframe
drakeendorsements <- read.csv(file = "drakeendorsements.csv", head = TRUE, sep = ",")
drakeendorsements[[1]] <- as.Date(drakeendorsements[[1]])
Week = drakeendorsements[, 1]
Searches = drakeendorsements[, -1]
# convert csv files to dataframes
df_drakeendorsements = data.frame(drakeendorsements)
drakeendorsementss <- df_drakeendorsements %>%
  select(Week, drake, drake.sprite, drake.t.mobile, drake.spotify, drake.virginia.black, sprite, t.mobile, spotify, virginia.black) %>%
  gather(key = "SearchTerm", value = "Searches", -Week)
# plot
drakeendorsementsPlot = ggplot(drakeendorsementss, aes(x = Week, y = Searches)) + 
  geom_area(aes(color = SearchTerm, fill = SearchTerm),
            alpha = 0.5, position = position_dodge(0.8)) +
  scale_color_manual(values = c("#00AFBB", "#E7B800", "#EED5B7", "darksalmon", "darkseagreen2", "lightpink3", "lightcyan3", "navajowhite3", "lightskyblue1")) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800", "#EED5B7", "darksalmon", "darkseagreen2", "lightpink3", "lightcyan3", "navajowhite3", "lightskyblue1")) +
  labs(title = "Drake vs. endorsement brand interest by Google searches", subtitle = waiver(), caption = waiver(), 
       tag = waiver())
drakeendorsementsPlot
# kanye endorsements #####
# dataframe
kanyeendorsements <- read.csv(file = "kanyeendorsements.csv", head = TRUE, sep = ",")
kanyeendorsements[[1]] <- as.Date(kanyeendorsements[[1]])
Week = kanyeendorsements[, 1]
Searches = kanyeendorsements[, -1]
# convert csv files to dataframes
df_kanyeendorsements = data.frame(kanyeendorsements)
kanyeendorsementss <- df_kanyeendorsements %>%
  select(Week,  kanye.west.adidas.yeezy, kanye.west.balmain, kanye.west.fatburger, kanye.west.bape, kanye.west, adidas.yeezy, balmain, fatburger, BAPE) %>%
  gather(key = "SearchTerm", value = "Searches", -Week)
# plot
kanyeendorsementsPlot = ggplot(kanyeendorsementss, aes(x = Week, y = Searches)) + 
  geom_area(aes(color = SearchTerm, fill = SearchTerm),
            alpha = 0.5, position = position_dodge(0.8)) +
  scale_color_manual(values = c("#00AFBB", "#E7B800", "#EED5B7", "darksalmon", "darkseagreen2", "lightpink3", "lightcyan3", "navajowhite3", "lightskyblue1")) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800", "#EED5B7", "darksalmon", "darkseagreen2", "lightpink3", "lightcyan3", "navajowhite3", "lightskyblue1")) +
  labs(title = "Kanye West vs. endorsement brand interest by Google searches", subtitle = waiver(), caption = waiver(), 
       tag = waiver())
kanyeendorsementsPlot
# 21 endorsements #####
# dataframe
savageendorsements <- read.csv(file = "21endorsements.csv", head = TRUE, sep = ",")
savageendorsements[[1]] <- as.Date(savageendorsements[[1]])
Week = savageendorsements[, 1]
Searches = savageendorsements[, -1]
# convert csv files to dataframes
df_savageendorsements = data.frame(savageendorsements)
savageendorsementss <- df_savageendorsements %>%
  select(Week, X21.savage, ICE, Saint.Laurent, Honda, forever.21, X21.savage.ICE, X21.savage.saint.laurent, X21.savage.honda, X21.savage.forever.21) %>%
  gather(key = "SearchTerm", value = "Searches", -Week)
# plot
savageendorsementsPlot = ggplot(savageendorsementss, aes(x = Week, y = Searches)) + 
  geom_area(aes(color = SearchTerm, fill = SearchTerm),
            alpha = 0.5, position = position_dodge(0.8)) +
  scale_color_manual(values = c("#00AFBB", "#E7B800", "#EED5B7", "darksalmon", "darkseagreen2", "lightpink3", "lightcyan3", "navajowhite3", "lightskyblue1")) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800", "#EED5B7", "darksalmon", "darkseagreen2", "lightpink3", "lightcyan3", "navajowhite3", "lightskyblue1")) +
  labs(title = "21 Savage vs. endorsement brand interest by Google searches", subtitle = waiver(), caption = waiver(), 
       tag = waiver())
savageendorsementsPlot