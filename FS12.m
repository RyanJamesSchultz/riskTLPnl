clear;

% Load in the data structures: M & S.
load('TLPmap_nl_dH.mat');
load('TLP_nl.mat');

% Predefine some variables.
ML_c=[1.0 4.0];

% Get boundaries of play area.
YL=[min(S.MAP.latB)-0.1 max(S.MAP.latB)+0.1];
XL=[min(S.MAP.lonB)-0.1 max(S.MAP.lonB)+0.1];

% Plot the iso-damage maps (P10).
figure(512); clf;
% Plot DS 1.
subplot(2,5,[1]);
contourf(M.D.D1.lon,M.D.D1.lat,M.D.D1.Mr,linspace(ML_c(1),ML_c(2),35),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title(['DS 1 Iso-Damage Map, Nd1=',num2str(M.D.T1)]);
h = colorbar(); ylabel(h, 'Red-Light Magnitude (M_L)');
colormap(gca,R_colormap('red-light')); caxis(ML_c);
xlim(XL); ylim(YL);
% Plot DS 2.
subplot(2,5,[6]);
contourf(M.D.D2.lon,M.D.D2.lat,M.D.D2.Mr,linspace(ML_c(1),ML_c(2),35),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title(['DS 2 Iso-Damage Map, Nd2=',num2str(M.D.T2)]);
h = colorbar(); ylabel(h, 'Red-Light Magnitude (M_L)');
colormap(gca,R_colormap('red-light')); caxis(ML_c);
xlim(XL); ylim(YL);
% Plot the combination map.
subplot(2,5,[2 3 7 8]);
contourf(M.D.D1.lon,M.D.D1.lat,M.D.Mcomb,linspace(ML_c(1),ML_c(2),35),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Iso-Damage Combination Map');
h = colorbar(); ylabel(h, 'Red-Light Magnitude (M_L)');
colormap(gca,R_colormap('red-light')); caxis(ML_c);
xlim(XL); ylim(YL);
% Plot the controlling indicies.
subplot(2,5,[4 5 9 10]);
contourf(M.D.D1.lon,M.D.D1.lat,M.D.index,'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Combination Map Indicies');
h = colorbar(); ylabel(h, 'Controlling Damage Index (DS)');
colormap(gca,R_colormap('damage'));
xlim(XL); ylim(YL);






