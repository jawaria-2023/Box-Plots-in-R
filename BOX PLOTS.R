#Basic Boxplot
library(plotly)
fig <- plot_ly(y = ~rnorm(50), type = "box")
fig <- fig %>% add_trace(y = ~rnorm(50, 1))

fig

###Choosing The Algorithm For Computing Quartiles
library(plotly)
fig <- plot_ly(y = list(1,2,3,4,5), type = "box", quartilemethod="exclusive") # or "inclusive", or "linear" by default

fig
#######Modifying The Algorithm For Computing Quartiles
library(plotly)
fig <- plot_ly(y = list(1,2,3,4,5), type = "box", quartilemethod="linear", name="Linear Quartile Mode")
fig <- fig %>% add_trace(y = list(1,2,3,4,5), quartilemethod="inclusive", name="Inclusive Quartile Mode")
fig <- fig %>% add_trace(y = list(1,2,3,4,5), quartilemethod="exclusive", name="Exclusive Quartile Mode")
fig <- fig %>% layout(title = "Modifying The Algorithm For Computing Quartiles")

fig

#########################
Box Plot With Precomputed Quartiles
library(plotly)
fig <- plot_ly(y = list(1,2,3,4,5,6,7,8,9), type = "box", q1=list(1, 2, 3), median=list(4, 5, 6),
               q3=list(7, 8, 9 ), lowerfence=list(-1, 0, 1),
               upperfence=list(5, 6, 7), mean=list(2.2, 2.8, 3.2 ),
               sd=list(0.2, 0.4, 0.6), notchspan=list(0.2, 0.4, 0.6))

fig

#################
Horizontal Boxplot
library(plotly)
fig <- plot_ly(x = ~rnorm(50), type = "box")
fig <- fig %>% add_trace(x = ~rnorm(50, 1))

fig

############
Adding Jittered Points
fig <- plot_ly(y = ~rnorm(50), type = "box", boxpoints = "all", jitter = 0.3,
               pointpos = -1.8)

fig
#################
Several Box Plots
fig <- plot_ly(ggplot2::diamonds, y = ~price, color = ~cut, type = "box")

fig

####################
Grouped Box Plots
fig <- plot_ly(ggplot2::diamonds, x = ~cut, y = ~price, color = ~clarity, type = "box")
fig <- fig %>% layout(boxmode = "group")

fig

#####################
Styling Outliers
library(plotly)

y1 <- c(0.75, 5.25, 5.5, 6, 6.2, 6.6, 6.80, 7.0, 7.2, 7.5, 7.5, 7.75, 8.15,
        8.15, 8.65, 8.93, 9.2, 9.5, 10, 10.25, 11.5, 12, 16, 20.90, 22.3, 23.25)
y2 <- c(0.75, 5.25, 5.5, 6, 6.2, 6.6, 6.80, 7.0, 7.2, 7.5, 7.5, 7.75, 8.15,
        8.15, 8.65, 8.93, 9.2, 9.5, 10, 10.25, 11.5, 12, 16, 20.90, 22.3, 23.25)
y3 <- c(0.75, 5.25, 5.5, 6, 6.2, 6.6, 6.80, 7.0, 7.2, 7.5, 7.5, 7.75, 8.15,
        8.15, 8.65, 8.93, 9.2, 9.5, 10, 10.25, 11.5, 12, 16, 20.90, 22.3, 23.25)
y4 <- c(0.75, 5.25, 5.5, 6, 6.2, 6.6, 6.80, 7.0, 7.2, 7.5, 7.5, 7.75, 8.15,
        8.15, 8.65, 8.93, 9.2, 9.5, 10, 10.25, 11.5, 12, 16, 20.90, 22.3, 23.25)

fig <- plot_ly(type = 'box')
fig <- fig %>% add_boxplot(y = y1, jitter = 0.3, pointpos = -1.8, boxpoints = 'all',
                           marker = list(color = 'rgb(7,40,89)'),
                           line = list(color = 'rgb(7,40,89)'),
                           name = "All Points")
fig <- fig %>% add_boxplot(y = y2, name = "Only Whiskers", boxpoints = FALSE,
                           marker = list(color = 'rgb(9,56,125)'),
                           line = list(color = 'rgb(9,56,125)'))
fig <- fig %>% add_boxplot(y = y3, name = "Suspected Outlier", boxpoints = 'suspectedoutliers',
                           marker = list(color = 'rgb(8,81,156)',
                                         outliercolor = 'rgba(219, 64, 82, 0.6)',
                                         line = list(outliercolor = 'rgba(219, 64, 82, 1.0)',
                                                     outlierwidth = 2)),
                           line = list(color = 'rgb(8,81,156)'))
fig <- fig %>% add_boxplot(y = y4, name = "Whiskers and Outliers", boxpoints = 'outliers',
                           marker = list(color = 'rgb(107,174,214)'),
                           line = list(color = 'rgb(107,174,214)'))
fig <- fig %>% layout(title = "Box Plot Styling Outliers")

fig









