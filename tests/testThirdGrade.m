clear all;
close all;

% User passed arguments

reference = 0.1;
numerator = '50';
% numerator = input ('Adicione os numeradores da função, apenas números \n','s');
denominator = '1 11 10 0';
% denominator = input ('Adicione os denominadores da função, apenas números \n','s');

relayAmplitude = 1;
stepAmplitude = 0.5;
desiredAmplitude = 0.6;

% Fixed params
sampleTime = 0.001;
selectedHysterisis = 0;
timeSimulation = 20;
simulationTries = 2;

[discreteNum, discreteDen] = buildTransferFunction(sampleTime, numerator, denominator);

for simulation = 1:simulationTries
    intermediatorParams = {"relay", relayAmplitude,  selectedHysterisis};
    [timeArray, referenceArray, errorArray, intermediateArray, outputArray] = runProcess(sampleTime, timeSimulation, discreteNum, discreteDen, reference, intermediatorParams);
    subplot(simulationTries/2,1,simulation);
    plot(timeArray, outputArray);
    title(['Simulação ', num2str(simulation), '- Saida']);
    if(checkStopStep(outputArray, desiredAmplitude))
        break;
    else
        relayAmplitude = relayAmplitude + stepAmplitude;
    end
end

figure;
hold;
legend('Sinal do Erro','Sinal de Controle');
plot(timeArray, errorArray);
plot(timeArray, intermediateArray);
title('Ação de Controle vs Sinal do Erro');

% Use PID controller
intermediatorParams = createController( errorArray, intermediateArray, outputArray , sampleTime, relayAmplitude);
[timeArray, referenceArray, errorArray, intermediateArray, outputArray] = runProcess(sampleTime, timeSimulation, discreteNum, discreteDen, reference, intermediatorParams);

figure;
plot(timeArray, outputArray);
title('Planta com Controle Aplicado');



figure;
hold;
plot(timeArray, errorArray);
title('Sinal do Erro');

