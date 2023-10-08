# Downloading and importing the dataset from kaggle.
# https://www.kaggle.com/datasets/thedevastator/oscar-winning-directors-analysis?resource=download
read <- ("Oscar Winners - Director.csv")
oscarsData <- read.csv(read, stringsAsFactors = FALSE)

# Determine if generic functions can be used on the data .
summary(oscarsData)
head(oscarsData)
class(oscarsData)

# Explore if your dataset is S3 or S4.
isS4(oscarsData)

# How do you tell what OO system (S3 vs. S4) an object is associated with?
# You can use the isS4() function to find out whether or not it's
# a S4 system. If it's FALSE, then that means it is a S3 sysyem. 

# How do you determine the base type (like integer or list) of an object?
# You can use the class() function and it will tell you if it's a data frame,
# list, matrix, etc. 

#What is a generic function? 
# A generic function is one that is used to find the class 
# of the function's arguments and get the right method.

# What are the main differences between S3 and S4?
# S3 is informal, but interactive in it's capabilities. Meanwhile, S4
# is much more formal, but can can be less interactive. The S4 system 
# newer and more structured, while S3 is older and simpler. 

# Example of S3 dataset 
s3 <- list(physician = "Dr. Ford", patient = "John Smith", age = 32, 
           weight.kg = 81.6, height.cm = 182.88)
s3 # view the results

# Example of S4 dataset
# creating the class
setClass("Patient", representation(physician = "character", 
                                   name = "character", age = "numeric", 
                                   weight.kg = "numeric", height.cm = "numeric"))

# creating the object
s4 <- new("Patient", physician = "Dr. Stress", 
          name = "Sally Smith", age = 67, 
          weight.kg = 64.3, height.cm = 155.8)
s4 # view the results