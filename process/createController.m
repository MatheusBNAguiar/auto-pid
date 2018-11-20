function intermediatorParams = createController( errorArray, intermediateArray, outputArray , sampleTime, relayAmplitude)
    criticalAmplitude = calculateRelayCross( errorArray, intermediateArray );
    criticalPeriod = calculateWavePeriod(outputArray, sampleTime);
    [ Kp, Ti, Td ] = calculatePIDParams(relayAmplitude, criticalPeriod, criticalAmplitude);
    [controllerNum, controllerDen] = declareController(Kp, Ti, Td, sampleTime);
    intermediatorParams = {"controller", controllerNum, controllerDen}; 
end