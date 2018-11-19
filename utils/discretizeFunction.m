function [discreteNum, discreteDen] = discretizeFunction(transfer, sampleTime)
    transferDiscrete = c2d(transfer, sampleTime);

    [discreteNum, discreteDen] = tfdata(transferDiscrete); 
    discreteNum = discreteNum{1};
    discreteDen = discreteDen{1};
end