function cost = execute(X, y, del, should_plot)
	if nargin < 4
	    should_plot =  true;
  	end

	n = size(X,2);
	m = size(X,1);

	phi = zeros(m,1);
	max_itr = 100;
	iteration_list = [0.5,0.6,0.7,0.8,0.9];
	mse_list = zeros(1,size(iteration_list,2));
		% size(mse_list)
	j = 0;	
	min_prediction_cost = 10000000000000;
	min_prediction = [];
	min_parameters =[];
	for p = [0.5,0.6,0.7,0.8,0.9],
		% size(mse_list)
		fprintf('%f\n',p);
		j = j+1;
		parameters = linear_regression([X(1:ceil(m*p),:) y(1:ceil(m*p),:)], phi, max_itr, del);
		prediction = X*parameters;
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
			min_parameters = parameters;
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
		plot(X(:,2),y,'gx',X(:,2),min_prediction,'r');
	end


%===========================
cost = min_prediction_cost;
end