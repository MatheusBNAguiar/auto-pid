function outputCross = calculateRelayCross( errorArray, signalArray )
    firstValue = signalArray(10);
    for index = 10:length(signalArray)
        if signalArray(index) ~= firstValue 
            outputCross = errorArray(index);
            break;
        end
    end
end