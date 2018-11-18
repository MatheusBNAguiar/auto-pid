timeSimulation = 10;
sampleTime = 0.001;

[discreteNum, discreteDen] = buildTransferFunction(sampleTime);

for simulation = 1:simulationTries
    [outputs,inputs] = runProcess(Kc,Ti,Td)
    analyzeProcess()
    
end