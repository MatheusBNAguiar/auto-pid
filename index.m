clear all;
close all;

% User passed arguments

reference = 0.1;
numerator = '50';
% numerator = input ('Adicione os numeradores da função, apenas números \n','s');
denominator = '1 11 10';
% denominator = input ('Adicione os denominadores da função, apenas números \n','s');

relayAmplitude = 0.1;
stepAmplitude = 0.1;
desiredAmplitude = 0.85;

% Fixed params
sampleTime = 0.001;
selectedHysterisis = 0.7;
timeSimulation = 20;
simulationTries = 8;

[discreteNum, discreteDen] = buildTransferFunction(sampleTime, numerator, denominator);

for simulation = 1:simulationTries
    intermediatorParams = {"relay", relayAmplitude,  selectedHysterisis};
    [timeArray, referenceArray, errorArray, intermediateArray, outputArray] = runProcess(sampleTime, timeSimulation, discreteNum, discreteDen, reference, intermediatorParams);
    subplot(ceil(simulationTries/2),2,simulation);
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

