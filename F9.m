clear;

% Load in the data structures: M & S.
load('TLPmap_nl_dLx.mat');
load('TLP_nl.mat');

% Predefine some variables.
ML_c=[1.0 4.0];
nc=(6*3)+1;

% Get boundaries of play area.
YL=[min(S.MAP.latB)-0.1 max(S.MAP.latB)+0.1];
XL=[min(S.MAP.lonB)-0.1 max(S.MAP.lonB)+0.1];

% Plot iso-risk maps.
figure(9); clf;
% Iso-nuisance map.
subplot(131);
contourf(M.N.N3.lon,M.N.N3.lat,M.N.Mcomb,linspace(ML_c(1),ML_c(2),nc),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Iso-Nuisance Map');
h = colorbar(); ylabel(h, 'Red-Light Magnitude (M_L)');
colormap(gca,R_colormap('red-light')); caxis(ML_c);
xlim(XL); ylim(YL);
% Iso-damage map.
subplot(132);
contourf(M.D.D1.lon,M.D.D1.lat,M.D.Mcomb,linspace(ML_c(1),ML_c(2),nc),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Iso-Damage Map');
h = colorbar(); ylabel(h, 'Red-Light Magnitude (M_L)');
colormap(gca,R_colormap('red-light')); caxis(ML_c);
xlim(XL); ylim(YL);
% Iso-LPR map.
subplot(133);
contourf(M.R.R1.lon,M.R.R1.lat,M.R.R1.Mr,linspace(ML_c(1),ML_c(2),nc),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Iso-LPR Map');
h = colorbar(); ylabel(h, 'Red-Light Magnitude (M_L)');
colormap(gca,R_colormap('red-light')); caxis(ML_c);
xlim(XL); ylim(YL);