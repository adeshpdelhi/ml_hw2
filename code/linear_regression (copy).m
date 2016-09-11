function [final_parameters] = linear_regression(X, phi, max_itr, del)
y = X(:,end);
X = X(:,1:end-1);
n = size(X,2);
m = size(X,1);
alpha = 0.1;

theta = rand(n,1)*10;
cost_his = zeros(max_itr,1);
cost = J(X,y,theta);
for i = 1:max_itr
	cost = J(X,y,theta);
	cost_his(i) = cost;
	delta = zeros(n,1);
	for j = 1:m
		xj = X(j,:);
		xj = xj(:);
		delta = delta + (theta'*xj - y(j))*xj;
	end
	delta = delta/m
	theta = theta - alpha * delta;
	% X*theta - y
	% pause(2);
end
cost_his

%================================
final_parameters = theta;
end


		% for j = 1:n
		% 	summation = 0;
		% 	for i = 1:m
		% 		summation = summation + (X(i,:)*theta-y(i))*X(i,j);
		% 	end
		% 	theta(j) = theta(j) + alpha*summation;
		% end