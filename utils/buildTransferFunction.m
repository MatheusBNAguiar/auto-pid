function [discreteNum, discreteDen] = buildTransferFunction(sampleTime, numerator, denominator)
    numerator = str2num(numerator);
    denominator = str2num(denominator);
    
    transfer = tf(numerator, denominator);
    [discreteNum, discreteDen] = discretizeFunction(transfer, sampleTime);
end