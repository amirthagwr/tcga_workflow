# Script to perform TCGA tumor status comparisons.
#
# Author: Amirtha Ambalavanan
# Last modified: 2021-08-07

# install required packages

library(dplyr)
library(ggplot2)
library(data.table)

#Comparison of age at diagnosis for two types of Cancer

cancer_types <- c("OV", "UCEC")
select_data <- tcga_data_F_QC[which(tcga_data_F_QC$type %in% cancer_types ),]

#boxplot function from source box_plot_tcga.R
g<- boxplot_tcga(metadata = select_data, 
          metadata_col = age_at_initial_pathologic_diagnosis,
          condition = tumor_status,
          mytitle = "Age at Pathological Diagnosis",
          ylab = "Age" ,
          xlab = "Tumor Status")

ggsave(plot = g, 
       filename = "age_tumor_status.pdf",
       width = 5,
       height = 5,
       units = "in",
       dpi = "retina")



#timeplot is to show a disease specific survival event
p<-time_plot(metadata = select_data, 
          time_col = DSS.time, 
          condition = vital_status,
          mytitle = "DSS time")

q <- time_plot(metadata = select_data,
               time_col = DFI.time,
               condition=histological_grade,
               mytitle = "DFI. time"
               )

print(q)

ggsave(plot = q, 
       filename = "DFI.time_grade.pdf",
       width = 5,
       height = 5,
       units = "in",
       dpi = "retina")


ggsave(plot = p, 
       filename = "DSS.time_vital.pdf",
       width = 5,
       height = 5,
       units = "in",
       dpi = "retina")


#testing the two conditions using a non parametric test wilcox rank sum test

tcga.test(metadata = select_data, 
          metadata_col = "DSS.time", 
          condition = "tumor_status")

