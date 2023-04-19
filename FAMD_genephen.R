library(dplyr)
library(missMDA)
library(FactoMineR)
library(factoextra)
library(ggplot2)


#FAMD

# Upload dataframe


args = commandArgs(trailingOnly=TRUE)

df <- read.csv(args[1], sep=';', fill=TRUE, stringsAsFactors = T, quote="")


##################
### FAMD MODEL ###
##################


# 1. Imputation of the missing values.

res.impute <- imputeFAMD(df, ncp=3, sup.var=15)

# base : a data frame with n rows (individuals) and p columns (variables).
# ncp: the number of dimensions kept in the results (by default 5)
# sup.var: a vector indicating the indexes of the supplementary variables.
# ind.sup: a vector indicating the indexes of the supplementary individuals.


# 2. FAMD computation.

res.famd <- FAMD(df, tab.disj=res.impute$tab.disj, sup.var = 15, graph = T)


# 3. FAMD visualization. 


fviz_screeplot(res.famd)

# Variables

fviz_famd_var(res.famd, "quali.var", repel = TRUE, col.var = "black")
fviz_famd_var(res.famd, "quanti.var", repel = TRUE, col.var = "black")
fviz_famd_var(res.famd, repel = T,
             invisible=c("quali.sup"),
             arrows=T,
             col.var = "contrib",
             gradient.cols = c("#fde725", "#21918c", "#440154"),
             shape.var = 15,
             labelsize = 6,
             legend.title = "Contribution",
             ggtheme = theme_classic())+
  theme(text = element_text(size = 15),
        axis.title = element_text(size = 15),
        axis.text = element_text(size = 15)) 
  
options(ggrepel.max.overlaps = Inf)


# Individuals

famd_gucy <- fviz_mfa_ind(res.famd, repel = TRUE,
             habillage = "Diagnosis", # color by groups 
             palette = c("#0F2933","#c0504D","#439EBF", "#385D8A", "black"),
             alpha.var=1,
             addEllipses = T,
             ellipse.level = 0.95,
             ellipse.type = "norm",
             ellipse.alpha = 0.05,
             #shape.var = 15,
             ggtheme = theme_classic(), max.overlaps = Inf,
             invisible="quali", labelsize = 4, pointsize = 2)
plot(famd_gucy)



#======================================================================================================================

# Saving plot

ggsave(filename =args[2],
       plot = famd_gucy,
       width = 2800, height = 2800, units = "px")



