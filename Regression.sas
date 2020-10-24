data restaurant;
input restaurants population sales;
datalines;
1  2  58
2  6  103
3  8  90
4  8  110
5  12 125
6  16 139
7  20 155
8  20 172
9  22 155
10 24 99
11 26 202
;
run;
proc print data=restaurant;
run;
proc reg data=restaurant;
model population=sales;
run;


proc gplot data=restaurant;
symbol1 i=r v=plus;
plot population*sales;
run;


proc reg data=restaurant;
model population=sales;
output out=regdata p=predict residual=resid rstudent=delresid lcl=lowercl ucl=uppercl;
proc print data=regdata;
run;


proc means data=regdata min max;
var delresid;
run;



data restaurant2;
set regdata;
if -2.5<delresid<2.5;
keep population sales;
proc gplot data=restaurant2;
symbol1 i=r v=plus;
plot population*sales;
run;


proc reg data=restaurant2;
model population=sales;
output out=regdata2 p=predict residual=resid rstudent=delresid lcl=lowercl ucl=uppercl;
proc print data=regdata2;
run;


data extra;
input sales population;
datalines;
.  15 
data restaurant2;
set restaurant2 extra;
proc reg data=retaurant2;
model sales=population;
output out=regdata2 p=predict residual=resid rstudent=delresid lcl=lowercl ucl=uppercl;
proc print data=restaurant2;
run;
proc reg data=restaurant2;
model sales=population;
output out=regdata2 p=predict residual=resid rstudent=delresid lcl=lowercl ucl=uppercl;
proc print data=regdata2;
run;
