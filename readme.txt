The input X to linear_regression doesn't contain the first column as all 1's.
I am scaling the features of the data before passing it to linear_regresion. The function should work even without any scaling.
I am scaling to keep alpha sensibly small otherwise it used to blow up rapidly.
Linear regression prototype: function [final_parameters min_cost] = linear_regression(X, phi, max_itr, del, alpha)