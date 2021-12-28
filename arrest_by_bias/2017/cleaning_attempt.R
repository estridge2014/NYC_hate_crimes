
#Read in the CSV file  
number_index_arrest <- read.csv("./2017_arrest_motivation.csv", header=TRUE, check.names=F, row.names="Number")
newest_arrest <- arrest

#Set specific row to be the header using janitor package 
newest_arrest <- janitor::row_to_names(newest_arrest,5)


#Fix data types
newest_arrest <- transform(newest_arrest, Precinct = as.numeric(Precinct), 
               Number = as.numeric(Number)) 

newest_arrest <- transform(newest_arrest, X.Age = as.numeric(X.Age))

#Fill in missing precinct values

newest_arrest <- newest_arrest %>% fill(Precinct)

#Remove last row which is empty

clean_df <- newest_arrest[-c(136), ]


#Set Number as index 

index_df <- clean_df

final <- index_df[, c(2, 1, 3, 4, 5, 6)]


library(tidyverse)

#Fix Age column name 
age_df <- final 

names(age_df)[5] <- 'Age'

final <- age_df

#Write cleaned CSV

write.csv(final,"/Users/savannahestridge/Desktop/NYC_hate_crimes/arrest_by_bias/2017/2017_arrest_motivation.csv", row.names = FALSE)


