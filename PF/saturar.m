function [ A ] = saturar( strImage, th )

A = imread(strImage);
for i=1:size(A,1)
    for j=1:size(A,2)
        for k=1:size(A,3)
            if A(i,j,k) < th
                A(i,j,k) = 0;
            end
        end
    end
end

end

