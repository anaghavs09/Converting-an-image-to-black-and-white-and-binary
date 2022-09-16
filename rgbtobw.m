
img = imread('apple.jpeg');
BlackWhite = colouredToGray(img)
BinaryImg = convert2binary(BlackWhite)
imshow(BlackWhite)
%imshow(BinaryImg)

function [gray_image] = colouredToGray(img)
    R = img(:, :, 1)
    G = img(:, :, 2)
    B = img(:, :, 3)

    [M, N, ~] = size(img)

    gray_image = zeros(M, N, 'uint8')

    for i = 1:M
        for j = 1:N
            gray_image(i, j) = (R(i, j)*0.2989)+(G(i, j)*0.5870)+(B(i, j)*0.114);
        end
    end
end

function [binary] = convert2binary(img)
  
    [x, y, z]=size(img);
  
    if z==3
         img=colouredToGray(img);
    end
  
    img=double(img);
    sum=0;
    for i=1:x
         for j=1:y
            sum=sum+img(i, j);
     end
     end
  
    threshold=sum/(x*y);
    binary=zeros(x, y);
  
    for i=1:x
     for j=1:y
        if img(i, j) >= threshold
                binary(i, j) = 1;
        else
            binary(i, j)=0;
        end
     end
    end
end

