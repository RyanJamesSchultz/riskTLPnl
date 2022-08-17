clear;

% Load in the data structure: S.
%load('TLPmap_nl_dLx.mat');
load('TLP_nl.mat');

% Tolerances.
Nn2_f=3.3556e+04;
Nn3_f=1.9844e+04;
Nn4_f=1.1077e+04;
%Nd1_f=183;
%Nd2_f=0.4;
%Nd1_f=49;
%Nd2_f=9.7e-04;
Nd1_f=1;
Nd2_f=1e-04;
Pf1_f=1e-6;

% Predefine some variables.
GREY=[0.85,0.85,0.85];
lat=53.345;
lon=6.672;
[~,i]=min(Geoid_Distance(lat(1),lon(1),[S.RISK.lat],[S.RISK.lon],'spherical'));
Nv=length(S.dVAR.b);
yl=[7e-3 3e+2];
ML_c=[1.0 4.0];

% Get boundaries of play area.
YL=[min(S.MAP.latB)-0.1 max(S.MAP.latB)+0.1];
XL=[min(S.MAP.lonB)-0.1 max(S.MAP.lonB)+0.1];

% Plot all equivalent-map data.
figure(13); clf;
subplot(1,2,[1 2]);
semilogy(S.Mw,median(S.RISK(i).Nn2,1)/Nn2_f,'-b','DisplayName','Nuisance (CDI 2)'); hold on;
semilogy(S.Mw,median(S.RISK(i).Nn3,1)/Nn3_f,'--b','DisplayName','Nuisance (CDI 3)');
semilogy(S.Mw,median(S.RISK(i).Nn4,1)/Nn4_f,':b','DisplayName','Nuisance (CDI 4)');
semilogy(S.Mw,median(S.RISK(i).Nd1,1)/Nd1_f,'-r','DisplayName','Damage (DS 1)');
semilogy(S.Mw,median(S.RISK(i).Nd2,1)/Nd2_f,'--r','DisplayName','Damage (DS 2)');
semilogy(S.Mw,median(S.RISK(i).Pf1,1)/Pf1_f,'-g','DisplayName','LPR');
h=line(3.6*[1 1],ylim(), 'Color',GREY,'LineStyle','--'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
h=line(3.4*[1 1],ylim(), 'Color',GREY,'LineStyle','--'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
h=line(xlim(),1*[1 1], 'Color',GREY,'LineStyle','--'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
xlabel('Red-Light Magnitdue (M_L)'); ylabel('Tolerance Normalized Risk');
ylim(yl); legend('Location','northwest');








