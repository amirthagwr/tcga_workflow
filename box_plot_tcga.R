

Authors@R: person("Amirtha", email = "amirtha.bioinfo@gmail.com",
                  role = "aut")
numeric_version("1.0.0") 

#Load packages

library(dplyr)
library(ggplot2)


#'Boxplot of condition

#' \code{boxplot_tcga} returns the boxplot of chosen metadata column
#' @param metadata dataframe with all variables
#' @param metadata_col column name without missing values
#' @param condition categorical values as factors 


boxplot_tcga <- function(metadata, metadata_col, condition, mytitle, xlab, ylab){
  stopifnot(is.data.frame(metadata))
  ggplot2::ggplot(data=metadata, aes(x= {{condition}}, y= {{metadata_col}}, fill={{condition}}) ) +
    geom_boxplot( show.legend =F) +
    scale_fill_manual(values=c("#E69F00", "#56B4E9")) +
    ggtitle(mytitle) +
    labs(x=xlab, y=ylab)
}


#'Timeplot of condition

#' \code{time_plot} returns the boxplot of chosen metadata column
#' @param metadata dataframe with all variables
#' @param time_col column name of survival time without missing values
#' @param condition categorical values as factors 



time_plot <- function(metadata, time_col, condition, mytitle){
    stopifnot(is.data.frame(metadata))
  ggplot2::ggplot(data=metadata, aes(x= {{condition}}, y= {{time_col}}, fill={{condition}}) ) +
    geom_boxplot( show.legend =F) +
    scale_fill_brewer(palette="Dark2") +
    ggtitle(mytitle) 
}



#' Statistical tests 

#' \code{tcga_test} returns the boxplot of chosen metadata column
#' @param metadata data frame with all variables
#' @param metadata_col column name of survival time without missing values
#' @param condition categorical values as factors 

tcga_test <- function(metadata = select_data, 
                      metadata_col = "DSS.time",
                      condition = "tumor_status"){
  stopifnot(is.data.frame(metadata))
  #non parametric tests for metadata with selected groups
  nonpara <- wilcox.test(metadata[,metadata_col] ~ metadata[,condition])
  p.val <- nonpara$p.value
  return(p.val)
}


