'''
FilePath: \neural-fly\predict.py
Date: 2023-04-08 11:39:29
LastEditTime: 2023-04-08 13:28:11
LastEditors: Xiaozhu Lin
E-Mail: linxzh@shanghaitech.edu.cn
Institution: MAgIC Lab, ShanghaiTech University, China
'''

import numpy as np
import matplotlib.pyplot as plt

import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
torch.set_default_tensor_type('torch.DoubleTensor')
from torch.utils.data import Dataset, DataLoader
from torch.utils.data.dataset import random_split

import utils
import mlmodel


def prediction(params_path, data):
    params = torch.load(params_path)

    model = mlmodel.Phi_Net(params['options'])
    model.load_state_dict(params['phi_net_state_dict'])
    model.eval()

    data = np.asarray(data)
    data = np.ascontiguousarray(data.T)
    data = torch.from_numpy(data)
    data = data.type(torch.DoubleTensor)

    with torch.no_grad():
        pred = model(data)
    
    pred = pred.detach().numpy().squeeze()
    pred = np.ascontiguousarray(pred.T)

    return pred


if __name__ == '__main__':
    p = prediction('models/neural-fly_dim-a-3_v-q-pwm-epoch-950.pth', np.array([0,0,0, 0,0,0,0, 0,0,0,0]))
    print(p)
