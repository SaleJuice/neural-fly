function pred = PhiNet(params_path, data)
% https://zhuanlan.zhihu.com/p/536858806
    mlmodel = py.importlib.import_module('mlmodel');
    py.importlib.reload(mlmodel);
    predict = py.importlib.import_module('predict');
    py.importlib.reload(predict);
    pred = predict.prediction(pyargs('params_path', params_path, 'data', data));
    pred = double(pred);
end