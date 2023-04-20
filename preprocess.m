mat_path = 'data_mat/random/3';
files_name = {dir(fullfile(mat_path,'*.mat')).name}';

csv_path = 'data_csv/random/3';

for index = 1:length(files_name)
    name = files_name{index,1};
    name_split = strsplit(name,{'_', '.'});

    disp(fullfile(mat_path, name))
    disp(strcat('rflysim_', name_split{1}, '_', 'baseline', '_', name_split{2}, '.csv'))
    
    csv_name = strcat('rflysim_', name_split{1}, '_', 'baseline', '_', name_split{2}, '.csv');
    mat2csv(fullfile(mat_path, name), fullfile(csv_path, csv_name))
end
