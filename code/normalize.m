function [X, y] = normalize (X, y)
	n = size(X, 2);
	m = size(X,1);

	for i = 1:m,
		X(i,:) = ( max(X) - X(i,:) ) /( max(X) - min(X) );
	end

	y = ( y - max(y) ) / ( max(y) - min(y) );

end