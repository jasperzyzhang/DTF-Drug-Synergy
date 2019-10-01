num_drug_a = 38;
num_drug_b = 38;
num_cell_line = 39;
P = tenones([num_drug_a num_drug_b num_cell_line]);
R = 1000;%cpwopt?component?
read_data
num_predict = 240 * num_cell_line;

for i = 1:100
   folder_name = strcat('/Users/apple/Desktop/tensor_pro/data/exp',...
       string(i),'/');
   P = tenones([num_drug_a num_drug_b num_cell_line]);
   miss = [0, 5, 6, 8, 10, 12, 14, 17, 18, 19, 26, 27, 29, 33, 34, 35] +1;

   for k = 1:16
        for j = i+1:16
            P(miss(k),miss(j),:) = 0;
            P(miss(j),miss(k),:) = 0;
        end
   end
   
x_index = [];
y_index = [];
z_index = [];
for j = 1:39
    tmp_data_name = strcat(folder_name,'/test_pair',string(j),'.csv');
    tmp_data = csvread(tmp_data_name,1,1);
    len = length(tmp_data);
    for k  = 1:len
        %matlab starts from 1, python from 0 note 
        x = mod(tmp_data(k),num_drug_a) + 1;
        y = floor(tmp_data(k)/num_drug_a) + 1;
        x_index(k+len*(j-1)) = x;
        y_index(k+len*(j-1)) = y;
        z_index(k+len*(j-1)) = j;
        P(x,y,j) = 0;
        P(y,x,j) = 0;
    end
end
    
[M,~,output] = cp_wopt(exp_tensor,P,R);

to_write_name = strcat(folder_name,'durg_a.csv');
csvwrite(char(to_write_name),M.u{1} );

to_write_name = strcat(folder_name,'durg_b.csv');
csvwrite(char(to_write_name),M.u{2} );

to_write_name = strcat(folder_name,'cell_line.csv');
csvwrite(char(to_write_name),M.u{3} );

pre = full(M);

test_result = [];
true = [];
num_test_half = length(x_index);
for i = 1:num_test_half
    test_result(i) = pre(x_index(i),y_index(i),z_index(i));
    test_result(i+num_test_half) = pre(y_index(i),x_index(i),z_index(i));
    true(i) = exp_tensor(x_index(i),y_index(i),z_index(i));
    true(i+num_test_half) = exp_tensor(y_index(i),x_index(i),z_index(i));
end

to_write_name = strcat(folder_name,'cpwopt_true.csv');
csvwrite(char(to_write_name),true);

to_write_name = strcat(folder_name,'cpwopt_pre.csv');
csvwrite(char(to_write_name),test_result); 
    
%missing ????
miss_pre = [0];
    for p  = 1:39
        for r = 1:16
            for s = r+1:16
                miss_pre(end+1) = pre(r,s,p);
                miss_pre(end+1) = pre(s,r,p);
            end
        end
    end
    
miss_pre(1) = [];
to_write_name = strcat(folder_name,'cpwopt_pre_missing.csv');
csvwrite(char(to_write_name),miss_pre); 
end

