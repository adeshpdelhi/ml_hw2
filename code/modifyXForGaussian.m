function [X] = modifyXForGaussian (X, landmarks, variance)
	m = size(X, 1);
	for i =1:m
		X(i,:) = similarity(X(i,:), points, variance);
	end
end

function [modifiedx] = similarity(x, landmarks, variance)
	n = size(x, 2);
	modifiedx = zeros(1,n);
	for i= 1:n
		modifiedx(1,i) = exp( -(norm(x - landmarks(i,:)).^2) / 2*variance);
	end
end