## global.R ##
# 加载R包-----
enableBookmarking(store = "url")
library(shiny);
library(shinydashboard);
library(tsda);
library(tsdo);
library(tsui);
library(jhhrvvoucherpkg)
library(readxl)

# 设置引入页-----
source('00_data.R',encoding = 'utf-8');
source('topbarMenu.R',encoding = 'utf-8');
source('sideBarSetting.R',encoding = 'utf-8');
source('01_row_body.R',encoding = 'utf-8');
source('02_column_body.R',encoding = 'utf-8');
source('03_book_body.R',encoding = 'utf-8');
source('04_series_body.R',encoding = 'utf-8');
source('05_majority_body.R',encoding = 'utf-8');
source('06_tutor_body.R',encoding = 'utf-8');
source('99_sysSetting_body.R',encoding = 'utf-8');
source('workAreaSetting.R',encoding = 'utf-8');

#测试
token = '057A7F0E-F187-4975-8873-AF71666429AB'
# 生产
# token = 'C0426D23-1927-4314-8736-A74B2EF7A039'






