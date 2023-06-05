menu_book<- tabItem(tabName = "book",
                       fluidRow(
                         column(width = 4,
                                box(
                                  title = "开始上传工时表",
                                  width = NULL,
                                  solidHeader = TRUE,
                                  status = "primary",
                                  tsui::uiTemplate(templateName = '计提数据模版'),
                                  tsui::mdl_file(id = 'redetail', label ='工时表'),
                                  shiny::actionButton(inputId = 'redetail_file' , label = '预览工时表'),
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
                                  tsui::uiScrollX(tsui::mdl_dataTable(id = 'redetail_view',label ='出口'))
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

