function intermediatorParams = analyzeProcess( errorArray, intermediateArray, outputArray , sampleTime, relayAmplitude)
    if condition
       
    else
        criticalAmplitude = calculateRelayCross( errorArray, intermediateArray );
        criticalPeriod = calculateWavePeriod(outputArray, sampleTime);
        [ Kp, Ti, Td ] = calculatePIDParams(relayAmplitude, criticalPeriod, criticalAmplitude);
        intermediatorParams = {"controller", [Kp, Ti, Td, sampleTime]}; 
    end
end