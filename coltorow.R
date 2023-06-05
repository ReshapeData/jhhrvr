library(readxl)
redetail <- read_excel("工时表模版.xlsx")
View(redetail)


redetail$非研发工资成本 = tsdo::na_replace(redetail$非研发工资成本, 0)
col_nonrd = c('序号', '工资类别', '会计年度', '会计期间', '原部门', '高新部门', '姓名', '费用承担组织', '个税申报组织',
           '单据编号','非研发工资成本')
nonrddetail = redetail[redetail$非研发工资成本 != 0, col_nonrd]
names(nonrddetail) = c('FNO', 'FSalaryType', 'FYear', 'FMonth', 'FOldDept', 'FHightechDept', 'FStaffName',
                      'FExpenseOrgID', 'FTaxDeclarationOrg', 'FNumber', 'FNonRdCost')
View(nonrddetail)


col_fixed = c('序号', '工资类别', '会计年度', '会计期间', '原部门', '高新部门', '姓名', '费用承担组织', '个税申报组织',
              '单据编号', '单项总额', '研发工资成本', '非研发工资成本')
redetail2 <- reshape2::melt(redetail = redetail,id.vars=col_fixed,variable.name='研发项目',value.name='研发金额')

col_rd = c('序号', '工资类别', '会计年度', '会计期间', '原部门', '高新部门', '姓名', '费用承担组织', '个税申报组织',
           '单据编号', '研发项目','研发金额')
rddetail = redetail2[,col_rd]

rddetail$研发金额 = tsdo::na_replace(rddetail$研发金额, 0)
rddetail = rddetail[rddetail$研发金额 != 0, col_rd]
names(rddetail) = c('FNO', 'FSalaryType', 'FYear', 'FMonth', 'FOldDept', 'FHightechDept', 'FStaffName',
                   'FExpenseOrgID', 'FTaxDeclarationOrg', 'FNumber', 'FRdProject', 'FRdProjectCost')
View(rddetail)
