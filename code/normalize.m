function [X, y] = normalize (X, y)
	n = size(X, 2);
	m = size(X,1);
	minX = min(X);
	maxX = max(X);
	for i = 1:m,
		X(i,:) = ( X(i,:) - minX ) ./( maxX - minX );
	end

	y = ( y - min(y) ) ./ ( max(y) - min(y) );

end