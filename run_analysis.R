my_train_set <- read.csv("train\\X_train.txt", sep= "", header = FALSE)
my_train_act <- read.csv("train\\y_train.txt", sep= "", header = FALSE, col.names = "V562")
my_train_ref <- read.csv("train\\subject_train.txt", sep= "", header = FALSE, col.names = "V563")

my_train_set <- cbind(my_train_set, my_train_act, my_train_ref)

my_test_set <- read.csv("test\\X_test.txt", sep= "", header = FALSE)
my_test_act <- read.csv("test\\y_test.txt", sep= "", header = FALSE, col.names = "V562")
my_test_ref <- read.csv("test\\subject_test.txt", sep= "", header = FALSE, col.names = "V563")

my_test_set <- cbind(my_test_set, my_test_act, my_test_ref)

my_data_set <- rbind(my_train_set, my_test_set)

library(dplyr)

my_features <- read.csv("features.txt", sep = "", header = FALSE)

my_features <- rbind(my_features, cbind('562', 'Activity'), cbind('563', 'Subject'))

my_columns <- filter(my_features, grepl('mean()', my_features$V2, fixed = TRUE) | grepl('std()', my_features$V2, fixed = TRUE) | grepl('Activity', my_features$V2, fixed = TRUE) | grepl('Subject', my_features$V2, fixed = TRUE))

my_data_set <- my_data_set %>% mutate(V562 = recode(V562, '1' = 'WALKING', '2' = 'WALKING_UPSTAIRS', '3' = 'WALKING_DOWNSTAIR', '4' = 'SITTING', '5' = 'STANDING', '6' = 'LAYING'))

names(my_data_set) <- my_features$V2

my_subset <- my_data_set[c(as.integer(my_columns$V1))]

my_agg <- aggregate(my_subset[,1:66], by=list(my_subset$Activity, my_subset$Subject), FUN = mean)

write.csv(my_subset, file="subset.csv")

write.csv(my_agg, file ="aggregate.csv")

write.table(my_agg, file = "aggregate.txt", row.names = FALSE)
