function S=loadDEPfromTEMP(S,FormationFlag,isoT)
  % Simple function that loads in formation depth data for the map-bounded area.
  
  % Map projection code from EPSG, relevant for the dataset & the Netherlands.
  CRScode=28992;

  % Get the correct file names, depending on formation flagged for.
  if(strcmpi(FormationFlag,'NL'))
      filename='/Users/rjs10/Desktop/TLPnl/data/thermal/temperature_nll-final/Temperature_NLl_final.txt';
  end
  
  % Load in datafile.
  data=load(filename);
  
  % Seperate the four columns.
  x=data(:,1)';
  y=data(:,2)';
  z=data(:,3)';
  T=data(:,4)';
  
  % Prep for isothermal depth-surface.
  [xF,yF]=meshgrid(unique(x),unique(y));
  xF=xF(:); yF=yF(:);
  Ftvd=zeros(size(xF));
  
  % Convert x/y/z coords into lat/lon/dep.
  [latF,lonF]=projinv(projcrs(CRScode),xF,yF);
  Z=-z/1000;

  % Get isothermal depth-surface.
  for i=1:length(Ftvd)
      I=(x==xF(i))&(y==yF(i));
      Zi=Z(I); Ti=T(I);
      [Zi,I]=sort(Zi); Ti=Ti(I);
      [Zi,I]=unique(Zi); Ti=Ti(I);
      [Ti,I]=unique(Ti); Zi=Zi(I);
      
      100*i/length(Ftvd)
      %Zi
      %Ti
      
      if(length(Ti)==1)
          Ftvd(i)=NaN;
      else
          Ftvd(i)=interp1(Ti,Zi,isoT,'linear',NaN);
      end
  end
  
  % Inpterpolate isothermal depths to a regular grid.
  [LON,LAT]=meshgrid(S.MAP.lonE,S.MAP.latE);
  F_TVD=griddata(lonF,latF,Ftvd,LON,LAT,'linear');
  
  % Fill in the edges a bit to make sure the area is completely covered.
  F_TVD=fillmissing(F_TVD,'nearest',1);
  F_TVD=fillmissing(F_TVD,'nearest',2);
  
  % Stuff data into output structure.
  S.MAP.DEP=F_TVD;
  
return