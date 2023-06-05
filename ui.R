


# 1.00  shinyUI start point----

shinyUI(dashboardPage(skin = "blue",
                    
           
                    
                    dashboardHeader(title = app_title,
                                   
                                    headerMsg1,
                                    dynamicMsgMenu,
                                   # NotiMenuObj,
                                    disable = F
                    ),
                    
                    #ui.sideBar----
                    dashboardSidebar(
                    
                       sidebarMenu
                    ),
                    
                    #ui.body----
                    # 添加消息框
                    dashboardBody(
                      workAreaSetting,
                      tsui::use_pop()
                    )
)
)


