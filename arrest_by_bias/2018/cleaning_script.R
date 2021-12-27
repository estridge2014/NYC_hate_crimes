arrest <- read.csv("./2018_arrest_motivation.csv", header=TRUE, check.names=F)

#Set specific row to be the header using janitor package 
newest_arrest <- janitor::row_to_names(arrest,5)

new_precinct <- newest_arrest %>% fill('Precinct')

newest_arrest <- transform(newest_arrest, Precinct = as.numeric(Precinct), 
                           Number = as.numeric(Number)) 

newest_arrest <- transform(newest_arrest, Age = as.numeric(Age))


#Fill in Precinct NA values
fixed_precinct <- newest_arrest %>% fill(Precinct)

#Remove unwanted columns 
fixed_precinct <- fixed_precinct %>% select(1:6)

write.csv(fixed_precinct,"/Users/savannahestridge/Desktop/NYC_hate_crimes/arrest_by_bias/2018/2018_arrest_motivation.csv", row.names = FALSE)


