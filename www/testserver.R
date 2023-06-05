



#shinyserver start point----


shinyServer(function(input, output, session) {
  #预览工资功能处理 begin----
  salary_var_file_export_baseInfo = tsui::var_file('salary')
  shiny::observeEvent(input$salary_file,
                      {
                        print('you click me ! ')
                        
                        #获取文件路径
                        salary_file_name = salary_var_file_export_baseInfo()
                        print(salary_file_name)
                        
                        #读取文件
                        salary_data_excel <-
                          readxl::read_excel(
                            salary_file_name,
                            sheet = '工资',
                            col_types = c(
                              "text",
                              "text",
                              "text",
                              "text",
                              "text",
                              "text",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "text",
                              "text",
                              "text",
                              "numeric",
                              "date",
                              "text"
                            )
                          )
                        
                        #显示数据
                        tsui::run_dataTable2(id = 'salary_view', data = salary_data_excel)
                        names(salary_data_excel) = c(
                          'FExpenseOrgID',
                          'FTaxDeclarationOrg',
                          'FBankType',
                          'FAccount',
                          'FHightechDept',
                          'FRdProject',
                          'FCpayAmount',
                          'FFixdCost',
                          'FScraprateCost',
                          'FSocialSecurityAmt',
                          'FAccumulationFundAmt',
                          'FOtherAmt',
                          'FIncomeTaxAmt',
                          'FActualAmount',
                          'FYear',
                          'FMonth',
                          'FVoucher',
                          'FCategoryType',
                          'FNumber',
                          'FSeq',
                          'FDate',
                          'FOldDept'
                        )
                        print(salary_data_excel)
                        salary_data_excel$FBankType = tsdo::na_replace(salary_data_excel$FBankType, '')
                        salary_data_excel$FRdProject = tsdo::na_replace(salary_data_excel$FRdProject, '')
                        salary_data_excel$FOldDept = tsdo::na_replace(salary_data_excel$FOldDept, '')
                        
                        salary_data_excel$FCpayAmount = tsdo::na_replace(salary_data_excel$FCpayAmount, 0)
                        salary_data_excel$FFixdCost = tsdo::na_replace(salary_data_excel$FFixdCost, 0)
                        salary_data_excel$FScraprateCost = tsdo::na_replace(salary_data_excel$FScraprateCost, 0)
                        salary_data_excel$FSocialSecurityAmt = tsdo::na_replace(salary_data_excel$FSocialSecurityAmt, 0)
                        salary_data_excel$FAccumulationFundAmt = tsdo::na_replace(salary_data_excel$FAccumulationFundAmt, 0)
                        salary_data_excel$FIncomeTaxAmt = tsdo::na_replace(salary_data_excel$FIncomeTaxAmt, 0)
                        salary_data_excel$FActualAmount = tsdo::na_replace(salary_data_excel$FActualAmount, 0)
                        
                        # 写入中间表
                        tsda::db_writeTable2(
                          token = token,
                          table_name = 'rds_hrv_src_ds_salary_input',
                          r_object = salary_data_excel,
                          append = FALSE
                        )
                        
                        dsql = 'delete a from rds_hrv_src_ds_salary_input  a inner join rds_hrv_src_ds_salary b On a.FNumber=b.FNumber and a.FYear =b.FYear and a.FMonth =b.FMonth'
                        tsda::sql_update2(token = token, sql_str = dsql)
                        
                        isql = 'insert into rds_hrv_src_ds_salary  select * from rds_hrv_src_ds_salary_input'
                        tsda::sql_insert2(token = token, sql_str = isql)
                        
                        dsql = 'truncate table rds_hrv_src_ds_salary_input'
                        tsda::sql_update2(token = token, sql_str = dsql)
                        
                        
                        
                      })
  #预览工资功能处理 end----
  
  
  #预览社保公积金功能处理 begin----
  socialsecurity_var_file_export_baseInfo = tsui::var_file('socialsecurity')
  shiny::observeEvent(input$socialsecurity_file,
                      {
                        print('you click me ! ')
                        
                        #获取文件路径
                        socialsecurity_file_name = socialsecurity_var_file_export_baseInfo()
                        print(socialsecurity_file_name)
                        
                        #读取文件
                        socialsecurity_data_excel <-
                          readxl::read_excel(
                            socialsecurity_file_name,
                            sheet = '社保',
                            col_types = c(
                              "text",
                              "text",
                              "text",
                              "text",
                              "text",
                              "text",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "text",
                              "text",
                              "text",
                              "numeric",
                              "date",
                              "text"
                            )
                          )
                        names(socialsecurity_data_excel) = c(
                          'FExpenseOrgID',
                          'FTaxDeclarationOrg',
                          'FBankType',
                          'FHightechDept',
                          'FAccount',
                          'FRdProject',
                          'FComPensionBenefitsAmt',
                          'FComMedicareAmt',
                          'FComMedicareOfSeriousAmt',
                          'FComDisabilityBenefitsAmt',
                          'FComOffsiteElseAmt',
                          'FComWorklessInsuranceAmt',
                          'FComInjuryInsuranceAmt',
                          'FComMaternityInsuranceAmt',
                          'FComAllSocialSecurityAmt',
                          'FComAccumulationFundAmt',
                          'FComAllSoSeAcFuAmt',
                          'FEmpPensionBenefitsAmt',
                          'FEmpMedicareAmt',
                          'FEmpMedicareOfSeriousAmt',
                          'FEmpWorklessInsuranceAmt',
                          'FEmpAllSocialSecurityAmt',
                          'FEmpAccumulationFundAmt',
                          'FEmpAllSoSeAcFuAmt',
                          'FAllSocialSecurityAmt',
                          'FAllAccumulationFundAmt',
                          'FAllAmount',
                          'FManagementAmount',
                          'FYear',
                          'FMonth',
                          'FVoucher',
                          'FCategoryType',
                          'FNumber',
                          'FSeq',
                          'FDate',
                          'FOldDept'
                        )
                        
                        #显示数据
                        tsui::run_dataTable2(id = 'socialsecurity_view', data = socialsecurity_data_excel)
                        
                        socialsecurity_data_excel$FBankType = tsdo::na_replace(socialsecurity_data_excel$FBankType, '')
                        socialsecurity_data_excel$FRdProject = tsdo::na_replace(socialsecurity_data_excel$FRdProject, '')
                        
                        socialsecurity_data_excel$FComPensionBenefitsAmt = tsdo::na_replace(socialsecurity_data_excel$FComPensionBenefitsAmt, 0)
                        socialsecurity_data_excel$FComMedicareAmt = tsdo::na_replace(socialsecurity_data_excel$FComMedicareAmt, 0)
                        socialsecurity_data_excel$FComMedicareOfSeriousAmt = tsdo::na_replace(socialsecurity_data_excel$FComMedicareOfSeriousAmt, 0)
                        socialsecurity_data_excel$FComOffsiteElseAmt = tsdo::na_replace(socialsecurity_data_excel$FComOffsiteElseAmt, 0)
                        socialsecurity_data_excel$FComWorklessInsuranceAmt = tsdo::na_replace(socialsecurity_data_excel$FComWorklessInsuranceAmt, 0)
                        socialsecurity_data_excel$FComInjuryInsuranceAmt = tsdo::na_replace(socialsecurity_data_excel$FComInjuryInsuranceAmt, 0)
                        socialsecurity_data_excel$FComMaternityInsuranceAmt = tsdo::na_replace(socialsecurity_data_excel$FComMaternityInsuranceAmt, 0)
                        socialsecurity_data_excel$FComAllSocialSecurityAmt = tsdo::na_replace(socialsecurity_data_excel$FComAllSocialSecurityAmt, 0)
                        socialsecurity_data_excel$FComAccumulationFundAmt = tsdo::na_replace(socialsecurity_data_excel$FComAccumulationFundAmt, 0)
                        socialsecurity_data_excel$FComAllSoSeAcFuAmt = tsdo::na_replace(socialsecurity_data_excel$FComAllSoSeAcFuAmt, 0)
                        socialsecurity_data_excel$FEmpPensionBenefitsAmt = tsdo::na_replace(socialsecurity_data_excel$FEmpPensionBenefitsAmt, 0)
                        socialsecurity_data_excel$FEmpMedicareAmt = tsdo::na_replace(socialsecurity_data_excel$FEmpMedicareAmt, 0)
                        socialsecurity_data_excel$FEmpMedicareOfSeriousAmt = tsdo::na_replace(socialsecurity_data_excel$FEmpMedicareOfSeriousAmt, 0)
                        socialsecurity_data_excel$FEmpWorklessInsuranceAmt = tsdo::na_replace(socialsecurity_data_excel$FEmpWorklessInsuranceAmt, 0)
                        socialsecurity_data_excel$FEmpAllSocialSecurityAmt = tsdo::na_replace(socialsecurity_data_excel$FEmpAllSocialSecurityAmt, 0)
                        socialsecurity_data_excel$FEmpAccumulationFundAmt = tsdo::na_replace(socialsecurity_data_excel$FEmpAccumulationFundAmt, 0)
                        socialsecurity_data_excel$FEmpAllSoSeAcFuAmt = tsdo::na_replace(socialsecurity_data_excel$FEmpAllSoSeAcFuAmt, 0)
                        socialsecurity_data_excel$FAllSocialSecurityAmt = tsdo::na_replace(socialsecurity_data_excel$FAllSocialSecurityAmt, 0)
                        socialsecurity_data_excel$FAllAccumulationFundAmt = tsdo::na_replace(socialsecurity_data_excel$FAllAccumulationFundAmt, 0)
                        socialsecurity_data_excel$FAllSocialSecurityAmt = tsdo::na_replace(socialsecurity_data_excel$FAllSocialSecurityAmt, 0)
                        socialsecurity_data_excel$FAllAmount = tsdo::na_replace(socialsecurity_data_excel$FAllAmount, 0)
                        socialsecurity_data_excel$FManagementAmount = tsdo::na_replace(socialsecurity_data_excel$FManagementAmount, 0)
                        
                        # 写入社保公积金中间表
                        tsda::db_writeTable2(
                          token = token,
                          table_name = 'rds_hrv_src_ds_socialsecurity_input',
                          r_object = socialsecurity_data_excel,
                          append = FALSE
                        )
                        
                        dsql = 'delete a from rds_hrv_src_ds_socialsecurity_input  a inner join rds_hrv_src_ds_socialsecurity b On a.FNumber=b.FNumber and a.FYear =b.FYear and a.FMonth =b.FMonth'
                        tsda::sql_update2(token = token, sql_str = dsql)
                        
                        isql = 'insert into rds_hrv_src_ds_socialsecurity  select * from rds_hrv_src_ds_socialsecurity_input'
                        tsda::sql_insert2(token = token, sql_str = isql)
                        
                        dsql = 'truncate table rds_hrv_src_ds_socialsecurity_input'
                        tsda::sql_update2(token = token, sql_str = dsql)
                      })
  # 预览社保公积金功能处理 end----
  
  
  # 预览工时功能处理 begin----
  redetail_var_file_export_baseInfo = tsui::var_file('redetail')
  shiny::observeEvent(input$redetail_file,
                      {
                        print('you click me ! ')
                        
                        #获取文件路径
                        redetail_file_name = redetail_var_file_export_baseInfo()
                        print(redetail_file_name)
                        
                        #读取文件
                        redetail <-
                          readxl::read_excel(redetail_file_name, sheet = '工时')
                        
                        
                        #显示数据
                        tsui::run_dataTable2(id = 'redetail_view', data = redetail)
                        print(redetail)
                        
                        
                        # 将非研发金额空值替换为0
                        redetail$非研发工资成本  = tsdo::na_replace(redetail$非研发工资成本, 0)
                        
                        # 非研发工时表字段
                        col_nonrd = c(
                          '序号',
                          '工资类别',
                          '会计年度',
                          '会计期间',
                          '原部门',
                          '高新部门',
                          '姓名',
                          '费用承担组织',
                          '个税申报组织',
                          '单据编号',
                          '非研发工资成本'
                        )
                        
                        # 筛选非研发金额不为0的数据
                        nonrddetail = redetail[redetail$非研发工资成本  != 0, col_nonrd]
                        
                        # 更名为数据库字段名
                        names(nonrddetail) = c(
                          'FNO',
                          'FSalaryType',
                          'FYear',
                          'FMonth',
                          'FOldDept',
                          'FHightechDept',
                          'FStaffName',
                          'FExpenseOrgID',
                          'FTaxDeclarationOrg',
                          'FNumber',
                          'FNonRdCost'
                        )
                        nonrddetail$FRdProject = ''
                        View(nonrddetail)
                        
                        # 工时表固定字段
                        col_fixed = c(
                          '序号',
                          '工资类别',
                          '会计年度',
                          '会计期间',
                          '原部门',
                          '高新部门',
                          '姓名',
                          '费用承担组织',
                          '个税申报组织',
                          '单据编号',
                          '单项总额',
                          '研发工资成本',
                          '非研发工资成本'
                        )
                        
                        # 研发项目列转行
                        redetail2 <-
                          reshape2::melt(
                            data = redetail,
                            id.vars = col_fixed,
                            variable.name = '研发项目',
                            value.name = '研发金额'
                          )
                        
                        # 研发工时表字段
                        col_rd = c(
                          '序号',
                          '工资类别',
                          '会计年度',
                          '会计期间',
                          '原部门',
                          '高新部门',
                          '姓名',
                          '费用承担组织',
                          '个税申报组织',
                          '单据编号',
                          '研发项目',
                          '研发金额'
                        )
                        
                        # 筛选研发工时需要字段
                        rddetail = redetail2[, col_rd]
                        
                        # 研发金额为空时替换为0
                        rddetail$研发金额  = tsdo::na_replace(rddetail$研发金额, 0)
                        
                        # 筛选研发金额不为0数据
                        rddetail = rddetail[rddetail$研发金额  != 0, col_rd]
                        
                        # 替换为数据库字段
                        names(rddetail) = c(
                          'FNO',
                          'FSalaryType',
                          'FYear',
                          'FMonth',
                          'FOldDept',
                          'FHightechDept',
                          'FStaffName',
                          'FExpenseOrgID',
                          'FTaxDeclarationOrg',
                          'FNumber',
                          'FRdProject',
                          'FRdProjectCost'
                        )
                        View(rddetail)
                        
                        
                        # 写入研发工时中间表
                        tsda::db_writeTable2(
                          token = token,
                          table_name = 'rds_hrv_src_ds_rddetail_input',
                          r_object = rddetail,
                          append = FALSE
                        )
                        
                        dsql = 'delete a from rds_hrv_src_ds_rddetail_input  a inner join rds_hrv_src_ds_rddetail b On a.FNumber=b.FNumber and a.FYear =b.FYear and a.FMonth =b.FMonth'
                        tsda::sql_update2(token = token, sql_str = dsql)
                        
                        isql = 'insert into rds_hrv_src_ds_rddetail  select * from rds_hrv_src_ds_rddetail_input'
                        tsda::sql_insert2(token = token, sql_str = isql)
                        
                        dsql = 'truncate table rds_hrv_src_ds_rddetail_input'
                        tsda::sql_update2(token = token, sql_str = dsql)
                        
                        # 写入非研发工时中间表
                        tsda::db_writeTable2(
                          token = token,
                          table_name = 'rds_hrv_src_ds_nonrddetail_input',
                          r_object = nonrddetail,
                          append = FALSE
                        )
                        
                        dsql = 'delete a from rds_hrv_src_ds_nonrddetail_input  a inner join rds_hrv_src_ds_nonrddetail b On a.FNumber=b.FNumber and a.FYear =b.FYear and a.FMonth =b.FMonth'
                        tsda::sql_update2(token = token, sql_str = dsql)
                        
                        isql = 'insert into rds_hrv_src_ds_nonrddetail  select * from rds_hrv_src_ds_nonrddetail_input'
                        tsda::sql_insert2(token = token, sql_str = isql)
                        
                        dsql = 'truncate table rds_hrv_src_ds_nonrddetail_input'
                        tsda::sql_update2(token = token, sql_str = dsql)
                        
                        
                      })
  #预览工时功能处理 end----
  var_hr_sheet = tsui::var_ListChoose1('hr_sheet')
  observeEvent(input$btn_upload,{
    sheet_name = var_hr_sheet()
    print(sheet_name)
  })
  
})
