#ANOVA
> help(read.csv)
> data <- read.csv(file.choose(), header=T)
> data
> attach(data)
> names(data)
> class(anticlot)
> levels(anticlot)
> help(aov)
> boxplot(cost ~ anticlot)
> 
> # Ho: Mean cost is same for all anticlots
> aov(cost ~ anticlot)
> ANOVA1 = aov(cost ~ anticlot)
> ANOVA1
> summary(ANOVA1)          
> attributes(ANOVA1)
> ANOVA1$coefficients
