function cost = execute(name, X, y, del, phi, should_plot_fit, should_plot_mse, alpha)
	n = size(X,2);
	m = size(X,1);
	backup_X = X;
	max_itr = 100;
	iteration_list = [0.5,0.6,0.7,0.8,0.9];
	if ~should_plot_mse
		iteration_list = [0.9];
	end
	mse_list = zeros(1,size(iteration_list,2));
	j = 0;	
	min_prediction_cost = 10000000000000;
	min_prediction = [];
	min_parameters =[];
	fprintf('--------------------------------------------------------------------------------------------\n');	
	for p = iteration_list,
		X = backup_X;
		fprintf('Fraction of data for testing = %2.1f  \n',p);
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
		mse = J(X(ceil(m*p):end,:),y(ceil(m*p):end,:),parameters,0);
		mse_list(1,j) = mse;
		if(mse < min_prediction_cost)
			min_prediction = prediction;
			min_prediction_cost = mse;
			min_parameters = parameters;
		end
		fprintf('MSE(Entire data) = %f\n',mse);
		fprintf('--------------------------------------------------------------------------------------------\n');

	end;
	min_parameters
	if phi == 0 && del ==0
			name = strcat(name,': Gradient descent');
		elseif  del~=0
			name = strcat(name,': Ridge regression');
		elseif phi == 1
			name = strcat(name,': Polynomial');
		elseif phi == 2
			name = strcat(name,': Gaussian');
		end
	if should_plot_mse
		figure;
		plot(iteration_list, mse_list);
		title(name);xlabel('Fraction of data');ylabel('MSE');
	end
	if should_plot_fit
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
fprintf('Final MSE: %f\n--------------------------------------------------------------------------------------------\n',min_prediction_cost);	

end