* Analyse des données GSOEP

log using gsoep3, replace

clear all
cd "/Users/chl/Documents/git/RITME/Stata101/data"

use gsoep09

generate age = 2009 - ybirth
label variable age "Participant's age"
order age, after(ybirth)

mvdecode income, mv(0=.c)
generate lincome = log(income)

log close
