%% SD is defined based on the statistical concept
function [SD] = analysis_SD(A)

    [row,clom] = size(A);
    % mean
    u = sum(sum(A))/(row*clom);
    sumSD = 0;
    for i=1:row
        for j=1:clom
            sumSD = (A(i,j)-u)^2+sumSD;
        end
    end
    SD = sqrt(sumSD);
    end