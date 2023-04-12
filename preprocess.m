mat_path = 'mat_data';
files_name = {dir(fullfile(mat_path,'*.mat')).name}';

for index = 1:length(files_name)
    name = files_name{index,1};
    name_split = strsplit(name,{'_', '.'});

    disp(fullfile(mat_path, name))
    disp(strcat('rflysim_', name_split{1}, '_', 'baseline', '_', name_split{2}, '.csv'))
    mat2csv(fullfile(mat_path, name), strcat('rflysim_', name_split{1}, '_', 'baseline', '_', name_split{2}, '.csv'))
end
