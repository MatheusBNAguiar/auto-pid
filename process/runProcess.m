function [timeArray, referenceArray, errorArray, intermediateArray, outputArray] = runProcess(sampleTime, timeSimulation, discreteNum, discreteDen, reference, intermediatorParams)
    timeArray = 0:sampleTime:timeSimulation;
    referenceArray = []; 
    errorArray = []; 
    intermediateArray = []; % Values that comes out from PID or Relay
    outputArray = []; % Output from the process

    for index = 1:length(timeArray)
        previousOutput = getValueOnArray(outputArray, index - 1);
        errorValue = reference - previousOutput;
        referenceArray = [referenceArray, reference];
        errorArray = [errorArray, errorValue];

        intermediatorOutput = intermediatorProcess(intermediatorParams, errorArray, intermediateArray);
        intermediateArray = [intermediateArray, intermediatorOutput];

        output = processDiscreteFunction( discreteNum, discreteDen, intermediateArray, outputArray );
        outputArray = [outputArray, output];
    end
end