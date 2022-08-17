clear;

% Predefine a structure.
R=struct('M',[],'lat',[],'lon',[],'dep',[],'dGM',[],'year',[],'name',[],'Ss',[]);

% Populate the structure with relevant information on each earthquake scenario.
R(1).M=3.6; R(1).lat=53.345; R(1).lon=6.672; R(1).dep=3.0; R(1).dGM=+0.4; R(1).year=2012; R(1).name='Huizinge 2012-08-16';
R(2).M=3.4; R(2).lat=52.832; R(2).lon=7.038; R(2).dep=2.0; R(2).dGM=-0.4; R(2).year=1997; R(2).name='Roswinkel 1997-02-19';
%M=3.3; lat=52.833; lon=7.053; dep=2.0; % Roswinkel 1998-07-14.
%M=3.2; lat=52.832; lon=7.052; dep=2.3; % Roswinkel 2000-10-25.
%M=3.5; lat=53.350; lon=6.697; dep=3.0; % Westeremden 2006-08-08.
%M=3.2; lat=53.337; lon=6.720; dep=3.0; % Loppersum 2008-10-30.
%M=3.0; lat=53.354; lon=6.762; dep=3.0; % Zeerijp 2009-05-08.
%M=3.2; lat=53.303; lon=6.787; dep=3.0; % Garrelsweer 2011-06-27.
Yls=2018;
Np=1000;
Nn2_f=10.^4.75;
Nn3_f=10.^4.50;
Nn4_f=10.^4.25;
p=10;

% Load in the data structure: S.
load('blanks/TLP_nl.mat');

% Perturb data structure and compute risk curves for a scenario.
for i=1:length(R)
    tic; Ss=runRISKscenario(S,R(i).lat,R(i).lon,R(i).dep,R(i).M,R(i).dGM,Np,R(i).year,Yls); toc;
    R(i).Ss=Ss;
end

% Make the nuisance tolerance distributions.
n2=[R(1).Ss.RISK.Nn2(R(1).Ss.RISK.Nn2<=Nn2_f); R(2).Ss.RISK.Nn2(R(2).Ss.RISK.Nn2>=Nn2_f)];
n3=[R(1).Ss.RISK.Nn3(R(1).Ss.RISK.Nn3<=Nn3_f); R(2).Ss.RISK.Nn3(R(2).Ss.RISK.Nn3>=Nn3_f)];
n4=[R(1).Ss.RISK.Nn4(R(1).Ss.RISK.Nn4<=Nn4_f); R(2).Ss.RISK.Nn4(R(2).Ss.RISK.Nn4>=Nn4_f)];

n2t=prctile(n2,p);
n3t=prctile(n3,p);
n4t=prctile(n4,p);

d1t=mean([prctile(R(1).Ss.RISK.Nd1,p) prctile(R(1).Ss.RISK.Nd1,p)]);
d2t=mean([prctile(R(1).Ss.RISK.Nd2,p) prctile(R(1).Ss.RISK.Nd2,p)]);

%%
px=1;

n2tx=prctile(n2,px);
n3tx=prctile(n3,px);
n4tx=prctile(n4,px);

d1tx=mean([prctile(R(1).Ss.RISK.Nd1,px) prctile(R(1).Ss.RISK.Nd1,px)]);
d2tx=mean([prctile(R(1).Ss.RISK.Nd2,px) prctile(R(1).Ss.RISK.Nd2,px)]);

% Plot the risk impacts for the EQ scenarios.
figure(7); clf;
% CDI 2.
subplot(231);
for i=1:length(R)
    histogram(log10(R(i).Ss.RISK.Nn2),round(2*sqrt(Np)),'DisplayName',R(i).name); hold on;
end
h=plot(log10(n2t)*[1 1],ylim,'--k');
h.Annotation.LegendInformation.IconDisplayStyle = 'off';
h=plot(log10(n2tx)*[1 1],ylim,':k');
h.Annotation.LegendInformation.IconDisplayStyle = 'off';
xlabel('log_{10} Nuisance Impacts (CDI 2)'); ylabel('Counts');
legend();
% CDI 3.
subplot(232);
for i=1:length(R)
    histogram(log10(R(i).Ss.RISK.Nn3),round(2*sqrt(Np)),'DisplayName',R(i).name); hold on;
end
h=plot(log10(n3t)*[1 1],ylim,'--k');
h.Annotation.LegendInformation.IconDisplayStyle = 'off';
h=plot(log10(n3tx)*[1 1],ylim,':k');
h.Annotation.LegendInformation.IconDisplayStyle = 'off';
xlabel('log_{10} Nuisance Impacts (CDI 3)'); ylabel('Counts');
legend();
% CDI 4.
subplot(233);
for i=1:length(R)
    histogram(log10(R(i).Ss.RISK.Nn4),round(2*sqrt(Np)),'DisplayName',R(i).name); hold on;
end
h=plot(log10(n4t)*[1 1],ylim,'--k');
h.Annotation.LegendInformation.IconDisplayStyle = 'off';
h=plot(log10(n4tx)*[1 1],ylim,':k');
h.Annotation.LegendInformation.IconDisplayStyle = 'off';
xlabel('log_{10} Nuisance Impacts (CDI 4)'); ylabel('Counts');
legend();
% DS 1.
subplot(234);
for i=1:length(R)
    histogram(log10(R(i).Ss.RISK.Nd1),round(2*sqrt(Np)),'DisplayName',R(i).name); hold on;
end
h=plot(log10(d1t)*[1 1],ylim,'--k');
h.Annotation.LegendInformation.IconDisplayStyle = 'off';
h=plot(log10(d1tx)*[1 1],ylim,':k');
h.Annotation.LegendInformation.IconDisplayStyle = 'off';
xlabel('log_{10} Damage Impacts (DS 1)'); ylabel('Counts');
legend();
% DS 2.
subplot(235);
for i=1:length(R)
    histogram(log10(R(i).Ss.RISK.Nd2),round(2*sqrt(Np)),'DisplayName',R(i).name); hold on;
end
h=plot(log10(d2t)*[1 1],ylim,'--k');
h.Annotation.LegendInformation.IconDisplayStyle = 'off';
h=plot(log10(d2tx)*[1 1],ylim,':k');
h.Annotation.LegendInformation.IconDisplayStyle = 'off';
xlabel('log_{10} Damage Impacts (DS 2)'); ylabel('Counts');
legend();
% LPR.
subplot(236);
for i=1:length(R)
    histogram(log10(R(i).Ss.RISK.Pf1),round(2*sqrt(Np)),'DisplayName',R(i).name); hold on;
end
xlabel('log_{10} LPR (Probability)'); ylabel('Counts');
legend();


