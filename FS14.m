clear;

% Load in the data structures: M & S.
load('TLPmap_nl_dH.mat');
load('TLP_nl.mat');

% Predefine some variables.
ML_c=[1.0 4.0];

% Get boundaries of play area.
YL=[min(S.MAP.latB)-0.1 max(S.MAP.latB)+0.1];
XL=[min(S.MAP.lonB)-0.1 max(S.MAP.lonB)+0.1];

% Plot the iso-risk-combination & controlling-factor maps (P10).
figure(514); clf;
% Plot the combination map.
subplot(121);
contourf(M.N.N4.lon,M.N.N4.lat,M.Mcomb,linspace(ML_c(1),ML_c(2),35),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Iso-Risk Combination Map');
h = colorbar(); ylabel(h, 'Red-Light Magnitude (M_L)');
colormap(gca,R_colormap('red-light')); caxis(ML_c);
xlim(XL); ylim(YL);
% Plot the controlling indicies.
subplot(122);
contourf(M.N.N3.lon,M.N.N3.lat,M.index+normrnd(0,0.01,size(M.index)),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Controlling Risk Factor');
h = colorbar(); ylabel(h, 'Controlling Risk Factor');
colormap(gca,R_colormap('indicies')); caxis([1 3]);
xlim(XL); ylim(YL);