clear;

% Load in the data structure: S.
load('TLP_nl.mat');

% Predefine some variables.
GREY=[0.85,0.85,0.85];
lat=[51.930 52.367 53.240 52.804]; % Rotterdam, Amsterdam, Groningen, IJsselmeer.
lon=[ 4.480  4.890  6.883  5.336];
[~,m]=min(Geoid_Distance(lat(1),lon(1),[S.RISK.lat],[S.RISK.lon],'spherical'));
[~,i]=min(Geoid_Distance(lat(2),lon(2),[S.RISK.lat],[S.RISK.lon],'spherical'));
[~,j]=min(Geoid_Distance(lat(3),lon(3),[S.RISK.lat],[S.RISK.lon],'spherical'));
[~,k]=min(Geoid_Distance(lat(4),lon(4),[S.RISK.lat],[S.RISK.lon],'spherical'));
Nv=length(S.dVAR.b);
yld=[7e-2 7e+5];
yln=[7e+2 7e+6];
ylf=[1e-7 1e0];
ML_c=[1.0 4.0];
ML_f=3.0;

% Risk tolerances.
Nn2_f=3.3556e+04;
Nn3_f=1.9844e+04;
Nn4_f=1.1077e+04;
Nd1_f=183;
Nd2_f=0.4;
Pf1_f=1e-6;

% Get boundaries of play area.
YL=[min(S.MAP.latB)-0.1 max(S.MAP.latB)+0.1];
XL=[min(S.MAP.lonB)-0.1 max(S.MAP.lonB)+0.1];

% Plot some of the count curves.
figure(5); clf;
% Pop map & locaitons.
subplot(2,5,[1 2 6 7]);
contourf(S.MAP.lonG,S.MAP.latG,log10(S.MAP.POP),'LineColor','none'); hold on;
plot(S.MAP.lonB,S.MAP.latB,'-w');
plot(S.RISK(m).lon,S.RISK(m).lat,'wo','MarkerFaceColor','k');
plot(S.RISK(i).lon,S.RISK(i).lat,'wo','MarkerFaceColor','k');
plot(S.RISK(j).lon,S.RISK(j).lat,'wo','MarkerFaceColor','k');
plot(S.RISK(k).lon,S.RISK(k).lat,'wo','MarkerFaceColor','k');
set(gca,'Color','k');
xlabel('Longitude'); ylabel('Latitude'); title(['Population (',sprintf('%0.3g',sum(sum(S.MAP.POP))),')']);
h = colorbar(); colormap(gca,R_colormap('population')); ylabel(h, 'Population (log_{10}[people])'); hold off;
xlim(XL); ylim(YL);
% CDI 2.
subplot(2,5,3);
%semilogy(S.Mw,S.RISK(i).Nn2,'-','color',GREY); hold on;
%semilogy(S.Mw,mean(S.RISK(i).Nn2,1),'-r');
semilogy(S.Mw,median(S.RISK(m).Nn2,1),'-'); hold on;
semilogy(S.Mw,median(S.RISK(i).Nn2,1),'-');
semilogy(S.Mw,median(S.RISK(j).Nn2,1),'-');
semilogy(S.Mw,median(S.RISK(k).Nn2,1),'-');
line(xlim(),Nn2_f*[1 1],'Color','k','LineStyle','--');
line(ML_f*[1 1],ylim(), 'Color','k','LineStyle','--');
xlabel('Red-Light Magnitdue (M_L)'); ylabel('Impacted Household Count'); title('Nuisance: CDI 2');
ylim(yln); xlim(ML_c);
% CDI 3.
subplot(2,5,4);
%semilogy(S.Mw,S.RISK(i).Nn3,'-','color',GREY); hold on;
%semilogy(S.Mw,mean(S.RISK(i).Nn3,1),'-r');
semilogy(S.Mw,median(S.RISK(m).Nn3,1),'-'); hold on;
semilogy(S.Mw,median(S.RISK(i).Nn3,1),'-');
semilogy(S.Mw,median(S.RISK(j).Nn3,1),'-');
semilogy(S.Mw,median(S.RISK(k).Nn3,1),'-');
line(xlim(),Nn3_f*[1 1],'Color','k','LineStyle','--');
line(ML_f*[1 1],ylim(), 'Color','k','LineStyle','--');
xlabel('Red-Light Magnitdue (M_L)'); ylabel('Impacted Household Count'); title('Nuisance: CDI 3');
ylim(yln); xlim(ML_c);
% CDI 4.
subplot(2,5,5);
%semilogy(S.Mw,S.RISK(i).Nn4,'-','color',GREY); hold on;
%semilogy(S.Mw,mean(S.RISK(i).Nn4,1),'-r');
semilogy(S.Mw,median(S.RISK(m).Nn4,1),'-'); hold on;
semilogy(S.Mw,median(S.RISK(i).Nn4,1),'-');
semilogy(S.Mw,median(S.RISK(j).Nn4,1),'-');
semilogy(S.Mw,median(S.RISK(k).Nn4,1),'-');
line(xlim(),Nn4_f*[1 1],'Color','k','LineStyle','--');
line(ML_f*[1 1],ylim(), 'Color','k','LineStyle','--');
xlabel('Red-Light Magnitdue (M_L)'); ylabel('Impacted Household Count'); title('Nuisance: CDI 4');
ylim(yln); xlim(ML_c);
% DS 1.
subplot(2,5,8);
%semilogy(S.Mw,S.RISK(i).Nd1,'-','color',GREY); hold on;
%semilogy(S.Mw,mean(S.RISK(i).Nd1,1),'-r');
semilogy(S.Mw,median(S.RISK(m).Nd1,1),'-'); hold on;
semilogy(S.Mw,median(S.RISK(i).Nd1,1),'-');
semilogy(S.Mw,median(S.RISK(j).Nd1,1),'-');
semilogy(S.Mw,median(S.RISK(k).Nd1,1),'-');
line(xlim(),Nd1_f*[1 1],'Color','k','LineStyle','--');
line(ML_f*[1 1],ylim(), 'Color','k','LineStyle','--');
xlabel('Red-Light Magnitdue (M_L)'); ylabel('Damaged Household Count'); title('Damage: DS 1');
ylim(yld); xlim(ML_c);
% DS 2.
subplot(2,5,9);
%semilogy(S.Mw,S.RISK(i).Nd2,'-','color',GREY); hold on;
%semilogy(S.Mw,mean(S.RISK(i).Nd2,1),'-r');
semilogy(S.Mw,median(S.RISK(m).Nd2,1),'-'); hold on;
semilogy(S.Mw,median(S.RISK(i).Nd2,1),'-');
semilogy(S.Mw,median(S.RISK(j).Nd2,1),'-');
semilogy(S.Mw,median(S.RISK(k).Nd2,1),'-');
line(xlim(),Nd2_f*[1 1],'Color','k','LineStyle','--');
line(ML_f*[1 1],ylim(), 'Color','k','LineStyle','--');
xlabel('Red-Light Magnitdue (M_L)'); ylabel('Damaged Household Count'); title('Damage: DS 2');
ylim(yld); xlim(ML_c);
% LPR.
subplot(2,5,10);
%semilogy(S.Mw,S.RISK(i).Pf1,'-','color',GREY); hold on;
%semilogy(S.Mw,mean(S.RISK(i).Pf1,1),'-r');
semilogy(S.Mw,median(S.RISK(m).Pf1,1),'-'); hold on;
semilogy(S.Mw,median(S.RISK(i).Pf1,1),'-');
semilogy(S.Mw,median(S.RISK(j).Pf1,1),'-');
semilogy(S.Mw,median(S.RISK(k).Pf1,1),'-');
line(xlim(),Pf1_f*[1 1],'Color','k','LineStyle','--');
line(ML_f*[1 1],ylim(), 'Color','k','LineStyle','--');
xlabel('Red-Light Magnitdue (M_L)'); ylabel('Probability of Fatality'); title('LPR: Fatality');
ylim(ylf); xlim(ML_c);


