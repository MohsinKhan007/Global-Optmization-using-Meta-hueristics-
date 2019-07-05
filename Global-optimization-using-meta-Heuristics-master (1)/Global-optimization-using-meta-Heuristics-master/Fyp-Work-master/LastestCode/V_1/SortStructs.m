function s = SortStructs(array)
    cells = struct2cell(array); %converts struct to cell matrix
    sortvals = cells(2,1,:); % gets the values of just the first field
    mat = cell2mat(sortvals); % converts values to a matrix
    mat = squeeze(mat); %removes the empty dimensions for a single vector
    [sorted,ix] = sort(mat); %sorts the vector of values
    array = array(ix); %rearranges the original array
    s = array;
end