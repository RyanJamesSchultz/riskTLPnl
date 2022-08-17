clear;

% Load in the blank dataset.
load('TLP_nl.mat','S');
%load('Rmap_temp.mat','S');

% Get boundaries of play area.
YL=[min(S.MAP.latB)-0.1 max(S.MAP.latB)+0.1];
XL=[min(S.MAP.lonB)-0.1 max(S.MAP.lonB)+0.1];

% Get lengths of map edges.
Nx=length(S.MAP.lonG);
Ny=length(S.MAP.latG);
latG=repmat(S.MAP.latG',1,Nx); latG=latG(:);
lonG=repmat(S.MAP.lonG,Ny,1); lonG=lonG(:);
I=(latG>=min(YL))&(latG<=max(YL))&(lonG>=min(XL))&(lonG<=max(XL));

% Plot.
figure(3); clf;
% The isothermal depth map.
subplot(131);
contourf(S.MAP.lonE,S.MAP.latE,S.MAP.DEP,'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Isotherm Depth');
h = colorbar(); colormap(gca,R_colormap('Depth')); ylabel(h, 'True Vertical Depth (km)'); hold off;
xlim(XL); ylim(YL);
% The Vs30 map.
subplot(132);
contourf(S.MAP.lonG,S.MAP.latG,S.MAP.Vs30,'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Site Amplification');
h = colorbar(); colormap(gca,R_colormap('Vs30')); ylabel(h, 'Site Amplififcation, Vs30 (m/s)'); hold off;
xlim(XL); ylim(YL);
% The population density map.
subplot(133);
contourf(S.MAP.lonG,S.MAP.latG,log10(S.MAP.POP),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-w');
set(gca,'Color','k');
xlabel('Longitude'); ylabel('Latitude'); title(['Population (',sprintf('%0.3g',sum(sum(S.MAP.POP(I)))),')']);
h = colorbar(); colormap(gca,R_colormap('population')); ylabel(h, 'Population (log_{10}[people])'); hold off;
xlim(XL); ylim(YL);
