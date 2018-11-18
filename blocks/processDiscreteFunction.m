function outputFunction = processDiscreteFunction( numerator, denominator, inputArray, outputArray )
    discreteOutputValue = 0;
    discreteInputValue = 0;
    
    outputFirstIndex = denominator(1);
    
    outputLength = length(denominator);
    outputArrayLength = length(outputArray);

    if outputLength > 1
        for outputIndex = 2 : outputLength
            outputWeight = denominator(outputIndex);
            outputIndexValue = getValueOnArray(outputArray, outputArrayLength + 2 - outputIndex);
            discreteOutputValue = discreteOutputValue + outputWeight * outputIndexValue;
        end
    end

    inputLength = length(numerator);
    inputArrayLength = length(inputArray);
    for inputIndex = 2 : inputLength
        inputWeight = numerator(inputIndex);
        inputIndexValue = getValueOnArray(inputArray, inputArrayLength + 1 - inputIndex);
        discreteInputValue = discreteInputValue + inputWeight * inputIndexValue ;
    end
    
    outputFunction = (discreteInputValue - discreteOutputValue) / outputFirstIndex;
end

