function outputValue = normalRelay(inputValue, upperLimit, lowerLimit)
    if inputValue >= lowerLimit
        outputValue = upperLimit;
    elseif inputValue <= lowerLimit
        outputValue = lowerLimit;
    else
        outputValue = -1*outputValue;
    end
end
