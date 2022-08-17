clear;

% Load in the data structures: M & S.
load('TLPmap_nl_dLx.mat');
load('TLP_nl.mat');

% Get boundaries of play area.
YL=[min(S.MAP.latB)-0.1 max(S.MAP.latB)+0.1];
XL=[min(S.MAP.lonB)-0.1 max(S.MAP.lonB)+0.1];

% Plot iso-magnitude maps.
figure(6); clf;
% Nuisance impacts.
subplot(131);
contourf(M.N.N3.lon,M.N.N3.lat,log10(M.N.N3.Nn),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title(['Iso-Magnitude Nuisance Map (M_L=',num2str(M.N.Tm),')']);
h = colorbar(); ylabel(h, 'log_{10} [Impacted Household Count]');
colormap(gca,R_colormap('nuisance')); %caxis([4 6]);
xlim(XL); ylim(YL);
% Damage impacts.
subplot(132);
contourf(M.D.D1.lon,M.D.D1.lat,log10(M.D.D1.Nd),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title(['Iso Magnitude Damage Map (M_L=',num2str(M.N.Tm),')']);
h = colorbar(); ylabel(h, 'log_{10} [Damaged Household Count]');
colormap(gca,R_colormap('damage')); caxis([-1 3]);
xlim(XL); ylim(YL);
% LPR.
subplot(133);
contourf(M.R.R1.lon,M.R.R1.lat,log10(M.R.R1.Nr),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title(['Iso Magnitude LPR Map (M_L=',num2str(M.N.Tm),')']);
h = colorbar(); ylabel(h, 'log_{10} [LPR, Probability of Fatality]');
colormap(gca,R_colormap('LPR')); caxis([-10 -6]);
xlim(XL); ylim(YL);
