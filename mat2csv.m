function mat2csv(mat_path,csv_path)
%% load the raw data from .mat file
data_ori = importdata(mat_path);

v = get(data_ori,"Vel_e").Values;
q = get(data_ori,"quaternion").Values;
pwm = get(data_ori,"PWM").Values;
fa = get(data_ori,"Fa").Values; fa.Data = squeeze(fa.Data);  % there are some dim bug with 'Fdz' data


%% resample the data in 50Hz(0.02s/frame)
freq = 50;  % Hz
v_re = resample(v,v.TimeInfo.Start:1/freq:v.TimeInfo.End);
q_re = resample(q,q.TimeInfo.Start:1/freq:q.TimeInfo.End);
pwm_re = resample(pwm,pwm.TimeInfo.Start:1/freq:pwm.TimeInfo.End);
fa_re = resample(fa,fa.TimeInfo.Start:1/freq:fa.TimeInfo.End);


%% save the pre-process data as .csv data
v_tab = timeseries2timetable(v_re); v_tab = renamevars(v_tab,"Data",'v');
q_tab = timeseries2timetable(q_re);  q_tab = renamevars(q_tab,"Data",'q');
pwm_tab = timeseries2timetable(pwm_re);  pwm_tab = renamevars(pwm_tab,"Data",'pwm');
fa_tab = timeseries2timetable(fa_re);  fa_tab = renamevars(fa_tab,"Data",'fa');

all_tab = [v_tab q_tab pwm_tab fa_tab];

m = v_tab.v; clear out;
for iter = 1:length(m)
    s = string(mat2str(m(iter,:), 3));
    s = strrep(s,' ',', ');
    out(iter,:) = s;
end
v_str = ["v";out];

m = q_tab.q; clear out;
for iter = 1:length(m)
    s = string(mat2str(m(iter,:), 3));
    s = strrep(s,' ',', ');
    out(iter,:) = s;
end
q_str = ["q";out];

m = pwm_tab.pwm; clear out;
for iter = 1:length(m)
    s = string(mat2str(m(iter,:), 3));
    s = strrep(s,' ',', ');
    out(iter,:) = s;
end
pwm_str = ["pwm";out];

m = fa_tab.fa; clear out;
for iter = 1:length(m)
    s = string(mat2str(m(iter,:), 3));
    s = strrep(s,' ',', ');
    out(iter,:) = s;
end
fa_str = ["fa";out];

m = double(seconds(v_tab.Time)); clear out;
for iter = 1:length(m)
    s = string(mat2str(m(iter,:), 3));
    s = strrep(s,' ',', ');
    out(iter,:) = s;
end
t_str = ["t";out];

m = [0:1:length(t_str)-2].'; clear out;
for iter = 1:length(m)
    s = string(mat2str(m(iter,:), 3));
    s = strrep(s,' ',', ');
    out(iter,:) = s;
end
n_str = ["n";out];


all_str = cat(2,n_str,t_str,v_str,q_str,pwm_str,fa_str);



writematrix(all_str, csv_path)

end

