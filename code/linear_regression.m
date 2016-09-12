function [final_parameters] = linear_regression(X, phi, max_itr, del)
y = X(:,end);
X = X(:,1:end-1);

if(phi == 1)
	X = [X X(:,2).^2 X(:,2).^3 ];
	disp('poly............');
end
n = size(X,2);
m = size(X,1);
alpha = 0.001; %sph poly alpha = 0.001 same for linear
% 
min_cost = -1;
min_theta = zeros(n,1);
min_cost_his =[];
% 0: linear 
% 1: polynomial
% 2: gaussian

for i = 1:2,
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
		% temp = theta^.2;
		% temp(1)=0;
		delta = delta + del.*(theta'*theta);
		theta=theta-alpha*delta;
		cost = J(X,y,theta,del);
		cost_his(k) = cost;
		% if(rem(k,10)==0)
			% cost
		% end
		fprintf('.');
	end
	if(cost<=min_cost)
		min_cost = cost;
		min_theta = theta;
		min_cost_his = cost_his;
	end
	% size(min_theta)
	fprintf('\n');
end
 min_cost_his
% min_cost
% pause(5);
%================================
final_parameters = min_theta;
end