adapt_data();

% disp('lin dataset');
% original_dataset = load('lin.txt');
% X = original_dataset(:,1:end-1);
% y = original_dataset (:,end);
% [X,y] = normalize(X,y);
% execute('Lin',X,y,0, 0,true, true, 0.0005,false);
% execute('Lin',X,y,0, 1,true, true, 0.0005,false);

% execute('Lin', X,y,1, 1, false, false, 0.0005,false); % optimal is 1


% disp('Sph dataset');
% original_dataset = load('sph.txt');
% X = original_dataset(:,1:end-1);
% y = original_dataset (:,end);
% [X,y] = normalize(X,y);
% execute('Sph',X,y,0, 0,true, true, 0.005,false);
% execute('Sph',X,y,0, 1,true, true, 0.005,false);

% execute('Sph', X,y,0.5, 1, true, true, 0.005,false); % optimal 0.5

% disp('Iris dataset');
% original_dataset = load('iris2.data');
% X = original_dataset(:,1:end-1);
% y = original_dataset (:,end);
% [X,y] = normalize(X,y);
% execute('Iris',X,y, 0.2, 0,false, true, 0.005,false);
% execute('Iris',X,y, 0.2, 0,false, true, 0.005,true);


% disp('Seeds dataset');
% original_dataset = load('seeds_dataset.txt');
% X = original_dataset(:,1:end-1);
% y = original_dataset (:,end);
% [X,y] = normalize(X,y);
% execute('Seeds',X,y, 0.5, 0,false, true, 0.001,false);
% execute('Seeds',X,y, 0.5, 0,false, true, 0.001,true);



disp('AirQuality dataset');
original_dataset = xlsread('AirQualityUCI.xlsx');
original_dataset = original_dataset(:,3:end);
a=11;b=13;
original_dataset = original_dataset(:,[ 1: a - 1,b , a + 1: b - 1,a,b+1 :end]);
X = original_dataset(:,1:end-1);
y = original_dataset (:,end);
[X,y] = normalize(X,y);
% execute('Airquality',X,y,0.2, 0,false, true, 0.00001,false);
execute('Airquality',X,y,0.2, 0,false, true, 0.00001,true);






remove_adapt_files();
%reference: https://in.mathworks.com/matlabcentral/newsreader/view_thread/32989