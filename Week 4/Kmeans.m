%read the image
img = imread('image.png');
I = im2double(img);
K=3;
F = reshape(I,size(I,1)*size(I,2),3); 
centers = [0.2 0.1 0.2; 0.8 0.5 0.2; 0.6 0.2 0.1]; % Therefore, number of clusters is 3
temp_dis_and_label   = zeros(size(F,1),K+2);          % Distances and Labels
iterations   = 3;                                     % K-means Iteration
for n = 1:iterations
   for i = 1:size(F,1)
      for j = 1:K  
        temp_distance_label(i,j) = norm(F(i,:) - centers(j,:));      
      end
      [Distance, CN] = min(temp_distance_label(i,1:K));               % 1:K are Distance from Cluster Centers 1:K 
      temp_distance_label(i,K+1) = CN;                                % K+1 is Cluster Label
      temp_distance_label(i,K+2) = Distance;                          % K+2 is Minimum Distance
   end
   for i = 1:K
      A = (temp_distance_label(:,K+1) == i);                          % Cluster K Points
      centers(i,:) = mean(F(A,:));                      % New Cluster Centers
      if sum(isnan(centers(:))) ~= 0                    % If CENTS(i,:) Is Nan Then Replace It With Random Point
         NC = find(isnan(centers(:,1)) == 1);           % Find Nan Centers
         for Ind = 1:size(NC,1)
         centers(NC(Ind),:) = [0.1 0.1 0.1];
         end
      end
   end
end
X = zeros(size(F));
for i = 1:K
idx = find(temp_distance_label(:,K+1) == i);
X(idx,:) = repmat(centers(i,:),size(idx,1),1); 
end
T = reshape(X,size(I,1),size(I,2),3);
%% Show
figure()
subplot(121); imshow(I); title('original')
subplot(122); imshow(T); title('segmented')
disp('number of segments ='); disp(K)
final_centers = centers
disp(centers)