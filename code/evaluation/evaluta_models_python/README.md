### Input:

The input also include the tensors with NA, which are located in 
the folder /data_preprocess/output/
tensor_with_na/

drug_a.csv, drug_b.csv and cell_line.csv factor matrices generated by
CP-WOPT


Test pairs, note that the pairs are coded, and have to be decoded
in order to get the original index. You can have a look on my codes
for details of the coding and decoding.

### Output:

auc,accuracy of four models

acc means accuracy
dnn means deep neural network
log means logistic regression
rf means random forest

test_labels.txt is test labels used for dnn, log and rf, which is saved
for the convenient of programming later in python.

cpwopt_test_label.txt is test labels used for cpwopt
note that the order of test set is different for cpwopt, that's  
why I did this.

*_test_pre.txt is the predicted results on test set for model named * 
*_miss_pre.txt is the predicted results on missing pairs for model named *
note that the predicted results of missing pairs of CP-WOPT are in the output
of CP-WOPT, so they are not here.

*_acc.txt is the accuracy for model named *
*_auc.txt is the auc for model named *