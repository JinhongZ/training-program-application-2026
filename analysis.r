# ---------------------------------------------------------

# Melbourne Bioinformatics Training Program

# This exercise to assess your familiarity with R and git. Please follow
# the instructions on the README page and link to your repo in your application.
# If you do not link to your repo, your application will be automatically denied.

# Leave all code you used in this R script with comments as appropriate.
# Let us know if you have any questions!


# You can use the resources available on our training website for help:
# Intro to R: https://mbite.org/intro-to-r
# Version Control with Git: https://mbite.org/intro-to-git/

# ----------------------------------------------------------

# Load libraries -------------------
# You may use base R or tidyverse for this exercise

# ex. library(tidyverse)

# Load data here ----------------------
# Load each file with a meaningful variable name.
setwd("~/Desktop/BioInformatics/training-program-application-2026/data/")
metadata <- read.csv("GSE60450_filtered_metadata.csv")
count_matrix <- read.csv("GSE60450_GeneLevel_Normalized(CPM.and.TMM)_data.csv")

# Inspect the data -------------------------

# What are the dimensions of each data set? (How many rows/columns in each?)
# Keep the code here for each file.

## Expression data


## Metadata


# Prepare/combine the data for plotting ------------------------
# How can you combine this data into one data.frame?



# Plot the data --------------------------
## Plot the expression by cell type
## Can use boxplot() or geom_boxplot() in ggplot2



## Save the plot
### Show code for saving the plot with ggsave() or a similar function
