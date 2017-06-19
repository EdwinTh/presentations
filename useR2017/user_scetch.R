library(padr)
library(tidyverse)
emergency %>% count(title) %>% as.data.frame()
causes <- c("EMS: ALLERGIC REACTION", "EMS: CVA/STROKE", "EMS: NAUSEA/VOMITING",
            "UNCONSCIOUS SUBJECT", "EMS: FEVER")

towns <- emergency %>%
  filter(title == "Traffic: VEHICLE ACCIDENT -") %>% count(twp) %>% arrange(n %>% desc) %>% head(4)

one_week_of_traffic <- emergency %>%
  filter(title == "Traffic: VEHICLE ACCIDENT -") %>%
  thicken("week", "w") %>%
  filter(w == as.Date("2016-07-24")) %>%
  filter(twp %in% towns$twp) %>%
  select(-w)

one_week_of_traffic %>%
  thicken("6 hour", "h6") %>%
  count(twp, h6) %>%
  pad() %>%
  fill_by_value() %>%
  ggplot(aes(h6, n)) +
  geom_line(aes(col = twp)) +
  geom_point(aes(col = twp))


# slide 3


library(padr)
library(tidyverse)
head(one_week_of_traffic)





