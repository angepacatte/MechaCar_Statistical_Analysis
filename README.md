#*MechaCar_Statistical_Analysis


## Linear Regression to Predict MPG

A linear regression was performed on MPG vs the other 5 variables in the MechaCar_mpg.csv.  The code used was this:

summary(lm(mpg~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg))

The results yielded are shown in the image below.  Based on the p-values in the far right column under PR(>|t|),vehicle_length and ground_clearance have p-values under 0.05.  This shows there is a statistical significance in their relationship with MPG. 

![image](https://user-images.githubusercontent.com/85581208/152648309-4f80ef44-64f2-49b3-b2f8-874fe6835b20.png)



The slope of the linear model is not zero.  The over all estimate or coefficient is -104.  The slope for vehicle_length is 6.267.  For vehicle_weight is close to zero at 0.001245.  The slope for spoiler_angle is 0.06877 so basically zero.  The slope for ground clearance is 3.546 an lastly for AWD is -3.411.  So only two variables are zero when rounded - vehicle_weight and spoiler_angle.

The linear model can predict prototypes based on the overall p-value of 5.08e-08.  This is significantly lower than the standard cutoff of 0.05 for the p-value.  Ultimately there are two values that have the most significant relationship with MPG.  Those are vehicle_length and ground_clearance.  The other three variables do not have statisitcal significance in relation to MPG based on this data.  This is not a very large set of data with only 50 rows.  A larger data set would be helpful in furthering the investigation of the correlation between the 5 variables and MPG.


## Summary Statistics on Suspension Coils

Here is the code to calculate the two variables asked for in Deliverable 2.

total_summary <-summarize(Suspension_Coil, mean = mean(PSI), median = median(PSI), variance = var(PSI), SD = sd(PSI)) 

lot_summary <-Suspension_Coil%>% group_by(Manufacturing_Lot)%>% summarize(mean = mean(PSI), median = median(PSI), variance = var(PSI), SD = sd(PSI)) 

total_summary is shown below.

![image](https://user-images.githubusercontent.com/85581208/152650184-5ec2aea3-bafd-4b05-b8e8-b289cb7fff27.png)




lot_summary is in image below.

![image](https://user-images.githubusercontent.com/85581208/152650201-f78fea9b-c65d-4520-9f93-bb5eb585d7a8.png)



The specification has been set that the variance must not exceed 100 PSI.  This is met when all lots are combined in the total_summary.  Variance is calculated at 62.29 psi.  This is well below 100.  When the variance is calculated for each lot, not all lots meet this requirement.  Lot1 and Lot1 variances are well below at 0.979 and 7.47, respectively.  Lot3 is well above with its variance of 170.29.  Lot3 is skewing the variance calculation in the total_summary.  Lot3 needs to examined further into why its variance is not staying within the specification.



## T-Tests on Suspension Coils

T-tests were calculated for the total_summary with a mu=1500.  The first t-test calculated with all lots is in the image below.
Based on these results the p-value is 0.18.  Therefore we do not have sufficient evidence to reject the null hypothesis.  Therefore the two means are statistically similar.

![image](https://user-images.githubusercontent.com/85581208/152651070-97a9f270-1a33-4426-9ca2-e6caba245b61.png)

The second part of Deliverable 3 was to run t-tests on subsets of each lot.  Code used to run this is:
lot1 <- subset(Suspension_Coil, Manufacturing_Lot=="Lot1")
lot2 <- subset(Suspension_Coil, Manufacturing_Lot=="Lot2")
lot3 <- subset(Suspension_Coil, Manufacturing_Lot=="Lot3")

t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)


Results for lot1:
![image](https://user-images.githubusercontent.com/85581208/152651263-cc1c5c2f-d78b-4652-b2b8-074f84ea7609.png)

Results for lot2:
![image](https://user-images.githubusercontent.com/85581208/152651399-70151067-cb7e-46ac-a28c-0f5fc6a814a7.png)


Results for lot3:
![image](https://user-images.githubusercontent.com/85581208/152651415-cd7dedd6-48c6-4f5b-9c80-9566abfc563f.png)





Looking at the p-value for each lot.  The p-value for lot1 is 1.  Meaning the mean for lot1 is close to 1500.  There is not enough evidence to reject the null hypothesis.  This is the same for lot2 as well with a p-value of 0.6072.  Well above 0.05.  The p-value for lot3 is 0.041.  This is below 0.05.  Therefore it could be stated that the mean for lot3 is not close to 1500.  The alternate hypothesis cannot be rejected.






