# menu_column <- tabItem(tabName = "column",
#                     fluidRow(
#                       column(width = 4,
#                              box(
#                                title = "开始上传社保公积金表",   
#                                width = NULL,
#                                solidHeader = TRUE,
#                                status = "primary",
#                                tsui::uiTemplate(templateName = '计提数据模版'),                      
#                                tsui::mdl_file(id = 'socialsecurity', label ='社保公积金表'),                                                 
#                                shiny::actionButton(inputId = 'socialsecurity_file' , label = '预览社保公积金'),               
#                                # shiny::actionButton(inputId = 'btn_export_updateERP' , label = '更新汇票等级'),
#                                # tsui::mdl_download_button(id = 'dl_export_baseInfo', label = '下载处理结果')            
#                              )
#                              # ,
#                              # box(
#                              #   title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
#                              #   "Box content"
#                              # ),
#                              # box(
#                              #   title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
#                              #   "Box content"
#                              # )
#                       ),
#                       
#                       # column(width = 4,
#                       #        box(
#                       #          title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
#                       #          "Box content"
#                       #        ),
#                       #        box(
#                       #          title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
#                       #          "Box content"
#                       #        ),
#                       #        box(
#                       #          title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
#                       #          "Box content"
#                       #        )
#                       # ),
#                       
#                       column(width=8,
#                              box(
#                                title = "数据预览", width = NULL, solidHeader = TRUE, status = "primary",
#                                
#                                tsui::uiScrollX(tsui::mdl_dataTable(id = 'socialsecurity_view',label ='出口'))
#                              )
#                              # ,
#                              # box(
#                              #   title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
#                              #   "Box content"
#                              # ),
#                              # box(
#                              #   title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
#                              #   "Box content"
#                              # )
#                       )
#                     )
# )
# 
