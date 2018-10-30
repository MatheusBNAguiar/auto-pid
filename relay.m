function outputValue = normalRelay(inputValue, upperLimit, lowerLimit)
    if inputValue >= lowerLimit
        outputValue = lowerLimit
    elseif inputValue <= upperLimit
        outputValue = upperLimit
    else
        outputValue = 0
    end
end



% function outputValue = hysteresisRelay(inputValue, amplitude, hysteresisRelay)

    
% end