#Jenny Smith 

#June 28, 2018 

#Purpose: Run DeMixT to estimate tumor purities. 




library(DESeq2, lib.loc = "/home/jlsmith3/R/x86_64-pc-linux-gnu-library/3.4" )
library(DeMixT)


setwd("/fh/fast/meshinchi_s/workingDir/TARGET/AML_TARGET/RNA/mRNAseq/analysis/2018.05.31_1031_BatchEffects")


#Read in the median ratio normalized counts. 
norm.cts <-  read.csv("TARGET_AML_1031_DESeq2_MedianNormalized_Counts.csv", row.names = 1)
# head(norm.cts[,1:5])
dim(norm.cts)


## Using all Genes 

# data.norm.cts <- list("y"=as.matrix(norm.cts[,grep("^P", colnames(norm.cts))]), 
#                   "comp1"=as.matrix(norm.cts[,grep("^BM|RO", colnames(norm.cts))]))
# 
# str(data.norm.cts)
# rm(norm.cts)
# 
# 
# #Run DeMixT
# res.norm.cts <- DeMixT(data.Y = data.norm.cts$y, 
#                    data.comp1 = data.norm.cts$comp1,
#                    if.filter = FALSE) 
# 
# 
# save(res.norm.cts, file = "TARGET_AML_1031_DESeq2_Normalized_Counts_DeMixT.RData")


## Using most DE genes 

data.norm.cts <- list("y"=as.matrix(norm.cts[,grep("^P", colnames(norm.cts))]), 
                      "comp1"=as.matrix(norm.cts[,grep("^BM|RO", colnames(norm.cts))]))

str(data.norm.cts)
rm(norm.cts)


#Run DeMixT
res.norm.filt <- DeMixT(data.Y = data.norm.cts$y, 
                       data.comp1 = data.norm.cts$comp1,
                       if.filter = TRUE) 


save(res.norm.filt, file = "TARGET_AML_1031_DESeq2_Normalized_Counts_Filter_DeMixT.RData")






