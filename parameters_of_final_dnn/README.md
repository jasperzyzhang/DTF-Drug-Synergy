### Description:
The structure of DNN is also saved in the final_model.h5
Thus, to load the model

run the following codes:
```
from keras.models import load_model
curr_model = load_model(folder_name + 'final_model.h5')
```
note to modify the folder_name on your own PC.
Note that the structure of DNN is also saved in the final_model.h5

And use the miss_feature calculated in the final_model.ipynb, 
you can replicate the result of prediction for missing pairs,
namely, the miss_pre.txt can be replicated.