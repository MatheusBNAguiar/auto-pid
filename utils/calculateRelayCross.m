function outputCross = calculateRelayCross( errorArray, signalArray )
    bound = ceil(length(signalArray)/2);
    firstValue = signalArray(bound);
    for index = bound:length(signalArray)
        if signalArray(index) ~= firstValue 
            outputCross = abs(errorArray(index));
            break;
        end
    end
end