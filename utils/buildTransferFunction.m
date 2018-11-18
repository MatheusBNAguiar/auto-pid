function [discreteNum, discreteDen] = buildTransferFunction(sampleTime)
    numerator = input ('Add transfer function numerator, only the indexes \n','s');
    denominator = input ('Add transfer function denominator, only the indexes \n','s');

    numerator = str2num(numerator);
    denominator = str2num(denominator);
    
    transfer = tf(numerator, denominator);
    transferDiscrete = c2d(transfer, sampleTime);

    [discreteNum, discreteDen] = tfdata(transferDiscrete); 
    discreteNum = discreteNum{1};
    discreteDen = discreteDen{1};
end