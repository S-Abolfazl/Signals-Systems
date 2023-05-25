function [feature_map] = conv2D(img,filters,stride,padding,names)

M = size(img,1);
N = size(img,2);
f = size(filters,1);
number_of_filters = size(filters,3);
C = size(img,3);
if padding == "same"
    p = (f-1)/2;
    if floor(p) ~= p
        p = ceil(p);
        img = padarray(img,[p,p],0,'post');
    else
        img = padarray(img,[p,p],0,'both');
    end
    feature_map = zeros(M,N,C);
else
    feature_map = zeros(M-f+1,N-f+1,C);
end


for x=1:number_of_filters
    if padding == "same"
        output = zeros(M,N);
    else
        output = zeros(M-f+1,N-f+1);
    end    

    for y=1:C
        convv = convulv(img(:,:,y),filters(:,:,x),stride);
        output = output + convv;
    end

    if C == 3
        subplot(1,number_of_filters+1,1);
        imshow(img);
        title ('image');
        subplot(1,number_of_filters+1,x+1);
        imshow(output);
        title (names(x));
    else
        subplot(1,number_of_filters,x);
        imshow(output);
        title (names(1,x));
    end
    feature_map(:,:,x) =  output;
end
end
