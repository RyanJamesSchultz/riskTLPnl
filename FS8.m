clear;

% Predefine a structure.
R=struct('M',[],'lat',[],'lon',[],'dep',[],'dGM',[],'year',[],'name',[],'Ss',[]);

% Populate the structure with relevant information on each earthquake scenario.
i=1;
R(i).M=3.6; R(i).lat=53.345; R(i).lon=6.672; R(i).dep=3.0; R(i).dGM=+0.58; R(i).year=2012; R(i).name='Huizinge 2012-08-16'; i=i+1;
%%%
R(i).M=3.4; R(i).lat=52.832; R(i).lon=7.038; R(i).dep=2.0; R(i).dGM=-0.26; R(i).year=1997; R(i).name='Roswinkel 1997-02-19'; i=i+1;
R(i).M=3.3; R(i).lat=52.833; R(i).lon=7.053; R(i).dep=2.0; R(i).dGM=-0.09; R(i).year=1998; R(i).name='Roswinkel 1998-07-14'; i=i+1;
R(i).M=3.2; R(i).lat=52.832; R(i).lon=7.052; R(i).dep=2.3; R(i).dGM=-1.55; R(i).year=2000; R(i).name='Roswinkel 2000-10-25'; i=i+1;
R(i).M=3.5; R(i).lat=53.350; R(i).lon=6.697; R(i).dep=3.0; R(i).dGM=-0.11; R(i).year=2006; R(i).name='Westeremden 2006-08-08'; i=i+1;
R(i).M=3.2; R(i).lat=53.337; R(i).lon=6.720; R(i).dep=3.0; R(i).dGM=-0.08; R(i).year=2008; R(i).name='Loppersum 2008-10-30'; i=i+1;
R(i).M=3.0; R(i).lat=53.354; R(i).lon=6.762; R(i).dep=3.0; R(i).dGM=-0.84; R(i).year=2009; R(i).name='Zeerijp 2009-05-08'; i=i+1;
R(i).M=3.2; R(i).lat=53.303; R(i).lon=6.787; R(i).dep=3.0; R(i).dGM=+0.86; R(i).year=2011; R(i).name='Garrelsweer 2011-06-27'; i=i+1;
%%%
%R(i).M=3.2; R(i).lat=53.389; R(i).lon=6.667; R(i).dep=3.0; R(i).dGM=-0.43; R(i).year=2013; R(i).name='Zandeweer 2013-02-07'; i=i+1;
%R(i).M=3.0; R(i).lat=53.294; R(i).lon=6.785; R(i).dep=3.0; R(i).dGM=+0.41; R(i).year=2013; R(i).name='Garrelsweer 2013-07-02'; i=i+1;
%R(i).M=3.0; R(i).lat=53.357; R(i).lon=6.782; R(i).dep=3.0; R(i).dGM=+0.62; R(i).year=2014; R(i).name='''t Zandt 2014-02-13'; i=i+1;
%R(i).M=3.1; R(i).lat=53.234; R(i).lon=6.834; R(i).dep=3.0; R(i).dGM=-1.42; R(i).year=2015; R(i).name='Hellum 2015-09-30'; i=i+1;
%R(i).M=3.4; R(i).lat=53.363; R(i).lon=6.751; R(i).dep=3.0; R(i).dGM=-1.13; R(i).year=2018; R(i).name='Zeerijp 2018-01-08'; i=i+1;
%R(i).M=3.4; R(i).lat=53.328; R(i).lon=6.652; R(i).dep=3.0; R(i).dGM=-1.86; R(i).year=2019; R(i).name='Westerwijtwerd 2019-05-22'; i=i+1;
%R(i).M=3.2; R(i).lat=53.309; R(i).lon=6.751; R(i).dep=3.0; R(i).dGM=-1.39; R(i).year=2021; R(i).name='Garrelsweer 2021-11-16'; i=i+1;
Yls=2018;
Np=1000;
Nn2_f=3.3556e+04;
Nn3_f=1.9844e+04;
Nn4_f=1.1077e+04;
Nd1a_f=183;
Nd1b_f=1;
Nd2a_f=0.4;
Nd2b_f=1e-04;
Pf1a_f=1e-6;
Pf1b_f=1e-5;
Pf1c_f=1e-4;

% Huzinge-2012 > Garrelsweer-2011 & Westeremden-2006 > Roswinkel-1997 > Roswinkel-1998 & Loppersum-2008 > Zeerijp-2009 & Roswinkel-2000.

% Load in the data structure: S.
load('blanks/TLP_nl.mat');

% Perturb data structure and compute risk curves for a scenario.
for i=1:length(R)
    tic; Ss=runRISKscenario(S,R(i).lat,R(i).lon,R(i).dep,R(i).M,R(i).dGM,Np,R(i).year,Yls); toc;
    R(i).Ss=Ss;
end

%%

% Plot the risk impacts for the EQ scenarios.
figure(58); clf;
% CDI 2.
subplot(231);
for i=1:length(R)
    histogram(log10(R(i).Ss.RISK.Nn2),round(2*sqrt(Np)),'DisplayName',R(i).name); hold on;
end
h=plot(log10(Nn2_f)*[1 1],ylim,'--k'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
xlabel('log_{10} Nuisance Impacts (CDI 2)'); ylabel('Counts');
legend();
% CDI 3.
subplot(232);
for i=1:length(R)
    histogram(log10(R(i).Ss.RISK.Nn3),round(2*sqrt(Np)),'DisplayName',R(i).name); hold on;
end
h=plot(log10(Nn3_f)*[1 1],ylim,'--k'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
xlabel('log_{10} Nuisance Impacts (CDI 3)'); ylabel('Counts');
legend();
% CDI 4.
subplot(233);
for i=1:length(R)
    histogram(log10(R(i).Ss.RISK.Nn4),round(2*sqrt(Np)),'DisplayName',R(i).name); hold on;
end
h=plot(log10(Nn4_f)*[1 1],ylim,'--k'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
xlabel('log_{10} Nuisance Impacts (CDI 4)'); ylabel('Counts');
legend();
% DS 1.
subplot(234);
for i=1:length(R)
    histogram(log10(R(i).Ss.RISK.Nd1),round(2*sqrt(Np)),'DisplayName',R(i).name); hold on;
end
h=plot(log10(Nd1a_f)*[1 1],ylim,'--k'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
h=plot(log10(Nd1b_f)*[1 1],ylim,'--k'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
xlabel('log_{10} Damage Impacts (DS 1)'); ylabel('Counts');
legend();
% DS 2.
subplot(235);
for i=1:length(R)
    histogram(log10(R(i).Ss.RISK.Nd2),round(2*sqrt(Np)),'DisplayName',R(i).name); hold on;
end
h=plot(log10(Nd2a_f)*[1 1],ylim,'--k'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
h=plot(log10(Nd2b_f)*[1 1],ylim,'--k'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
xlabel('log_{10} Damage Impacts (DS 2)'); ylabel('Counts');
legend();
% LPR.
subplot(236);
for i=1:length(R)
    histogram(log10(R(i).Ss.RISK.Pf1),round(2*sqrt(Np)),'DisplayName',R(i).name); hold on;
end
h=plot(log10(Pf1a_f)*[1 1],ylim,'--k'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
h=plot(log10(Pf1b_f)*[1 1],ylim,'--k'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
h=plot(log10(Pf1c_f)*[1 1],ylim,'--k'); h.Annotation.LegendInformation.IconDisplayStyle = 'off';
xlabel('log_{10} LPR (Probability)'); ylabel('Counts');
legend();


