function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);


idx = zeros(size(X,1), 1);

m = size(X,1);
dist = zeros(m,K);

for i = 1: K
  diff = bsxfun(@minus,X,centroids(i,:));
  dist(:,i) = sum(diff.^2,2);
endfor

[val,idx] = min(dist,[],2);

end

