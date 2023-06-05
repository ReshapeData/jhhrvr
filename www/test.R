menu_row <- tabItem(tabName = "row",
                    fluidRow(
                      column(width = 4,
                             box(
                               title = "开始上传工资表",   
                               width = NULL,
                               solidHeader = TRUE,
                               status = "primary",
                               tsui::uiTemplate(templateName = '计提数据模版'),                      
                               tsui::mdl_file(id = 'salary', label ='上传工资表'),                                                 
                               shiny::actionButton(inputId = 'salary_file' , label = '预览工资表'),               
                               # shiny::actionButton(inputId = 'btn_export_updateERP' , label = '更新汇票等级'),
                               # tsui::mdl_download_button(id = 'dl_export_baseInfo', label = '下载处理结果')            
                             )
                             # ,
                             # box(
                             #   title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                             #   "Box content"
                             # ),
                             # box(
                             #   title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                             #   "Box content"
                             # )
                      ),
                      
                      # column(width = 4,
                      #        box(
                      #          title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                      #          "Box content"
                      #        ),
                      #        box(
                      #          title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                      #          "Box content"
                      #        ),
                      #        box(
                      #          title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                      #          "Box content"
                      #        )
                      # ),
                      
                      column(width=8,
                             box(
                               title = "数据预览", width = NULL, solidHeader = TRUE, status = "primary",
                               tsui::uiScrollX(tsui::mdl_dataTable(id = 'salary_view',label ='出口'))
                             )
                             # ,
                             # box(
                             #   title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                             #   "Box content"
                             # ),
                             # box(
                             #   title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                             #   "Box content"
                             # )
                      )
                    )
)

