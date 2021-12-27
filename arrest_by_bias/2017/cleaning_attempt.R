
#Read in the CSV file  
arrest <- read.csv("./2017_arrest_motivation.csv", header=TRUE, check.names=F)

#Set specific row to be the header using janitor package 
newest_arrest <- janitor::row_to_names(arrest,5)


#Fix data types
newest_arrest <- transform(newest_arrest, Precinct = as.numeric(Precinct), 
               Number = as.numeric(Number)) 

newest_arrest <- transform(newest_arrest, X.Age = as.numeric(X.Age))

#Fill in missing precinct values

fixed_precinct <- newest_arrest %>% fill(Precinct)

#Remove last row which is empty

clean_df = fixed_precinct[-c(141)]

#Set Number as index 

df <- fixed_precinct %>%
  column_to_rownames('Number')

#Write cleaned CSV

write.csv(fixed_precinct,"/Users/savannahestridge/Desktop/NYC_hate_crimes/arrest_by_bias/2017/2017_arrest_motivation.csv", row.names = FALSE)


