clear;

% Load in the data structures: M & S.
load('TLPmap_nl_dLx.mat');
load('TLP_nl.mat');

% Get boundaries of play area.
YL=[min(S.MAP.latB)-0.1 max(S.MAP.latB)+0.1];
XL=[min(S.MAP.lonB)-0.1 max(S.MAP.lonB)+0.1];

% Create the 10-5 LPR map and overload our data with it.
Rr=mapRISK(S,'LPR',3,1,1e-5,3.0,50,50,50,12);
M.Mcomb=Rr.Mr;

% Make equivalent-risk maps from the final combination map.
[En2,En3,En4,Ed1,Ed2,Er1]=mapEQUIV(M,S);

%%

% Plot equivalent-risk maps.
figure(14); clf;
% Nuisance impacts (CDI 2).
subplot(231);
contourf(M.N.N2.lon,M.N.N2.lat,log10(En2/M.N.T2),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Equivalent Risk Map (CDI 2)');
h = colorbar(); ylabel(h, 'log_{10} [Impacted Household Count]');
colormap(gca,R_colormap('nuisance')); %caxis([4.5 6.5]);
xlim(XL); ylim(YL);
% Nuisance impacts (CDI 3).
subplot(232);
contourf(M.N.N3.lon,M.N.N3.lat,log10(En3/M.N.T3),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Equivalent Risk Map (CDI 3)');
h = colorbar(); ylabel(h, 'log_{10} [Impacted Household Count]');
colormap(gca,R_colormap('nuisance')); %caxis([4.5 6.5]);
xlim(XL); ylim(YL);
% Nuisance impacts (CDI 4).
subplot(233);
contourf(M.N.N4.lon,M.N.N4.lat,log10(En4/M.N.T4),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Equivalent Risk Map (CDI 4)');
h = colorbar(); ylabel(h, 'log_{10} [Impacted Household Count]');
colormap(gca,R_colormap('nuisance')); %caxis([4.5 6.5]);
xlim(XL); ylim(YL);
% Damage impacts (DS 1).
subplot(234);
contourf(M.D.D1.lon,M.D.D1.lat,real(log10(Ed1/M.D.T1)),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Equivalent Risk Map (DS 1)');
h = colorbar(); ylabel(h, 'log_{10} [Damaged Household Count]');
colormap(gca,R_colormap('damage')); %caxis([-1 5]);
xlim(XL); ylim(YL);
% Damage impacts (DS 2).
subplot(235);
contourf(M.D.D2.lon,M.D.D2.lat,real(log10(Ed2/M.D.T2)),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Equivalent Risk Map (DS 2)');
h = colorbar(); ylabel(h, 'log_{10} [Damaged Household Count]');
colormap(gca,R_colormap('damage')); %caxis([-2 2]);
xlim(XL); ylim(YL);
% LPR.
subplot(236);
contourf(M.R.R1.lon,M.R.R1.lat,real(log10(Er1/M.R.T1)),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Equivalent Risk Map (LPR)');
h = colorbar(); ylabel(h, 'log_{10} [LPR, Probability of Fatality]');
colormap(gca,R_colormap('LPR')); %caxis([-6 -3]);
xlim(XL); ylim(YL);

% Plot equivalent-risk maps.
figure(517); clf;
n=round(sqrt(length(En4(~isnan(En4)))));
% Nuisance impacts (CDI 2).
subplot(231);
histogram(log10(En2/M.N.T2),n); hold on;
xlabel('Tolerance Normalized Risk log_{10} [Impacted Household Count]'); ylabel('Latitude'); title('Spatial Risks (CDI 2)');
% Nuisance impacts (CDI 3).
subplot(232);
histogram(log10(En3/M.N.T3),n); hold on;
xlabel('Tolerance Normalized Risk log_{10} [Impacted Household Count]'); ylabel('Latitude'); title('Spatial Risks (CDI 3)');
% Nuisance impacts (CDI 4).
subplot(233);
histogram(log10(En4/M.N.T4),n); hold on;
xlabel('Tolerance Normalized Risk log_{10} [Impacted Household Count]'); ylabel('Latitude'); title('Spatial Risks (CDI 4)');
% Damage impacts (DS 1).
subplot(234);
histogram(real(log10(Ed1/183)),n); hold on;
xlabel('Tolerance Normalized Risk log_{10} [Damaged Household Count]'); ylabel('Latitude'); title('Spatial Risks (DS 1)');
% Damage impacts (DS 2).
subplot(235);
histogram(real(log10(Ed2/0.4)),n); hold on;
xlabel('Tolerance Normalized Risk log_{10} [Damaged Household Count]'); ylabel('Latitude'); title('Spatial Risks (DS 2)');
% LPR.
subplot(236);
histogram(real(log10(Er1/M.R.T1)),n); hold on;
xlabel('Tolerance Normalized Risk log_{10} [LPR, Probability of Fatality]'); ylabel('Latitude'); title('Spatial Risks (LPR)');




