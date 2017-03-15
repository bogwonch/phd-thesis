require('ggplot2')
require('scales')

data <- read.csv('app-store-apps', header=TRUE, comment.char="#", strip.white=TRUE)
data$date <- as.Date(data$date)

p <- ggplot(data, aes(x=date, y=apps, group=Vendor)) + theme_bw()
p <- p + scale_x_date("Date", date_minor_break="1 month", breaks=data$date, date_labels="%Y-%m") + theme(axis.text.x = element_text(angle=90, hjust=1))
p <- p + scale_y_continuous("Available apps in marketplace", breaks=c(c(0), data[data$apps > 7e5,]$apps), minor_breaks=seq(0,3e06,1e5), labels=comma)
p <- p + geom_line(aes(linetype=Vendor))
p <- p + geom_point()

ggsave("app-store-apps.pdf", width=12, height=8)

summary(data)

