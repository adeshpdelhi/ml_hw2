function cost = J(X, y, theta, del)

m = size(X,1);

%===================

h = X*theta;
cost = sum((h-y).^2);
cost =cost/m;

cost = cost+ del*(theta'*theta);
%=====================
end