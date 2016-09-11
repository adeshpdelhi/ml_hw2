function [final_parameters] = linear_regression(X, phi, max_itr, del)
y = X(:,end);
X = X(:,1:end-1);
n = size(X,2);
m = size(X,1);
alpha = 0.00000005;
min_cost = 1000000000000000000;
min_theta = [];
min_cost_his =[];
for i = 1:3,
	theta = rand(n,1);
	cost_his = zeros(max_itr,1);
	cost = J(X,y,theta,del);
	for k = 1:max_itr
		delta = zeros(n,1);
		for i = 1:m,
			xi=X(i,:);
	        xi = xi(:);
			delta = delta + (theta'*xi-y(i))*xi;
		end;
		% delta=delta/m;
		temp = theta;
		temp(1)=0;
		delta = delta + del.*temp;
		theta=theta-alpha*delta;
		cost = J(X,y,theta,del);
		cost_his(k) = cost;
		fprintf('.');
	end
	if(cost<min_cost)
		min_cost = cost;
		min_theta = theta;
		min_cost_his = cost_his;
	end
	fprintf('\n');
end
 min_cost_his;
% min_cost
% pause(5);
%================================
final_parameters = min_theta;
end