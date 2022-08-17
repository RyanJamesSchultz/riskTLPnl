function [T]=loadFACIES()
  % Simple routine to load in the boundaries of all of the Dinantian Carbonates.
  
  list={'A1.list','A2.list','BD1.list','BD2.list','BSH1.list','BSH2.list','BSH3.list','BSH4.list','BSH5.list','BSHp1.list','BSHp2.list','BSHp3.list','BSHp4.list','BSHp5.list','PC1.list','PC2.list','PCa1.list','PCa2.list','PCa3.list','PCa4.list','PCa5.list','PCb1.list','PCb2.list','PCb3.list'};
  
  for i=1:length(list)
      data=load(['/Users/rjs10/Desktop/TLPnl/data/outlines/facies/',list{i}]);
      T(i).name=list{i};
      T(i).lon=data(:,1);
      T(i).lat=data(:,2);
  end
  
return


