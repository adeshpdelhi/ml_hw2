function cost = J(X, y, theta, del)

m = size(X,1);

%===================
if(size(X,2) ~= size(theta,1))
	size(X)
	size(theta)
end
h = X*theta;
cost = sum((h-y).^2);
cost =cost/m;
temp = theta;
temp(1) = 0;
cost = cost+ del*(temp'*temp);
%=====================
end