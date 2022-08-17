% Simple script to make a blank data structure.
clear;

% Define input parameters.
PLAYflag='NL';
Nf=3;   % 3--0.025; 6--0.050; 12--0.100;
Ne=4;
Mw=[0.0,1.0,1.4:0.2:3.6,4,4.5,5.0];
SAfile='/Users/rjs10/Desktop/TLPef/data/SA/earthquake-global_vs30-master/global_vs30.grd';
dSAfile='/Users/rjs10/Desktop/TLPef/data/SA/earthquake-global_vs30-master/Uncertainties/global_uncert_ca.grd';
POPfile='/Users/rjs10/Desktop/TLPef/data/pop/LandScan_Global_2018/LSpop.grd';
ReMAXn=400;
ReMAXd=40;
PSA_f=0;
rand_flag='random';
isotherm=120;

% Continue to define parameters.
if(strcmpi(PLAYflag,'NL'))
    latC=[47 57];
    lonC=[0 11];
    BOUNDfile='/Users/rjs10/Desktop/TLPnl/data/outlines/NL.list';
end

% Load in population data and map grid.
[latG,lonG,POP]=loadPOP(latC,lonC,Nf,POPfile);

% Make the earthquake grid.
dL=latG(2)-latG(1);
latE=latG(1:Ne:end)+dL/2;
lonE=lonG(1:Ne:end)+dL/2;

% Load in the play boundaries.
[latB,lonB]=loadBOUND(BOUNDfile);

% Define data structure for TLP map.
S=setupSTRUCT(PLAYflag,latG,lonG,latE,lonE,latB,lonB,Mw,ReMAXn,ReMAXd,PSA_f);

% Load & grid all map data.
S=loadSA(S,SAfile,dSAfile);
S=loadDEPfromTEMP(S,PLAYflag,isotherm);
S.MAP.POP=POP;

% Save the blank template data-structure.
save('Rmap_temp.mat','S');





