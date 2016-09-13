function [final_parameters min_cost] = linear_regression(X, phi, max_itr, del, alpha)
y = X(:,end);
X = X(:,1:end-1);
X = [ones(size(X,1),1) X];
if(phi == 1)
	X = [X X(:,2).^2 X(:,2).^3 ];
end
n = size(X,2);
m = size(X,1);
min_cost = -1;
min_theta = zeros(n,1);
min_cost_his =[];
% 0: linear 
% 1: polynomial
% 2: gaussian

for i = 1:10,
	theta = rand(n,1);
	cost_his = zeros(max_itr,1);
	cost = J(X,y,theta,del);
	if(min_cost == -1)
		min_cost = cost;
	end
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
		delta = delta + del.*(temp'*temp);
		theta=theta-alpha*delta;
		cost = J(X,y,theta,del);
		cost_his(k) = cost;
		if(rem(k,max_itr/10)==0)
			fprintf('.');
		end
	end
	if(cost<=min_cost)
		min_cost = cost;
		min_theta = theta;
		min_cost_his = cost_his;
	end
	fprintf('\tJ(test data) = %f\n',cost);
end
%================================
final_parameters = min_theta;
end