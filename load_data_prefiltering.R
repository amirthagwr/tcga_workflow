# Script to perform TCGA tumor status comparisons.
#
# Author: Amirtha Ambalavanan
# Last modified: 2021-08-07

# install required packages


#Import Data provided on the TCGA-CDR supplementary file, sheet TCGA-CDR 
tcga_data <- read.csv(file = "TCGA-CDR.csv", 
                      row.names=1,
                      stringsAsFactors=FALSE,
                      header = TRUE,
                      na.strings = c("[Discrepancy]", "[Not Applicable]", "[Not Available]", "NA", "#N/A", "[Unknown]", "[Not Evaluated]"))



#Filtering data with tumor status
tcga_data_F <- tcga_data[which(tcga_data$tumor_status=='TUMOR FREE'
                               | tcga_data$tumor_status == 'WITH TUMOR'), ]


#converting selected medtadata columns
col2Factor <- c("gender",
                "tumor_status",
                "vital_status",
                "race" ,
                "clinical_stage",
                "histological_grade")

#converting categorical values to factors
tcga_data_F[col2Factor] <- lapply(tcga_data_F[col2Factor], factor)


# Remove samples with unknown metadata entry
tcga_data_F_QC <- droplevels(tcga_data_F[!(is.na(tcga_data_F$type)|
                                             is.na(tcga_data_F$tumor_status)|
                                             is.na(tcga_data_F$gender)|
                                             is.na(tcga_data_F$race)|
                                             is.na(tcga_data_F$clinical_stage)|
                                             is.na(tcga_data_F$histological_grade)|
                                             is.na(tcga_data_F$age_at_initial_pathologic_diagnosis)|
                                             is.na(tcga_data_F$OS.time) |
                                             is.na(tcga_data_F$DSS.time) |
                                             is.na(tcga_data_F$DFI.time) |
                                             is.na(tcga_data_F$PFI.time)),])


colnames(tcga_data_F_QC)
str(tcga_data_F_QC)

