clear;

% Load in the data structures: M & S.
%load('TLPmap_nl.mat');
%load('TLP_nl.mat');

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
Np=400;
Nn3_f=10.^4.50;
Nn3_t=1.9844e+04;

% Load in the data structure: S.
load('blanks/TLP_nl.mat');

% Perturb data structure and compute risk curves for a scenario.
for i=1:length(R)
    tic; Ss=runRISKscenario(S,R(i).lat,R(i).lon,R(i).dep,R(i).M,R(i).dGM,Np,R(i).year,Yls); toc;
    R(i).Ss=Ss;
end

% Make the nuisance tolerance distributions.
n3=[R(1).Ss.RISK.Nn3(R(1).Ss.RISK.Nn3<=Nn3_f); R(2).Ss.RISK.Nn3(R(2).Ss.RISK.Nn3>=Nn3_f)];

%%

% Plot.
figure(12); clf;
% Nuisance tolerance.
subplot(133);
boxplot(n3); hold on;
set(gca, 'YScale', 'log');
ylim(10.^[0 6]); xlim([0 6]);
plot(xlim,Nn3_t*[1 1],':k');
ylabel('Number of Households Impacted by Nuisance'); xlabel('Location');

