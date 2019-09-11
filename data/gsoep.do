* gsoep.do
* analyse des données GSOEP 2009

clear all

set more off

cd "/Users/chl/Documents/git/RITME/Stata101/data"

log using gsoep, replace

use "gsoep09.dta"

gen age = 2009 - ybirth
mvdecode income, mv(0=.c)
gen lincome = log(income)

summarize lincome
bysort sex: summarize lincome

// graph box lincome, over(sex) ytitle("Income (log(2))")
// graph save "boxplot.png"

log close
