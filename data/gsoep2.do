* Familiarisation avec les données GSOEP

/* 
   Formation Stata 1
   Santé publique France
 */
 
use gsoep09, replace

generate age = 2009 - ybirth

summarize age

mvdecode income, mv(0=.c)
generate lincome = log(income)
