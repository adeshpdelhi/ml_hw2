adapt_data();

disp('lin dataset');
original_dataset = load('lin.txt');
X = original_dataset(:,1:end-1);
y = original_dataset (:,end);
[X,y] = normalize(X,y);
execute('Lin',X,y,0, 0,true, 0.005);
execute('Lin',X,y,0, 1,true, 0.001);

% for i = [0.1,0.5]
	% execute(X,y,0.5, 0, true)
% end

disp('Sph dataset');
original_dataset = load('sph.txt');
X = original_dataset(:,1:end-1);
y = original_dataset (:,end);
[X,y] = normalize(X,y);
execute('Sph',X,y,0, 0,true, 0.005);
execute('Sph',X,y,0, 1,true, 0.005);

% for i = [0.1,0.5]
	% execute(X,y,1, 0, true)
% end

% disp('Iris dataset');
% original_dataset = load('iris2.data');
% X = original_dataset(:,1:end-1);
% y = original_dataset (:,end);
% [X,y] = normalize(X,y);
% execute('Iris dataset', X,y,0, 0,false, 0.005);


% disp('AirQuality dataset');
% original_dataset = xlsread('AirQualityUCI.xlsx');
% original_dataset = original_dataset(:,3:end);
% a=11;b=13;
% original_dataset = original_dataset(:,[1:a-1,b,a+1:b-1,a,b+1:end]);
% X = original_dataset(:,1:end-1);
% y = original_dataset (:,end);
% [X,y] = normalize(X,y);
% execute('Airquality dataset',X,y,0, 0,false, 0.00001);







remove_adapt_files();
%reference: https://in.mathworks.com/matlabcentral/newsreader/view_thread/32989