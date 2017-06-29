function [ newValues ] = shuffle( values, n, pos )
newValues = values(:,pos(1));
for i=2:n
    newValues = [newValues values(:, pos(i))];
end
end

