menu_row <- tabItem(tabName = "row",
                    fluidRow(column(
                      width = 4,
                      box(
                        title = "上传数据区域",
                        width = NULL,
                        solidHeader = TRUE,
                        status = "primary",
                        tsui::uiTemplate(templateName = '计提数据模版'),
                        tsui::mdl_file(id = 'uploadfile', label =
                                         '上传excel数据表'),
                        tsui::mdl_ListChoose1(
                          id = 'hr_sheet',
                          label = '数据类型',
                          choiceNames = list('工资', '社保', '工时'),
                          choiceValues = list('工资', '社保', '工时'),
                          selected = '工资'),
                        shiny::actionButton(inputId = 'view' , label = '预览表单数据'),
                        shiny::actionButton(inputId = 'btn_upload' , label = '确认上传数据'),
                        shiny::actionButton(inputId = 'btn_reupload' , label = '重新上传数据')
                  
                        
                      ),
                      box(
                        title = "生成凭证区域",
                        width = NULL,
                        solidHeader = TRUE,
                        status = "primary",
                        mdl_numeric(
                          id = 'hr_year',
                          label = '会计年度',
                          min = 2023,
                          max = 2100,
                          step = 1,
                          value = as.integer(tsdo::getYear())
                        ),
                        mdl_numeric(
                          id = 'hr_month',
                          label = '会计期间',
                          min = 1,
                          max = 12,
                          step = 1,
                          value = as.integer(tsdo::getMonth())
                        )
                        # tsui::mdl_integer(id = 'hr_month',label = 'month',min = 1,max = 12,step = 1)
                        
                        ,
                        tsui::mdl_ListChoose1(
                          id = 'environment',
                          label = '选择操作环境',
                          choiceNames = list('账套查询DMS测试', '江苏嘉好热熔胶股份有限公司'),
                          choiceValues = list('账套查询DMS测试', '江苏嘉好热熔胶股份有限公司'),
                          selected = '账套查询DMS测试'),
                        shiny::actionButton(inputId = 'outputvoucher', label = '生成凭证'),
                        shiny::actionButton(inputId = 'outputvoucher2', label = '重新生成凭证'),
                        # tsui::mdl_download_button(id = 'btn_Asone_download1',label = '下载成功日志'),
                        tsui::mdl_download_button(id = 'btn_Asone_download',label = '下载日志')
                      )
                      # box(
                      #   title = "系统环境", width = NULL, solidHeader = TRUE, status = "primary",
                      # 
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
                    
                    column(
                      width = 8,
                      box(
                        title = "数据预览",
                        width = NULL,
                        solidHeader = TRUE,
                        status = "primary",
                        tsui::uiScrollX(tsui::mdl_dataTable(id = 'view_data', label =
                                                              '出口'))
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
                    )))
