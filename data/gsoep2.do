* Familiarisation avec les donn�es GSOEP

/* 
   Formation Stata 1
   Sant� publique France
 */
 
use gsoep09, replace

generate age = 2009 - ybirth

summarize age

mvdecode income, mv(0=.c)
generate lincome = log(income)
