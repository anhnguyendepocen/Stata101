* Suite des analyses GSOEP

log using gsoep4, replace

do gsoep3.do

summarize age

histogram age
graph export "histogram-age.pdf", replace

summarize lincome

tabulate sex, summarize(lincome)

ttest lincome, by(sex)


recode egp (1/2=1) (3/5=2) (8/9=3) (15/18=.), gen(egp4)
label define egp4 1 "Service class 1/2" 2 "Non-manuals & Self-employed" 3 "Manuals"
label values egp4 egp4

tabulate egp4

graph box lincome, over(egp4)

oneway lincome egp4, tabulate
oneway lincome egp4, bonf


generate sexb = sex - 1
tabulate sexb

bitest sexb == 0.5
prtest sexb == 0.5


generate egpb = egp4 == 1
prtest egpb, by(sexb)

log close
