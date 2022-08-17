function [lat,lon]=loadBOUND(filename)
  % Simple function that loads in the play-bounded area.
  
  % Load in datafile.
  data=load(filename);
  
  % Seperate the two columns.
  lon=data(:,1)';
  lat=data(:,2)';
  
return