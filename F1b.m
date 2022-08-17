clear;

% Load in the data structure: S.
load('TLP_nl.mat');

% Load in all of the facies boundaries data.
F=loadFACIES();

% Get boundaries of play area.
YL=[min(S.MAP.latB)-0.1 max(S.MAP.latB)+0.1];
XL=[min(S.MAP.lonB)-0.1 max(S.MAP.lonB)+0.1];

% Plot iso-magnitude maps.
figure(1); clf;
% Nuisance impacts.
subplot(122);
%contourf(M.N.N3.lon,M.N.N3.lat,log10(M.N.N3.Nn),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k'); hold on;
for i=1:length(F)
    plot(F(i).lon,F(i).lat,'-k');
end
xlabel('Longitude'); ylabel('Latitude');
xlim(XL); ylim(YL);