function outputValue = hysteresisRelay( inputArray, limitValue,  hysteresis )
    inputArraySize = length(inputArray);
    previousValue =  getValueOnArray(inputArray, inputArraySize - 1);
    actualValue = inputArray(inputArraySize);
    if actualValue - previousValue > 0 
        signalValue = 1;
    else 
        signalValue = -1;
    end;
    if actualValue > hysteresis*signalValue  
        outputValue = limitValue;
    else
        outputValue = -limitValue;
    end
end