% subplot(4,5,[7 10]);
% semilogy(S.Mw,median(S.RISK(i).Nn2,1),'DisplayName','CDI 2'); hold on;
% semilogy(S.Mw,median(S.RISK(i).Nn3,1),'DisplayName','CDI 3');
% semilogy(S.Mw,median(S.RISK(i).Nn4,1),'DisplayName','CDI 4');
% semilogy(S.Mw,median(S.RISK(i).Nn5,1),'DisplayName','CDI 5');
% semilogy(S.Mw,median(S.RISK(i).Nn6,1),'DisplayName','CDI 6');
% h=line(xlim(),Nn3_f*[1 1],'Color',GREY,'LineStyle','--'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
% h=line(ML_f*[1 1],ylim(), 'Color',GREY,'LineStyle','--'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
% xlabel('Red-Light Magnitdue (M_L)'); ylabel('Number of Households Impacted'); title('Nuisance'); legend('Location','southeast');
% xlim(ML_c); %ylim(yl);
% subplot(4,5,[8 11]);
% semilogy(S.Mw,median(S.RISK(i).Nd1,1),'DisplayName','DS 1'); hold on;
% semilogy(S.Mw,median(S.RISK(i).Nd2,1),'DisplayName','DS 2');
% h=line(xlim(),Nd1_f*[1 1],'Color',GREY,'LineStyle','--'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
% h=line(ML_f*[1 1],ylim(), 'Color',GREY,'LineStyle','--'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
% xlabel('Red-Light Magnitdue (M_L)'); ylabel('Number of Households Impacted'); title('Damage'); legend('Location','southeast');
% xlim(ML_c); %ylim(yl);
% subplot(4,5,[9 12]);
% semilogy(S.Mw,median(S.RISK(i).Pf1,1),'DisplayName','LPR'); hold on;
% h=line(xlim(),Pf1_f*[1 1],'Color',GREY,'LineStyle','--'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
% h=line(ML_f*[1 1],ylim(), 'Color',GREY,'LineStyle','--'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
% xlabel('Red-Light Magnitdue (M_L)'); ylabel('Probability of Loss of Life'); title('LPR');
% ylim([1e-7 1e0]); xlim(ML_c);
