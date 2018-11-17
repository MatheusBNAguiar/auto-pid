clear all;
close all;

figure;

s = tf('s');
G = 50/((s+1)*(s+10));
 %step(G);
hold;

timeSimulation = 10;
sampleTime = 0.001;

numerator = str2num('50');
denominator = str2num('1 11 10');
transfer = tf(numerator, denominator);
transferDiscrete = c2d(transfer, sampleTime);

[discreteNum, discreteDen] = tfdata(transferDiscrete); 
discreteNum = discreteNum{1};
discreteDen = discreteDen{1};


timeArray = 0:sampleTime:timeSimulation;
inputArray = [];
outputArray = [];

for index = timeArray
    inputArray = [inputArray,1];
    output = processDiscreteFunction( discreteNum, discreteDen, inputArray, outputArray );
    outputArray = [outputArray, output];
end

plot(timeArray, outputArray);
plot(timeArray, inputArray);

