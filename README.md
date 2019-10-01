# DTF: Deep Tensor Factorization for Predicting Anticancer Drug Synergy

These are the codes and data mainly used for the project using deep tensor factorization for 
Predicting Anticander Drug Synergy.

The only data set I used here is drug synergy data of 38 drugs and 39 cell lines, which is derived
from the study of ONeil *et al.*

To implement the DTF model, first I used **R** to preprocess the raw data to build the tensor to be used next for
**Python** and **MATLAB**. The MATLAB codes are mainly used for implement the CP-WOPT to decompose tensor with missing
entries. The python codes are mainly used for building deep neural network and other machine learning models, which take 
the output of CP-WOPT as output. And to evaluate DTF, I repeated stratify sampling method 100 times. The index of missing pairs
for testing are also listed in the repository.

Brief decriptions are given in each directory. The output of some process are also listed. Note that the parameters of 
deep neural network are given here.