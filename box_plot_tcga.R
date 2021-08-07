library(dplyr)
library(ggplot2)


boxplot_tcga <- function(metadata, metadata_col, condition, mytitle, xlab, ylab){
  ggplot2::ggplot(data=metadata, aes(x= {{condition}}, y= {{metadata_col}}, fill={{condition}}) ) +
    geom_boxplot( show.legend =F) +
    scale_fill_manual(values=c("#E69F00", "#56B4E9")) +
    ggtitle(mytitle) +
    labs(x=xlab, y=ylab)
}

time_plot <- function(metadata, time_col, condition, mytitle){
  ggplot2::ggplot(data=metadata, aes(x= {{condition}}, y= {{time_col}}, fill={{condition}}) ) +
    geom_boxplot( show.legend =F) +
    scale_fill_manual(values=c("orange", "red")) +
    ggtitle(mytitle) 
}

tcga_test <- function(metadata = select_data, 
                      metadata_col = "DSS.time",
                      condition = "tumor_status"){
  #non parametric tests for metadata with selected groups
  nonpara <- wilcox.test(metadata[,metadata_col] ~ metadata[,condition])
  p.val <- nonpara$p.value
  return(p.val)
}


