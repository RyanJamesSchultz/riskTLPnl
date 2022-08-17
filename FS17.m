clear;

% Load in the data structures: M & S.
load('TLPmap_nl_dLx.mat');
load('TLP_nl.mat');

% Get boundaries of play area.
YL=[min(S.MAP.latB)-0.1 max(S.MAP.latB)+0.1];
XL=[min(S.MAP.lonB)-0.1 max(S.MAP.lonB)+0.1];

% Make equivalent-risk maps from the final combination map.
[En2,En3,En4,Ed1,Ed2,Er1]=mapEQUIV(M,S);

% Plot equivalent-risk maps.
figure(517); clf;
% Nuisance impacts (CDI 2).
subplot(231);
contourf(M.N.N2.lon,M.N.N2.lat,real(log10(En2)),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Equivalent Risk Map (CDI 2)');
h = colorbar(); ylabel(h, 'log_{10} [Impacted Household Count]');
colormap(gca,R_colormap('nuisance')); %caxis([4.2 5.4]);
xlim(XL); ylim(YL);
% Nuisance impacts (CDI 3).
subplot(232);
contourf(M.N.N3.lon,M.N.N3.lat,real(log10(En3)),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Equivalent Risk Map (CDI 3)');
h = colorbar(); ylabel(h, 'log_{10} [Impacted Household Count]');
colormap(gca,R_colormap('nuisance')); %caxis([4.2 5.4]);
xlim(XL); ylim(YL);
% Nuisance impacts (CDI 4).
subplot(233);
contourf(M.N.N4.lon,M.N.N4.lat,real(log10(En4)),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Equivalent Risk Map (CDI 4)');
h = colorbar(); ylabel(h, 'log_{10} [Impacted Household Count]');
colormap(gca,R_colormap('nuisance')); %caxis([4.2 5.4]);
xlim(XL); ylim(YL);
% Damage impacts (DS 1).
subplot(234);
contourf(M.D.D1.lon,M.D.D1.lat,real(log10(Ed1)),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Equivalent Risk Map (DS 1)');
h = colorbar(); ylabel(h, 'log_{10} [Damaged Household Count]');
colormap(gca,R_colormap('damage')); caxis([-1 3]);
xlim(XL); ylim(YL);
% Damage impacts (DS 2).
subplot(235);
contourf(M.D.D2.lon,M.D.D2.lat,real(log10(Ed2)),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Equivalent Risk Map (DS 2)');
h = colorbar(); ylabel(h, 'log_{10} [Damaged Household Count]');
colormap(gca,R_colormap('damage')); caxis([-4 1]);
xlim(XL); ylim(YL);
% LPR.
subplot(236);
contourf(M.R.R1.lon,M.R.R1.lat,real(log10(Er1)),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Equivalent Risk Map (LPR)');
h = colorbar(); ylabel(h, 'log_{10} [LPR, Probability of Fatality]');
colormap(gca,R_colormap('LPR')); caxis([-10 -6]);
xlim(XL); ylim(YL);
