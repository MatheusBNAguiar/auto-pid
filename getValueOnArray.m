function oValue = getValueOnArray(iTable, iIndex)
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