function isOnTheLimit = checkStopStep(outputArray, desiredAmplitude)
    tolerancePeak = 10^-2;
    tolerancePeriod = 1;
    [values, occurences] = findpeaks(outputArray);
    meanPeak = mean(values);
    stdDevPeaks = std(values);
    stdDevPeriod = std(diff(occurences));
    isOnTheLimit = (meanPeak>=desiredAmplitude) && (stdDevPeaks<tolerancePeak) && (stdDevPeriod<tolerancePeriod);
end