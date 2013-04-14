%% documentation 
%
%
function [data,res] = extract_features(bw,dbg)
          points='';
          stat=regionprops(im2bw(bw),'BoundingBox');
          bbx=stat.BoundingBox;
         t=imcrop(bw,[bbx(1),(bbx(2)+bbx(4)/3),bbx(3),bbx(4)/3]);
         BW = edge(t,'sobel');
         I=im2bw(BW);
         bw2=bwperim(I,8);
          [x,y]=find(bw2==1);
          %figure(1);
          %imshow(I)
          %hold on
           k=1;
            for j=1:3:length(x)
                 %plot(y(j), x(j), 'r*');
                 points{k}=[x(j),y(j)];
                 k=k+1;
            end
        % hold off
         % ornekler al�nm�s resim
    %if dbg
    %    figure(1);
     %       imshow(I)
            %subplot(222), imshow(bw)
            %subplot(223), imshow(bw)
           % subplot(224), imshow(bw)
            %pause
    %end
    data = points;
    res=I;
end

%% helpers funcs
%
%
