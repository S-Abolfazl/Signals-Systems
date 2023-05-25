img = imread('goodfellow.jpeg');


horizontal_edge = [[-1,-1,-1],
                   [0,0,0],
                   [1,1,1]];  
vertical_edge = [[-1,0,1],
                 [-1,0,1],
                 [-1,0,1]];
sharpening = [[0,-1,0],
              [-1,5,-1],
              [0,-1,0]];
weighted_averaging_3x3 = (1/16)*[[1, 2, 1],
                                [2, 4, 2],
                                [1, 2, 1]];


names1 = ["horizontal_edge","vertical_edge","sharpening","weighted_averaging_3x3"];
kernel = cat(3,horizontal_edge,vertical_edge,sharpening,weighted_averaging_3x3);     %kernel = filters
output1 = conv2D(img,kernel,1,'samew',names1);

robert_x = [[1, 0],
            [0, -1]];
robert_y = [[0, +1],
            [-1, 0]];
averaging_2x2 = (1/4)*[[1, 1],
                       [1, 1]];

names2 = ["robert_x","robert_y","averaging_2x2"];

kernel = cat(3,robert_x,robert_y,averaging_2x2);
figure(2);
output2 = conv2D(output1,kernel,1,'samew',names2);
