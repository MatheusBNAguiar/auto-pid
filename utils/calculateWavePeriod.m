function period = calculateWavePeriod(outputArray, sampleTime)
    ac=xcorr(outputArray,outputArray);
    [~,locs]=findpeaks(ac);
    period = mean(diff(locs)*sampleTime)
end