clear;

% Load in the data structures: M & S.
load('TLPmap_nl_dLx.mat');
load('TLP_nl.mat');

% Predefine some variables.
GREY=[0.85,0.85,0.85];
yl=[7e-2 7e+5];
ML_c=[1.0 4.0];

% Get boundaries of play area.
YL=[min(S.MAP.latB)-0.1 max(S.MAP.latB)+0.1];
XL=[min(S.MAP.lonB)-0.1 max(S.MAP.lonB)+0.1];

% Plot the red-light difference maps (for nuisance).
figure(511); clf;
% CDI 2.
subplot(231);
contourf(M.N.N2.lon,M.N.N2.lat,M.N.N2.Mr-M.N.Mcomb,linspace(-0.2,+0.2,35),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Iso-Nuisance Map Difference CDI2-combination');
h = colorbar(); ylabel(h, 'Magnitude Difference (M_L)');
colormap(gca,redblue(35)); caxis([-0.3 +0.3]);
xlim(XL); ylim(YL);
subplot(234);
v=M.N.N2.Mr-M.N.Mcomb; v(v==0)=NaN;
histogram(v,round(sqrt(length(v))));
xlabel('Red-Light Magnitude Difference (M_L)'); ylabel('Counts');
xlim([0 +0.3]);
% CDI 3.
subplot(232);
contourf(M.N.N3.lon,M.N.N3.lat,M.N.N3.Mr-M.N.Mcomb,linspace(-0.2,+0.2,35),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Iso-Nuisance Map Difference CDI3-combination');
h = colorbar(); ylabel(h, 'Magnitude Difference (M_L)');
colormap(gca,redblue(35)); caxis([-0.3 +0.3]);
xlim(XL); ylim(YL);
subplot(235);
v=M.N.N3.Mr-M.N.Mcomb; v(v==0)=NaN;
histogram(v,round(sqrt(length(v))));
xlabel('Red-Light Magnitude Difference (M_L)'); ylabel('Counts');
xlim([0 +0.3]);
% CDI 4.
subplot(233);
contourf(M.N.N4.lon,M.N.N4.lat,M.N.N4.Mr-M.N.Mcomb,linspace(-0.2,+0.2,35),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Iso-Nuisance Map Difference CDI4-combination');
h = colorbar(); ylabel(h, 'Magnitude Difference (M_L)');
colormap(gca,redblue(35)); caxis([-0.3 +0.3]);
xlim(XL); ylim(YL);
subplot(236);
v=M.N.N4.Mr-M.N.Mcomb; v(v==0)=NaN;
histogram(v,round(sqrt(length(v))));
xlabel('Red-Light Magnitude Difference (M_L)'); ylabel('Counts');
xlim([0 +0.3]);


