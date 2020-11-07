#One sample T.test
> help(read.csv)
> data <- read.csv(file.choose(), header=T)
> data
  
> attach(data)
> names(data)
> class(data)
> help(t.test)
> boxplot(data)
> boxplot(Lungcap)
> #Ho: mu < 8
> #one-sided 95% confidence interval for mu
> t.test(Lungcap, mu=8, alternative="less", conf.level=0.95)

	 

> # two-sided
> t.test(Lungcap, mu=8, alt="two.sided", conf=0.95)

	
#Two sample Ttest
> help(read.csv)
> data <- read.csv(file.choose(), header=T)
> data
    
> attach(data)
> names(data)
> boxplot(Heinz ~ Gender)
> # Ho: mean heinz of 0 = of 1
> # two-sided test
> # assume non-equal variances
> 
> t.test(Heinz ~ Gender, mu=0, alt="two.sided", conf=0.95, var.eq=F, paired=F) 

> boxplot(Preference ~ Gender)
> # Ho: mean preference of 0 = of 1
> # two-sided test
> # assume non-equal variances
> 
> t.test(Preference ~ Gender, mu=0, alt="two.sided", conf=0.95, var.eq=F, paired=F) 
> t.test(Heinz[Gender==0], Heinz[Gender==1])
> var(Heinz[Gender==0])
> var(Heinz[Gender==1])
#Paired Ttest
> help(read.csv)
> data <- read.csv(file.choose(),header=T)
> data   
> attach(data)
> names(data)    
> dim(data)
> help(t.test)
> boxplot(Heinz, Tesco)
> plot(Heinz, Tesco) 
> # Ho mean difference in heinz = in tesco
> # two-sided test
> t.test(Heinz, Tesco, mu=0, alt="two-sided", paired=T, conf.level=0.95)
> t.test(Heinz, Tesco, mu=0, alt="two.sided", paired=T, conf.level=0.95)
