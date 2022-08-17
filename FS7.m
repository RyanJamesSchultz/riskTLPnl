clear;

% Predefine.
Y=1990:2020;
ya=2018;
[Rn,Rg]=POPvT(Y,ya);
Ylim=[0.8 1.2];

% Plot.
figure(57); clf;
plot(Y,Rn,'-o','DisplayName','Netherlands'); hold on;
plot(Y,Rg,'-o','DisplayName','Groningen');
ylim
xlabel('Year'); ylabel('Normalized Population');
legend('Location','northwest');
h=plot(ya*[1 1],Ylim,'--k');
h.Annotation.LegendInformation.IconDisplayStyle = 'off';
ylim
% Load in the Netherlands population dataset.
data=load('/Users/rjs10/Desktop/TLPnl/data/POPvT/Netherlands.csv');
Yn=data(:,1);
Pn=mean(data(:,2:3)')';

% Load in the Groningen population dataset.
data=load('/Users/rjs10/Desktop/TLPnl/data/POPvT/Groningen.csv');
Yg=data(:,1);
Pg=data(:,2);

% Output populations in 2018.
interp1(Yn,Pn,ya,'linear')
interp1(Yg,Pg,ya,'linear')