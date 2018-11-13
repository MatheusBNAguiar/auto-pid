function oValue = getValueOnArray(iTable, iIndex)
    if iIndex <= 0
        iIndex = 1;
    end
    try
        if(isa(iTable,'cell'))
            iTable{iIndex}; %#ok<*VUNUS>
        else
            iTable(iIndex);
        end
        oValue = iTable(iIndex);
    catch
        oValue = 0;
    end
end