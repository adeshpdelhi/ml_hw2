function cost = execute(name, X, y, del, phi, should_plot, alpha)
	n = size(X,2);
	m = size(X,1);
	backup_X = X;
	max_itr = 100;
	iteration_list = [0.5,0.6,0.7,0.8,0.9];
	mse_list = zeros(1,size(iteration_list,2));
	j = 0;	
	min_prediction_cost = 10000000000000;
	min_prediction = [];
	min_parameters =[];
	for p = iteration_list,
		X = backup_X;
		fprintf('--------------------------------------------------------------------------------------------\n');
		fprintf('Fraction of data for testing = %f  \n',p);
		j = j+1;
		parameters = linear_regression([X(1:ceil(m*p),:) y(1:ceil(m*p),:)], phi, max_itr, del, alpha);
		% 0: linear 
		% 1: polynomial
		% 2: gaussian
		X = [ones(size(X,1),1) X];
		if(phi ~= 1)
			prediction = X*parameters;
		end;
		if(phi == 1)
			X = [X, X(:,2).^2, X(:,2).^3 ];
			prediction = X*parameters;
		end;
		mse = J(X,y,parameters,0);
		mse_list(1,j) = mse;
		if(mse < min_prediction_cost)
			min_prediction = prediction;
			min_prediction_cost = mse;
			min_parameters = parameters;
		end
		parameters;
		fprintf('MSE(entire data) = %f\n',mse);
	end;
	fprintf('--------------------------------------------------------------------------------------------\n');	
	iteration_list;
	mse_list;
	min_parameters
	min_prediction_cost;
	if phi == 0
			name = strcat(name,': Gradient descent');
		elseif phi == 1
			name = strcat(name,': Polynomial');
		elseif phi == 2
			name = strcat(name,': Gaussian');
		end
	figure;
	plot(iteration_list, mse_list);
	title(name);xlabel('Fraction of data');ylabel('MSE');
	if should_plot 
		figure;
		plot(X(:,2),y,'gx');
		hold on;
		mapX = min(X(:,2)):0.001:max(X(:,2));
		mapX = reshape(mapX,length(mapX),1);
		y = zeros(length(mapX),1);
		for i = 1:length(min_parameters),
			y = y + min_parameters(i) .* ( mapX.^(i-1) );
		end;
		plot(mapX,y,'r.');
		title(name);
	end
%===========================
cost = min_prediction_cost;
end