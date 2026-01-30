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
library(ggplot2)
library(dplyr)
library(tidyr)

# Load data here ----------------------
# Load each file with a meaningful variable name.
setwd("~/Desktop/BioInformatics/training-program-application-2026/data/")
# set the first column as row names
metadata <- read.csv("GSE60450_filtered_metadata.csv", row.names = 1)
expression_data <- read.csv("GSE60450_GeneLevel_Normalized(CPM.and.TMM)_data.csv", row.names = 1)

# Inspect the data -------------------------

# What are the dimensions of each data set? (How many rows/columns in each?)
# Keep the code here for each file.

## Expression data
dim(expression_data) # 23735 rows and 13 columns

## Metadata
dim(metadata) # 12 rows and 3 columns

# Prepare/combine the data for plotting ------------------------
# How can you combine this data into one data.frame?
# convert expression data to a long format
expr_long <- expression_data %>% 
  pivot_longer(
    cols = -gene_symbol,
    names_to = "sample_id",
    values_to = "expression"
  ) %>% 
  mutate(celltype = metadata$immunophenotype[match(sample_id, rownames(metadata))])


# Plot the data --------------------------
## Plot the expression by cell type
## Can use boxplot() or geom_boxplot() in ggplot2
expression_by_celltype <- ggplot(
  expr_long %>% filter(gene_symbol %in% expression_data$gene_symbol[1:10]), 
  aes(x = gene_symbol, y = expression, fill = celltype)
) +
  geom_violin(trim = FALSE, scale = "width", adjust = 1) + 
  geom_boxplot(
    aes(group = interaction(gene_symbol, celltype)), 
    width = 0.25, outlier.shape = NA, fill = "white", color = "black",
    position = position_dodge(0.9)) + 
  scale_y_continuous(n.breaks = 8) + 
  theme_bw() +
  labs(
    x = "Gene",
    y = "Expression level",
    fill = "Cell population"
  ) + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
expression_by_celltype


## Save the plot
### Show code for saving the plot with ggsave() or a similar function
ggsave(
  filename = "~/Desktop/BioInformatics/training-program-application-2026/results/first10_gene_expression_by_celltype_plot.png", 
  plot = expression_by_celltype, 
  width = 8, height = 4
)
