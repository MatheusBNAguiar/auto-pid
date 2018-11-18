function output = runProcess(sampleTime, timeSimulation, reference, intermediatorParams)
    timeArray = 0:sampleTime:timeSimulation;

    referenceArray = []; 
    errorArray = []; 
    intermediateArray = []; % Values that comes out from PID or Relay
    outputArray = []; % Output from the process

    for index = timeArray
        previousOutput = getValueOnArray(outputArray, inputArraySize - 1);
        errorValue = reference - previousOutput;
        
        referenceArray = [inputArray, reference];
        errorArray = [errorArray, errorValue];


        output = processDiscreteFunction( discreteNum, discreteDen, intermediateArray, outputArray );
        outputArray = [outputArray, output];
    end
end