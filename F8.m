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

% Plot the CDI iso-nuisance maps.
figure(8); clf;
% Plot CDI 2.
subplot(5,6,[1 2 7 8]);
contourf(M.N.N2.lon,M.N.N2.lat,M.N.N2.Mr,linspace(ML_c(1),ML_c(2),nc),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title(['CDI 2 Iso-Nuisance Map, Nn2=',num2str(M.N.T2)]);
h = colorbar(); ylabel(h, 'Red-Light Magnitude (M_L)');
colormap(gca,R_colormap('red-light')); caxis(ML_c);
xlim(XL); ylim(YL);
% Plot CDI 3.
subplot(5,6,[3 4 9 10]);
contourf(M.N.N3.lon,M.N.N3.lat,M.N.N3.Mr,linspace(ML_c(1),ML_c(2),nc),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title(['CDI 3 Iso-Nuisance Map, Nn3=',num2str(M.N.T3)]);
h = colorbar(); ylabel(h, 'Red-Light Magnitude (M_L)');
colormap(gca,R_colormap('red-light')); caxis(ML_c);
xlim(XL); ylim(YL);
% Plot CDI 4.
subplot(5,6,[5 6 11 12]);
contourf(M.N.N4.lon,M.N.N4.lat,M.N.N4.Mr,linspace(ML_c(1),ML_c(2),nc),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title(['CDI 4 Iso-Nuisance Map, Nn4=',num2str(M.N.T4)]);
h = colorbar(); ylabel(h, 'Red-Light Magnitude (M_L)');
colormap(gca,R_colormap('red-light')); caxis(ML_c);
xlim(XL); ylim(YL);
% Plot the combination map.
subplot(5,6,[13 14 15 19 20 21 25 26 27]);
contourf(M.N.N4.lon,M.N.N4.lat,M.N.Mcomb,linspace(ML_c(1),ML_c(2),nc),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Iso-Nuisance Combination Map');
h = colorbar(); ylabel(h, 'Red-Light Magnitude (M_L)');
colormap(gca,R_colormap('red-light')); caxis(ML_c);
xlim(XL); ylim(YL);
% Plot the controlling indicies.
subplot(5,6,[16 17 18 22 23 24 28 29 30]);
contourf(M.N.N2.lon,M.N.N2.lat,M.N.index,'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Combination Map Indicies');
h = colorbar(); ylabel(h, 'Controlling Nuisance Index (CDI)');
colormap(gca,R_colormap('nuisance'));
xlim(XL); ylim(YL);






