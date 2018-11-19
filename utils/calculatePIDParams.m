function [ Kp, Ti, Td ] = calculatePIDParams(relayAmplitude, criticalPeriod, criticalAmplitude)
    Kosc = (4*relayAmplitude)/(pi*criticalAmplitude);
    Kp = 0.6*Kosc;
    Ti = 0.5*criticalPeriod;
    Td = 0.125*criticalPeriod;
end