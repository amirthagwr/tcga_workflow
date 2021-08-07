# tcga_workflow

R workflow to explore the TCGA metadata for specific condition

To create a box plot of a metadata columns such as age at diagnosis, gender, race, for a specific condition such as
Tumor status and vital status of specific patient groups

## 1. Load your data ##

To load the data and filter the missing values, source the R script 
**load_data_prefiltering.R**

## 2. Create a boxplot 
Selecting the cancer types and in this example, tested for "OV" and "UCEC"
analysis.R


**boxplot_tcga**  is the function to create a boxplot to comapre a specific meta data column for the specific group of patients (OV and UCEC) for 
age at pathological diagnosis and tumor status
 
 ```
 boxplot_tcga(metadata = select_data, 
          metadata_col = age_at_initial_pathologic_diagnosis,
          condition = tumor_status,
          mytitle = "Age at Pathological Diagnosis",
          ylab = "Age" ,
          xlab = "Tumor Status")
```
**time_plot** is another function to create a box plot comparing another clinical data in this example showed the disease specific survival time in days for vital status

```
time_plot(metadata = select_data, 
          time_col = DSS.time, 
          condition = vital_status,
          mytitle = "DSS time")
```

**tcga_test** is a non-parametric test comparing two groups of patients and returns the p-value of significance. 
```
tcga_test(metadata = select_data, 
          metadata_col = "DSS.time", 
          condition = "tumor_status")
					
```
					
					
