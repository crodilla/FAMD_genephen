# FAMD_genephen

## INTRODUCTION

FAMD (Factor Analysis of Mixed Data) has been used to delve into a dataset of patients with genetic ophtalmological diseases for whom several clinical variables had been collected. The FAMD algorithm has allowed us to explore how the different variables are related, identifying underlying patterns in the data. The application of this algorithm has resulted in the identification of different clusters of patients allowing the classification of undiagnosed patients into a specific phenotype.

## Algorithm

FAMD  is a multivariate statistical algorithm used for analyzing datasets with both continuous and categorical variables. FAMD is an extension of Factor Analysis (FA), which is a technique used to explain the correlation between observed variables in terms of a smaller number of unobserved latent variables, or factors.

The FAMD algorithm produces output similar to that of a traditional PCA or FA analysis, including factor loadings and eigenvalues. However, FAMD provides additional information on the relationship between categorical variables and the extracted factors, which can help to identify underlying patterns in the data and to better understand the relationships between variables.

Overall, FAMD is a useful algorithm for analyzing datasets with mixed data types, and it can be used in a variety of fields, including social sciences, marketing research, and data science.


# Developer

Cristina Rodilla Hernández

## Contact

crodilla.ext@quironsalud.es

# Installation and execution

## Installation

R version: 4.0.1

Required R libraries:

- ggplot2
- dplyr
- missMDA
- FactoMineR
- factoextra


# Usage

## Input 

FAMD_genephen takes a table where the columns are genomic and clinical variables of mixed types and the rows represent the patients. 


| Comb_variants | Allele1 | Allele2 | Onset   | BVA_Age_ratio | Refraction    | VFL | Night_blindness | Nystagmus | Photophobia | Color_alterations | ERG            | Central | Periphery | Diagnosis |
|---------------|---------|---------|---------|---------------|---------------|-----|-----------------|-----------|-------------|-------------------|----------------|---------|-----------|-----------|
| WT_WT         | 0       | 0       | NA      | 0             | NA            | 0   | 0               | 0         | 0           | 0                 | Normal         | 0       | 0         | Healthy   |
| M_WT          | 2       | 0       | birth   | 0.01          | Myopia        | 1   | 0               | 1         | 0           | 1                 | Cone_alter     | 1       | 0         | X         |
| M_M           | 3       | 1       | infancy | 0.005         | Hypermetropia | 0   | 1               | 0         | 0           | 1                 | Cone_rod_alter | 2       | 1         | Y         |
| T_M           | 4       | 2       | youth   | 0.008         | Myopia        | 1   | 0               | 0         | 1           | 0                 | Rod_alter      | 0       | 1         | Z         |
| T_T           | 5       | 3       | adult   | 0.02          | Hypermetropia | 0   | 0               | 1         | 0           | 1                 | Extinguished   | 1       | 2         | X         |



## Output

The output of this program is a plot showing distribution of individuals algo the components.

[![FAMD_individuals](../FAMD_img.jpg)]

## Execution

Run the script using the input (table in csv format) and the output (desired name followed by .png extension) as positional arguments of the script.

Rscript FAMD_genephen.R input output

