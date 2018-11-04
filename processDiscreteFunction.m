function outputFunction = processDiscreteFunction( numerator, denominator, inputArray, outputArray )
    discreteOutputValue = 0;
    discreteInputValue = 0;
    
    outputFirstIndex = denominator(1);
    
    outputLength = length(denominator);
    outputArrayLength = length(outputArray);
    if outputLength > 1
        for outputIndex = 2 : outputLength;
            discreteOutputValue += getValueOnArray(outputArray, outputArrayLength + 1 - outputIndex);
        end
    end

    inputLength = length(numerator);
    inputArrayLength = length(inputArray);
    for inputIndex = 2 : inputLength;
        discreteInputValue += getValueOnArray(outputArray, inputArrayLength + 1 - inputIndex);
    end

    outputFunction = (discreteInputValue - discreteOutputValue) / outputFirstIndex;
end

