function outputValue = hysteresisRelay( input, limit,  hysteresis )
    if abs(input)<= hysteresis
        outputValue = 0 ;
    else
        outputValue = ((4*limit/(pi*input))* abs(sqrt(1-(hysteresis/input)^2) - i* (hysteresis/input)));
    end
end

