params_path = 'models/rflysim_dim-a-3_v-q-pwm-epoch-950.pth';
data = [0 0 0  0 0 0 0  0 0 0 0];
phi = PhiNet(params_path,data);
disp(phi)