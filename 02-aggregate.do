/*  File generated by StatWeave  */
display "--- Ou" "tput file from StatWeave, engine = StataEngine ---"

/* ---- Chunk 1: "02-aggregate-1-Stata" ----- */
set scheme lean2

/* ---- Chunk 2: "02-aggregate-2-Stata" ----- */
use data/gsoep09
describe, short

/* ---- Chunk 3: "02-aggregate-3-Stata" ----- */
describe, simple

/* ---- Chunk 4: "02-aggregate-4-Stata" ----- */
list persnr-sex in 1/5

/* ---- Chunk 5: "02-aggregate-5-Stata" ----- */
summarize income  

/* ---- Chunk 6: "02-aggregate-6-Stata" ----- */
list sex ybirth in 1/3  

/* ---- Chunk 7: "02-aggregate-7-Stata" ----- */
list ybirth-edu in 3  

/* ---- Chunk 8: "02-aggregate-8-Stata" ----- */
list income in 100/103, sum  

/* ---- Chunk 9: "02-aggregate-9-Stata" ----- */
list income in 100/103, sepby(sex)  

/* ---- Chunk 10: "02-aggregate-10-Stata" ----- */
list sex income in 100/103, divider  

/* ---- Chunk 11: "02-aggregate-11-Stata" ----- */
list sex if ybirth <= 1910

/* ---- Chunk 12: "02-aggregate-12-Stata" ----- */
list ybirth if inrange(income, 500, 600)  

/* ---- Chunk 13: "02-aggregate-13-Stata" ----- */
list ybirth income if inlist(ybirth, 1985, 1990) & (income > 0 & income < 600)  

/* ---- Chunk 14: "02-aggregate-14-Stata" ----- */
generate age = 2009 - ybirth
summarize age, detail

/* ---- Chunk 15: "02-aggregate-15-Stata" ----- */
generate age_ = age 
drop age

/* ---- Chunk 16: "02-aggregate-16-Stata" ----- */
rename age_ age

/* ---- Chunk 17: "02-aggregate-17-Stata" ----- */
generate lincome = log(income)
summarize *income

/* ---- Chunk 18: "02-aggregate-18-Stata" ----- */
replace lincome = log(income+1)  
summarize *income

/* ---- Chunk 19: "02-aggregate-19-Stata" ----- */
summarize size

/* ---- Chunk 21: "02-aggregate-21-Stata" ----- */
egen agec = cut(age), at(15,20,25,35,50,70,110)
tabulate agec    

/* ---- Chunk 23: "02-aggregate-23-Stata" ----- */
drop agec
xtile agec = age, nq(4)
tabulate agec  

/* ---- Chunk 24: "02-aggregate-24-Stata" ----- */
count if sex == 1 & age < 18  

/* ---- Chunk 25: "02-aggregate-25-Stata" ----- */
quietly: tabulate hhnr2009
return list

/* ---- Chunk 27: "02-aggregate-27-Stata" ----- */
unique hhnr2009

/* ---- Chunk 28: "02-aggregate-28-Stata" ----- */
gen age_ = age
replace age_ = . in 3
list age* in 1/3   

/* ---- Chunk 29: "02-aggregate-29-Stata" ----- */
tabulate sex if !missing(age_)  

/* ---- Chunk 30: "02-aggregate-30-Stata" ----- */
misstable summarize age*    

/* ---- Chunk 31: "02-aggregate-31-Stata" ----- */
drop age_ agec 

/* ---- Chunk 32: "02-aggregate-32-Stata" ----- */
count if income == 0

/* ---- Chunk 33: "02-aggregate-33-Stata" ----- */
summarize age if sex == 1 & income == 0  

/* ---- Chunk 34: "02-aggregate-34-Stata" ----- */
mvdecode income, mv(0=.c)

/* ---- Chunk 35: "02-aggregate-35-Stata" ----- */
summarize age if sex == 1 & missing(income)

/* ---- Chunk 37: "02-aggregate-37-Stata" ----- */
tabulate sex

/* ---- Chunk 38: "02-aggregate-38-Stata" ----- */
tabulate sex emp

/* ---- Chunk 39: "02-aggregate-39-Stata" ----- */
tabulate sex mar, row cell

/* ---- Chunk 40: "02-aggregate-40-Stata" ----- */
tabulate sex, summarize(age)

/* ---- Chunk 41: "02-aggregate-41-Stata" ----- */
tabulate sex, summarize(age) nofreq

/* ---- Chunk 42: "02-aggregate-42-Stata" ----- */
by sex, sort: summarize age  

/* ---- Chunk 43: "02-aggregate-43-Stata" ----- */
table sex, contents(mean age sd age)

/* ---- Chunk 44: "02-aggregate-44-Stata" ----- */
table sex, contents(mean age iqr size p50 hhsize) format(%5.1f)

/* ---- Chunk 45: "02-aggregate-45-Stata" ----- */
table sex mar, contents(mean age sd age)

/* ---- Chunk 46: "02-aggregate-46-Stata" ----- */
table voc emp if voc > 4 & !missing(voc), by(sex)

/* ---- Chunk 47: "02-aggregate-47-Stata" ----- */
tabstat age, by(sex)

/* ---- Chunk 48: "02-aggregate-48-Stata" ----- */
tabstat age, by(sex) stat(mean sd n)

/* ---- Chunk 49: "02-aggregate-49-Stata" ----- */
quietly: tabstat age, by(sex) stat(mean sd n) save
return list

/* ---- Chunk 50: "02-aggregate-50-Stata" ----- */
summarize age, meanonly
display r(mean)

/* ---- Chunk 51: "02-aggregate-51-Stata" ----- */
quantile age

/* ---- Chunk 52: "02-aggregate-52-Stata" ----- */
qnorm age, grid 

/* ---- Chunk 53: "02-aggregate-53-Stata" ----- */
histogram age, xtitle("Age des participants")

/* ---- Chunk 54: "02-aggregate-54-Stata" ----- */
label variable age "Age des participants"
histogram age, bin(15) by(sex)

/* ---- Chunk 55: "02-aggregate-55-Stata" ----- */
kdensity age

/* ---- Chunk 56: "02-aggregate-56-Stata" ----- */
kdensity age, normal bw(10) lwidth(0.8)

/* ---- Chunk 58: "02-aggregate-58-Stata" ----- */
twoway (kdensity age), by(sex)

/* ---- Chunk 59: "02-aggregate-59-Stata" ----- */
histogram edu, discrete freq addlabels

/* ---- Chunk 60: "02-aggregate-60-Stata" ----- */
histogram edu, discrete freq addlabels gap(10) xla(1/5, valuelabel noticks ang(45))

/* ---- Chunk 61: "02-aggregate-61-Stata" ----- */
graph box age, over(sex)

/* ---- Chunk 63: "02-aggregate-63-Stata" ----- */
replace lincome = log(income)

/* ---- Chunk 64: "02-aggregate-64-Stata" ----- */
scatter lincome age

/* ---- Chunk 65: "02-aggregate-65-Stata" ----- */
scatter lincome age || lowess lincome age