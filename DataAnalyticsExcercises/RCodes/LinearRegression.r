#Linear Regression in R
> help(read.csv)
> ?read.csv
> 
> data <- read.csv(file.choose(), header=T)
> 
> data
   
> # Attach the data
> attach(data)
> # Check names
> names(data)
> # Check the type of variable for sales and price
> class(sales)
> class(price)
> class(Carmodel)
> 
> plot(price, sales, main="scatterplot")
> 
> cor(price, sales)
> 
> help(lm)
> ?lm
> 
> mod <- lm(sales ~ price)
> 
> summary(mod)


> 
> attributes(mod)
> 
> mod$coefficients
> 
> mod$coef
> 
> coef(mod)
> 
> plot(price, sales, main="scatterplot")
> 
> abline(mod)
> 
> confint(mod)
> confint(mod, level=0.99)
                
> summary(mod)


> anova(mod)
