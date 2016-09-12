adapt_data();

% disp('lin dataset');
% original_dataset = load('lin.txt');
% X = original_dataset(:,1:end-1);
% y = original_dataset (:,end);
% [X,y] = normalize(X,y);
% X = [ones(size(X,1),1) X];


% execute(X,y,0, 0,true)

% for i = [0.1,0.5]
	% execute(X,y,0.5, 0, true)
% end

% disp('Sph dataset');
% original_dataset = load('sph.txt');
% X = original_dataset(:,1:end-1);
% y = original_dataset (:,end);
% [X,y] = normalize(X,y);
% % X(1:10,:)
% X = [ones(size(X,1),1) X];


% execute(X,y,0, 1,true)


% for i = [0.1,0.5]
	% execute(X,y,1, 0, true)
% end

% disp('Iris dataset');

% original_dataset = load('iris2.data');
% X = original_dataset(:,1:end-1);
% y = original_dataset (:,end);
% [X,y] = normalize(X,y);
% X = [ones(size(X,1),1) X];


% execute(X,y,0, 0, false)

disp('AirQuality dataset');
dataset = xlsread('AirQualityUCI.xlsx');
dataset = dataset(:,3:end);
i=11;j=13;
dataset = dataset(:,[1:i-1,j,i+1:j-1,i,j+1:end]);
X = original_dataset(:,1:end-1);
y = original_dataset (:,end);
[X,y] = normalize(X,y);
X = [ones(size(X,1),1) X];


execute(X,y,0, 0, false)







remove_adapt_files();
%reference: https://in.mathworks.com/matlabcentral/newsreader/view_thread/32989