num_drug_a = 38;
num_drug_b = 38;
num_cell_line = 39;
P = tenones([num_drug_a num_drug_b num_cell_line]);
R = 1000;%cpwopt?component?
read_data
num_predict = 240 * num_cell_line;

P = tenones([num_drug_a num_drug_b num_cell_line]);
miss = [0, 5, 6, 8, 10, 12, 14, 17, 18, 19, 26, 27, 29, 33, 34, 35] +1;

for k = 1:16
    for j = i+1:16
        P(miss(k),miss(j),:) = 0;
        P(miss(j),miss(k),:) = 0;
    end
end

folder_name = '/Users/apple/Desktop/tensor_pro/final_results/';
[M,~,output] = cp_wopt(exp_tensor,P,R);

to_write_name = strcat(folder_name,'durg_a.csv');
csvwrite(char(to_write_name),M.u{1} );

to_write_name = strcat(folder_name,'durg_b.csv');
csvwrite(char(to_write_name),M.u{2} );

to_write_name = strcat(folder_name,'cell_line.csv');
csvwrite(char(to_write_name),M.u{3} );
   
   
   
   
   
   
   
   
  