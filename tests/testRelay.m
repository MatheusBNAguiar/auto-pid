outputArray = [];
inputArray = [];
inputArrayClone = 0:0.001:12.56;
for data = inputArrayClone
    inputArray = [-1*inputArray, sin(data)];
    outputArray = [outputArray, hysteresisRelay( inputArray, 1,  0.1 )];
end
close all
figure
hold
plot(inputArrayClone, outputArray)
plot(inputArrayClone, inputArray)

