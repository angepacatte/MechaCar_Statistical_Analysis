MechaCar_table <- read.csv('MechaCar_mpg.csv', check.names = F,stringasFactors = F)

library(dplyr)

summary(lm(mpg~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg))

Suspension_table<- read.csv('Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

total_summary <-summarize(Suspension_Coil, mean = mean(PSI), median = median(PSI), variance = var(PSI), SD = sd(PSI)) 

lot_summary <-Suspension_Coil%>% group_by(Manufacturing_Lot)%>% summarize(mean = mean(PSI), median = median(PSI), variance = var(PSI), SD = sd(PSI)) 

All_lots<-t.test(total_summary, mu=1500)

lot1 <- subset(Suspension_Coil, Manufacturing_Lot=="Lot1")
lot2 <- subset(Suspension_Coil, Manufacturing_Lot=="Lot2")
lot3 <- subset(Suspension_Coil, Manufacturing_Lot=="Lot3")

t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)

