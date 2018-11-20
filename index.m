clear all;
close all;

% User passed arguments
reference = 0.1;
numerator = '50';
denominator = '1 11 10';

relayAmplitude = 0.1;
stepAmplitude = 0.1;
desiredAmplitude = 0.85;

% Fixed params
sampleTime = 0.001;
selectedHysterisis = 0.7;
timeSimulation = 20;
simulationTries = 10;

[discreteNum, discreteDen] = buildTransferFunction(sampleTime, numerator, denominator);

for simulation = 1:simulationTries
    intermediatorParams = {"relay", relayAmplitude,  selectedHysterisis};
    [timeArray, referenceArray, errorArray, intermediateArray, outputArray] = runProcess(sampleTime, timeSimulation, discreteNum, discreteDen, reference, intermediatorParams);
    subplot(simulationTries/2,3,simulation);
    plot(timeArray, outputArray);
    title(['Simulação ', num2str(simulation), '- Saida']);
    if(checkStopStep(outputArray, desiredAmplitude))
        break;
    else
        relayAmplitude = relayAmplitude + stepAmplitude;
    end
end

% Use PID controller

% figure;
intermediatorParams = createController( errorArray, intermediateArray, outputArray , sampleTime, relayAmplitude);
% [timeArray, referenceArray, errorArray, intermediateArray, outputArray] = runProcess(sampleTime, timeSimulation, discreteNum, discreteDen, reference, intermediatorParams);
% title(['Controle']);
% plot(timeArray, outputArray);

% numerator = input ('Add transfer function numerator, only the indexes \n','s');
% denominator = input ('Add transfer function denominator, only the indexes \n','s');

% intermediatorParams = {"controller", controllerNum, controllerDen};