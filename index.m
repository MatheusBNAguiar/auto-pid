timeSimulation = 20;
simulationTries = 1;

% numerator = input ('Add transfer function numerator, only the indexes \n','s');
numerator = '50';
% denominator = input ('Add transfer function denominator, only the indexes \n','s');
denominator = '1 11 10';

sampleTime = 0.001;
reference = 0.1;

[discreteNum, discreteDen] = buildTransferFunction(sampleTime, numerator, denominator);

Kc = 0.3923;
Ti = 0.4932;
Td = 0.1233;
% [controllerNum, controllerDen] = declareController(Kc, Ti, Td, sampleTime);

intermediatorParams = {"controller", [Kc, Ti, Td, sampleTime]};
% intermediatorParams = {"controller", controllerNum, controllerDen};
% intermediatorParams = {"relay", 1,  0.7627};

for simulation = 1:simulationTries
    [timeArray, referenceArray, errorArray, intermediateArray, outputArray] = runProcess(sampleTime, timeSimulation, discreteNum, discreteDen, reference, intermediatorParams);
end
plot(timeArray, outputArray);