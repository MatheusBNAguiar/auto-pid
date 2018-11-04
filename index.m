numerator = input ('Add transfer function numerator, only the indexes \n','s');
denominator = input ('Add transfer function denominator, only the indexes \n','s');
sampleTime = input ('Añadir tiempo de muestra \n');

numerator = str2num(numerator);
denominator = str2num(denominator);

transfer = tf(numerator, denominator, sampleTime);

