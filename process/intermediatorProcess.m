function intermediateValue = intermediatorProcess(intermediatorParams, errorArray, intermediateArray)
    choice = intermediatorParams{1};
    intermediateValue = 0;
    if choice == 'controller'
        controllerNum = intermediatorParams{2};
        controllerDen = intermediatorParams{3};
        intermediateValue = processDiscreteFunction( controllerNum, controllerDen, errorArray, intermediateArray );
    elseif choice == 'relay'
        limitValue = intermediatorParams{2};
        hysteresis = intermediatorParams{3};
        intermediateValue = hysteresisRelay( errorArray, limitValue,  hysteresis );
    end
end