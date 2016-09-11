function adapt_data()
%Reference: http://in.mathworks.com/matlabcentral/newsreader/view_thread/246113

	fin = fopen('iris.data');
	fout = fopen('iris2.data','w');
	while ~feof(fin)
	   s = fgetl(fin);
	   s = strrep(s, 'Iris-setosa', '1');
	   s = strrep(s, 'Iris-versicolor', '2');
   	   s = strrep(s, 'Iris-virginica', '3');
	   fprintf(fout,'%s\n',s);
	end
	fclose(fin);
	fclose(fout);

	% fin = fopen('column_3C.dat');
	% fout = fopen('column_3C2.dat','w');
	% while ~feof(fin)
	%    s = fgetl(fin);
	%    s = strrep(s, 'DH', '1');
	%    s = strrep(s, 'SL', '2');
 %   	   s = strrep(s, 'NO', '3');
	%    fprintf(fout,'%s\n',s);
	% end
	% fclose(fin);
	% fclose(fout);

	% fin = fopen('segmentation.data');
	% fout = fopen('segmentation2.data','w');
	% for i=1:5,
	% 	s = fgetl(fin);
	% end
	% while ~feof(fin)
	%    s = fgetl(fin);
	%    s = strrep(s, 'BRICKFACE', '1');
	%    s = strrep(s, 'SKY', '2');
 %   	   s = strrep(s, 'FOLIAGE', '3');
 %   	   s = strrep(s, 'CEMENT', '4');
 %   	   s = strrep(s, 'WINDOW', '5');
 %   	   s = strrep(s, 'PATH', '6');
 %   	   s = strrep(s, 'GRASS', '7');
	%    fprintf(fout,'%s\n',s);
	% end
	% fclose(fin);
	% fclose(fout);

end