adapt_data();

% disp('lin dataset');
% original_dataset = load('lin.txt');
% X = original_dataset(:,1:end-1);
% X = [ones(size(X,1),1) X];
% y = original_dataset (:,end);


% execute(X,y,0)

% original_dataset = load('lin.txt');
% X = original_dataset(:,1:end-1);
% X = [ones(size(X,1),1) X];
% y = original_dataset (:,end);

% % for i = [0.1,0.5,1,2,5,10,20,30,40,50]
% 	% execute(X,y,i)
% % end

% disp('Sph dataset');

% original_dataset = load('sph.txt');
% X = original_dataset(:,1:end-1);
% X = [ones(size(X,1),1) X];
% y = original_dataset (:,end);

% execute(X,y,0)

% original_dataset = load('sph.txt');
% X = original_dataset(:,1:end-1);
% X = [ones(size(X,1),1) X];
% y = original_dataset (:,end);


% % for i = [1,2,5,10,20,30,40,50]
% 	%execute(X,y,i)
% % end

% disp('Iris dataset');

% original_dataset = load('iris2.data');
% X = original_dataset(:,1:end-1);
% X = [ones(size(X,1),1) X];
% y = original_dataset (:,end);

% execute(X,y,0,false)

disp('AirQuality dataset');
dataset = xlsread('AirQualityUCI.xlsx');
dataset = dataset(:,3:end);
i=11;j=13;
dataset = dataset(:,[1:i-1,j,i+1:j-1,i,j+1:end]);
X = dataset(:,end-1);
X = [ones(size(X,1),1) X];
y = dataset(:,end);

execute(X,y,0,false)






remove_adapt_files();
%reference: https://in.mathworks.com/matlabcentral/newsreader/view_thread/32989