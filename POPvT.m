function [Rn,Rg]=POPvT(Yi,Ya)
  % Simple function that gives the population ratio in the Netherlands/Groningen.
  
  % Load in the Netherlands population dataset.
  data=load('/Users/rjs10/Desktop/TLPnl/data/POPvT/Netherlands.csv');
  Yn=data(:,1);
  Pn=mean(data(:,2:3)')';
  %P2=data(:,3);
  
  % Load in the Groningen population dataset.
  data=load('/Users/rjs10/Desktop/TLPnl/data/POPvT/Groningen.csv');
  Yg=data(:,1);
  Pg=data(:,2);
  
  % Compute ratios.
  Rn=interp1(Yn,Pn,Yi,'linear')./interp1(Yn,Pn,Ya,'linear');
  Rg=interp1(Yg,Pg,Yi,'linear')./interp1(Yg,Pg,Ya,'linear');
  
return