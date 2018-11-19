function [discreteNum, discreteDen] = declareController(Kc, Ti, Td, sampleTime)
    s = tf('s');
    transfer = Kc*(1+1/(Ti*s)+Td*s)*(1/(s+1000));
    [discreteNum, discreteDen] = discretizeFunction(transfer, sampleTime);
end