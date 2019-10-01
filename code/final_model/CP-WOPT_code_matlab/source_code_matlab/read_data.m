exp_tensor = tenzeros([38 38 39]);
for i = 1:39
    file_to_read = strcat('/Users/apple/Desktop/mi_code/R/del_nan_tensor_',...
        string(i),'.csv');
    exp_tensor(:,:,i) = csvread(file_to_read,1,1);
end
