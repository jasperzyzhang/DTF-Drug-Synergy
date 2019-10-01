
## Data preprocess


### Input: 

the raw data of drug synergy


### Output: 

The drug and cell line names corresponding to the number


### Description:

tensor_generate.R is used to preprocess raw data.The input is the 
only data set I used, the drug synergy data. What this code mainly
does is to build the tensor we need for later use. The slices of the 
tensor were generated with respect to the dimension of cell line. Each 
csv file can be interperated as a matrix for each cell line. Since there 
are some experiments carried out for same pairs, in oder to build the tensor, 
I average the synergy score. Note that, if you want to run this code, remember 
to modify the first line, the path of the drug_drug_synergy_original data may 
be different in different situations. And to generate tensor with NA, just
comment the 144th line. The tensor without NA was mainly used for matlab. And the 
tensor with NA was for python. Actually python is able to process the tensor without 
NA, but I just used the one with NA. I save the drug and cell line names, which is used 
to map index to real names.