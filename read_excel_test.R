library(readxl)
data <- read_excel("~/Rpkg/计提数据模版.xlsx", 
                   col_types = c("text", "text", "text", 
                                 "text", "text", "text", "numeric", 
                                 "numeric", "text", "text", "text", 
                                 "text", "text", "text", "numeric", 
                                 "numeric", "text", "text", "text", 
                                 "numeric", "numeric", "numeric"))
str(data)