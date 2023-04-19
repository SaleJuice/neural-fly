%  fid = importdata('data_ori/training/custom_random3_baseline_nowind.csv');
%  total_row = size(fid.data, 1);
%  data = fid.data;

function show_traj(n,p,c)
x = [];
y = [];
z = [];
for i = 1:size(p)
    x = [x;p{i}(1)];
    y = [y;p{i}(2)];
    z = [z;p{i}(3)];
end

figure(n)
plot3(x,y,z,c), hold on