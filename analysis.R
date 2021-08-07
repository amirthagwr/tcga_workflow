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

#mybarplot function from source box_plot_tcga.R
boxplot_tcga(metadata = select_data, 
          metadata_col = age_at_initial_pathologic_diagnosis,
          condition = tumor_status,
          mytitle = "Age at Pathological Diagnosis",
          ylab = "Age" ,
          xlab = "Tumor Status")

time_plot(metadata = select_data, 
          time_col = DSS.time, 
          condition = vital_status,
          mytitle = "DSS time")

tcga.test(metadata = select_data, 
          metadata_col = "DSS.time", 
          condition = "tumor_status")

