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

% Plot the red-light difference maps (selected tolerances).
figure(516); clf;
% DS 1.
subplot(221);
contourf(M.D.D1.lon,M.D.D1.lat,M.D.D1.Mr-M.D.Mcomb,linspace(-0.4,+0.4,35),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Iso-Damage Residual Map DS1-combination');
h = colorbar(); ylabel(h, 'Magnitude Difference (M_L)');
colormap(gca,redblue(35)); caxis([-0.4 +0.4]);
xlim(XL); ylim(YL);
subplot(223);
v=M.D.D1.Mr-M.D.Mcomb; v(v==0)=NaN;
histogram(v,round(sqrt(length(v))));
xlabel('Red-Light Magnitude Difference (M_L)'); ylabel('Counts');
xlim([0 +0.4]);
% DS 2.
subplot(222);
contourf(M.D.D2.lon,M.D.D2.lat,M.D.D2.Mr-M.D.Mcomb,linspace(-0.4,+0.4,35),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-k');
xlabel('Longitude'); ylabel('Latitude'); title('Iso-Damage Residual Map DS2-combination');
h = colorbar(); ylabel(h, 'Magnitude Difference (M_L)');
colormap(gca,redblue(35)); caxis([-0.4 +0.4]);
xlim(XL); ylim(YL);
subplot(224);
v=M.D.D2.Mr-M.D.Mcomb; v(v==0)=NaN;
histogram(v,round(sqrt(length(v))));
xlabel('Red-Light Magnitude Difference (M_L)'); ylabel('Counts');
xlim([0 +0.4]);

