function [discreteNum, discreteDen] = declareController(Kp, Ti, Td, sampleTime)
    s = tf('s');
    transfer = Kp*(1+1/(Ti*s)+Td*s)*(1/(s+1000));
    [discreteNum, discreteDen] = discretizeFunction(transfer, sampleTime);
end