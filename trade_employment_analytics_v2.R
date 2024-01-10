library(readxl)
library(ggplot2)
library(dplyr)
library(stringr)

# Imports data
industry_view = read_excel("~/R/Data/Raw US Employment Data (1).xlsx", sheet= 1)

national_view = read_excel("~/R/Data/Raw US Employment Data (1).xlsx", sheet= 2)

state_view = read_excel("~/R/Data/Raw US Employment Data (1).xlsx", sheet= 3)

# Code for Trade vs. National based graphs

# Filters industry data to only consider trade labor
trades=c("A. Mining and Logging", "B. Construction", "C. Durable Goods Manufacturing", "D. Nondurable Goods Manufacturing")
trade_data= industry_view %>%
  filter(Industry %in% trades)

# Cleans data, removing A., B., etc.
trade_data$Industry=str_replace_all(trade_data$Industry, paste0('\\b', c('A. ', 'B. ', 'C. ', 'D. '), '\\b'), "")

# Trade vs National Available Worker Ratios
plot7 = ggplot(trade_data,aes(x = trade_data$'Date', y=trade_data$"Available Worker Ratio", color=trade_data$'Industry'),size=2)+
  geom_line()+
  scale_color_manual(name = "Industry",values=t_colors)+
  labs(x='Date', y='Availalbe Worker Ratio', title = 'Available Worker Ratio by Trade')+
  theme(legend.position = c(0.8, 0.8),plot.title = element_text(hjust = 0.5))
plot7 = plot7 + 
  geom_line(data = national_view, aes(x=national_view$Period, y=national_view$"Available Worker Ratio",color='National Rate'), size=1, color='black')
plot7



# Only Considers data from 2022 onward
trade_data=trade_data[1:84, ]

national_view=national_view[1:21, ]

# Defines trade based graph colors 
t_colors=c('red','blue', 'brown','purple')

# Trade vs National Unemployment Rates
plot1 = ggplot(trade_data,aes(x = trade_data$'Date', y=trade_data$"Unemployment Rate (%)", color=trade_data$'Industry'),size=2)+
  geom_line()+
  scale_color_manual(name = "Industry",values=t_colors)+
  labs(x='Date', y='Unemployment Rate (%)', title = 'Unemployment Rate by Trade')+
  theme(legend.position = c(0.8, 0.8),plot.title = element_text(hjust = 0.5))
plot1 = plot1 + 
  geom_line(data = national_view, aes(x=national_view$Period, y=national_view$"Unemployment Rate (%)",color='National Rate'), size=1, color='black')
plot1

# Trade vs National Quit Rate
plot2 = ggplot(trade_data,aes(x = trade_data$'Date', y=trade_data$"Quit Rate (%)", color=trade_data$'Industry'),size=2)+
  geom_line()+
  scale_color_manual(name = "Industry",values=t_colors)+
  labs(x='Date', y='Quit Rate (%)', title='Quit Rate by Trade')+
  theme(legend.position=c(.8, .2), plot.title = element_text(hjust =.5))
plot2 = plot2 + geom_line(data = national_view, aes(x=national_view$Period, y=national_view$"Quit Rate (%)",color='National Rate'), size=1, color='black')
plot2

# Trade vs National Hire Rate
plot3 = ggplot(trade_data,aes(x = trade_data$'Date', y=trade_data$"Hire Rate (%)", color=trade_data$'Industry'),size=2)+
  geom_line()+
  scale_color_manual(name = "Industry",values=t_colors)+
  labs(x='Date',y='Hire Rate (%)', title='Hire Rate by Trade')+
  theme(legend.position=c(.8, .8), plot.title = element_text(hjust =.5))
plot3 = plot3 + geom_line(data = national_view, aes(x=national_view$Period, y=national_view$"Hire Rate (%)",color='National Rate'), size=1, color='black')
plot3

# Trade vs National Available Worker Ratios
plot7 = ggplot(trade_data,aes(x = trade_data$'Date', y=trade_data$"Available Worker Ratio", color=trade_data$'Industry'),size=2)+
  geom_line()+
  scale_color_manual(name = "Industry",values=t_colors)+
  labs(x='Date', y='Availalbe Worker Ratio', title = 'Available Worker Ratio by Trade')+
  theme(legend.position = c(0.8, 0.8),plot.title = element_text(hjust = 0.5))
plot7 = plot7 + 
  geom_line(data = national_view, aes(x=national_view$Period, y=national_view$"Available Worker Ratio",color='National Rate'), size=1, color='black')
plot7

# Code for National vs. Virginia based graphs

# Filters to only consider VA data
va_data = state_view %>%
  filter(State %in% c("Virginia"))

# Cleans time period data
va_data$Period=national_view$Period

# VA vs National Unemployment Rates
plot4 = ggplot(va_data,aes(x = va_data$'Period', y=va_data$"Unemployment Rate (%)"))+
  geom_line(color='green')+
  labs(x='Date', y='Unemployment Rate (%)', title = 'Virginia vs. National Unemployment Rate')+
  theme(legend.position=c(.8, .8), plot.title = element_text(hjust = .5))
plot4 = plot4 + geom_line(data = national_view, aes(x=national_view$Period, y=national_view$"Unemployment Rate (%)"), color='black')
plot4

# VA vs National Quit Rates
plot5 = ggplot(va_data,aes(x = va_data$'Period', y=va_data$"Quit Rate (%)"))+
  geom_line(color='green')+
  labs(x='Date', y='Quit Rate (%)', title = 'Virginia vs. National Quit Rate')+
  theme(legend.position=c(.8, .8), plot.title = element_text(hjust = .5))
plot5 = plot5 + geom_line(data = national_view, aes(x=national_view$Period, y=national_view$"Quit Rate (%)"), color='black')
plot5

# VA vs National hire Rates
plot6 = ggplot(va_data,aes(x = va_data$'Period', y=va_data$"Hire Rate (%)"))+
  geom_line(color='green')+
  labs(x='Date', y='Hire Rate (%)', title = 'Virginia vs. National Hire Rate')+
  theme(legend.position=c(.8, .8), plot.title = element_text(hjust = .5))
plot6 = plot6 + geom_line(data = national_view, aes(x=national_view$Period, y=national_view$"Hire Rate (%)"), color='black')
plot6
