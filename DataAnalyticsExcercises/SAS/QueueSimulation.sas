data queue;
retain arrive 0;
retain finish 0;
do i=1 to 200;
rand=ranuni(1);
type=1;
if rand<0.7 then type=2;
between=ranexp(5);
arrive=arrive+between;
service=2*ranexp(5);
if type=1 then service=5;
if i=1 then finish=arrive+service;
if i>1 then finish=max(arrive,finish)+service;
total=finish-arrive;
output;
end;
proc print data=queue;
run;




data arrive;
set queue;
evtype=1;
events=arrive;
keep evtype events;
output;
data finish;
set queue;
evtype=2;
events=finish;
keep evtype events;
output;
data events;
set arrive finish;
proc sort data=events;
by events;
proc print data=events;
run;



data length;
set events;
retain length -1;
if evtype=2 then length=length-1;
else length=length+1;
if evtype=1 then output;
keep length;
proc print data=length;
run;



data queue;
set queue;
merge length;
queue=total-service;
proc means data=queue mean max min;
var queue length;
run;


proc gplot data=queue;
symbol1 i=r v=plus;
plot arrive*finish;
run;


proc means data=queue;
var arrive finish;
run;


proc gplot data=queue;
symbol1 i=r v=plus;
plot arrive*length;
run;



proc means data=queue;
var arrive length;
run;


proc gplot data=queue;
symbol1 i=r v=plus;
plot arrive*service;
run;


proc means data=queue;
var arrive service;
run;


proc gplot data=queue;
symbol1 i=r v=plus;
plot between*service;
run;

proc means data=queue;
var between service;
run;


proc gplot data=queue;
symbol1 i=r v=plus;
plot service*length;
run;

proc means data=queue;
var service length;
run;


data queue;
retain arrive 0;
retain finish 0;
do i=1 to 200;
rand=ranuni(1);
type=1;
if rand<0.7 then type=2;
between=ranexp(5);
arrive=arrive+between;
service=2*ranexp(5);
if type=1 then service=5;
if type=1 then service=0;
if i=1 then finish=arrive+service;
if i>1 then finish=max(arrive,finish)+service;
total=finish-arrive;
if type=2 then output;
end; 
data queue;
set queue;
merge length;
queue=total-service;
proc means data=queue mean max min;
var queue length;
run;








