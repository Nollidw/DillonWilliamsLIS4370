# Set the working directory
setwd("D:/Files/One Drive/OneDrive/Documents/School/R Data")

# Assign imported data to "df"
df <- read.csv("CartelStability.csv")

# Display the first few rows of df
head(df)

# First column removed
df <- df[,-1]

# Activate the stringr package
library(stringr)

# Each word is converted to upper case for the first letter, and to lower case for the rest of the letters using str_to_title from stringr
# Column names in uppercase and lowercase
colnames(df) <- str_to_title(colnames(df))
colnames(df)
library(stringi)

# Changes all matching characters to new ones
df$Cartel <- stri_replace_all_regex(df$Cartel, c("yes", "no"), c("Yes", "No"), vectorize = F)
df$Ice <- stri_replace_all_regex(df$Ice, c("yes", "no"), c("Yes", "No"), vectorize = F)

# Reclassify the specified variable as a factor variable to a limited number of values
df$Price <- factor(df$Price)
df$Cartel <- factor(df$Cartel)
df$Season <- factor(df$Season)
df$Ice <- factor(df$Ice)

# last few rows displayed
tail(df)

# Use base R to create a graph
boxplot(Quantity ~ Price, df, main = "Cartels determine quantity based on prices", las = 2, names = c(.125, .15, .2, .25, .3, .35, .4), col = rainbow(7))
# At first glance, I think this graph is very clean and perfect, and I like that. I noticed that the last three medians are pretty close to the average, but .3 is the closest.

library(ggplot2)
ggplot(df, aes(Quantity, Price)) + geom_boxplot(fill = rainbow(7)) + labs(title = "Cartels determine quantity based on prices") + theme(plot.title = element_text(hjust = 0.5)) + coord_flip()
# My opinion regarding cleanness and perfection remains the same, but I like it more than the last graph because of grid lines and colored boxplots on a contrasted background. I retract what I said about which factor of Prices is closest to the average; it is certainly .35. As someone who uses ggplot2 a lot, this graph is my favorite.

library(lattice)
bwplot(Quantity ~ Price, df, main = "Cartels determine quantity based on prices", xlab = "Price")
# Cleanness and perfection look good in this graph, but I don't like it the most because I think there are insufficient resources to help me add these features, such as color. In addition, I'm using this package for the first time, and I'm very certain that I will not use this package except that it is required.