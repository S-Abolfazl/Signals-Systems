function [output] = convulv(inputArg1,inputArg2,stride)

h=size(inputArg1,1);
w=size(inputArg1,2);

kernel = inputArg2;
f = size(kernel, 1);
for row = 1:stride:h-f+1
    for col = 1:stride:w-f+1
        local = inputArg1(row:row+f-1, col:col+f-1);
        conv = double(local) .* kernel;
        output(row, col) = sum(conv, 'all');
    end
end
end
