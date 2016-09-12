function cost = execute(X, y, del, phi, should_plot)

	n = size(X,2);
	m = size(X,1);

	max_itr = 2000;
	iteration_list = [0.5,0.6,0.7,0.8,0.9];
	mse_list = zeros(1,size(iteration_list,2));
		% size(mse_list)
	j = 0;	
	min_prediction_cost = 10000000000000;
	min_prediction = [];
	min_parameters =[];
	for p = iteration_list,
		% size(mse_list)
		fprintf('%f\n',p);
		j = j+1;
		parameters = linear_regression([X(1:ceil(m*p),:) y(1:ceil(m*p),:)], phi, max_itr, del);
		if(phi ~= 1)
			prediction = X*parameters;
		end;
		if(phi == 1)
			backup_X = X;
			X = [X, X(:,2).^2, X(:,2).^3 ];
			prediction = X*parameters;
			X = backup_X;
		end;
		mse = 0;
		for i=1:m,
			mse = mse + (y(i,1) - prediction(i,1)).^2;
		end

		mse = mse./m;
		% size(mse)
		mse_list(1,j) = mse;
		if(mse < min_prediction_cost)
			min_prediction = prediction;
			min_prediction_cost = mse;
			% size(parameters)
			min_parameters = parameters;
			% size(min_parameters)
		end
		% disp('here');
		parameters;
		mse;
	end;
	iteration_list;
	mse_list;
	min_parameters
	min_prediction_cost;
	figure;
	plot(iteration_list, mse_list);
	if should_plot 
		figure;
		plot(X(:,2),y,'gx');
		hold on;
		% y = min_parameters(1)
		y = zeros(length(X),1);
		for i = 1:length(min_parameters),
			length(min_parameters(i));
			length(y);
			length(X(:,2));
			y = y + min_parameters(i) * ( X(:,2).^(i-1) );
		end;
		plot(X(:,2),y,'r.');
	end
	% if should_plot && phi ==1 
		
		% y = min_parameters
		% plot(X)
	% end

%===========================
cost = min_prediction_cost;
end