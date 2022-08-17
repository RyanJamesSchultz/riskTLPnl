clear;

% Load in the data structures.
load('blanks/TLP_nl-highres.mat');

% Event locations.
i=1;
R(i).M=3.6; R(i).lat=53.345; R(i).lon=6.672; R(i).dep=3.0; R(i).dGM=+0.58; R(i).year=2012; R(i).name='Huizinge 2012-08-16'; i=i+1;
R(i).M=3.4; R(i).lat=52.832; R(i).lon=7.038; R(i).dep=2.0; R(i).dGM=-0.26; R(i).year=1997; R(i).name='Roswinkel 1997-02-19'; i=i+1;
R(i).M=3.3; R(i).lat=52.833; R(i).lon=7.053; R(i).dep=2.0; R(i).dGM=-0.09; R(i).year=1998; R(i).name='Roswinkel 1998-07-14'; i=i+1;
%R(i).M=3.2; R(i).lat=52.832; R(i).lon=7.052; R(i).dep=2.3; R(i).dGM=-1.55; R(i).year=2000; R(i).name='Roswinkel 2000-10-25'; i=i+1;
%R(i).M=3.5; R(i).lat=53.350; R(i).lon=6.697; R(i).dep=3.0; R(i).dGM=-0.11; R(i).year=2006; R(i).name='Westeremden 2006-08-08'; i=i+1;
%R(i).M=3.2; R(i).lat=53.337; R(i).lon=6.720; R(i).dep=3.0; R(i).dGM=-0.08; R(i).year=2008; R(i).name='Loppersum 2008-10-30'; i=i+1;
%R(i).M=3.0; R(i).lat=53.354; R(i).lon=6.762; R(i).dep=3.0; R(i).dGM=-0.84; R(i).year=2009; R(i).name='Zeerijp 2009-05-08'; i=i+1;
%R(i).M=3.2; R(i).lat=53.303; R(i).lon=6.787; R(i).dep=3.0; R(i).dGM=+0.86; R(i).year=2011; R(i).name='Garrelsweer 2011-06-27'; i=i+1;
%R(i).M=3.2; R(i).lat=53.389; R(i).lon=6.667; R(i).dep=3.0; R(i).dGM=-0.43; R(i).year=2013; R(i).name='Zandeweer 2013-02-07'; i=i+1;
%R(i).M=3.0; R(i).lat=53.294; R(i).lon=6.785; R(i).dep=3.0; R(i).dGM=+0.41; R(i).year=2013; R(i).name='Garrelsweer 2013-07-02'; i=i+1;
%R(i).M=3.0; R(i).lat=53.357; R(i).lon=6.782; R(i).dep=3.0; R(i).dGM=+0.62; R(i).year=2014; R(i).name='''t Zandt 2014-02-13'; i=i+1;
%R(i).M=3.1; R(i).lat=53.234; R(i).lon=6.834; R(i).dep=3.0; R(i).dGM=-1.42; R(i).year=2015; R(i).name='Hellum 2015-09-30'; i=i+1;
%R(i).M=3.4; R(i).lat=53.363; R(i).lon=6.751; R(i).dep=3.0; R(i).dGM=-1.13; R(i).year=2018; R(i).name='Zeerijp 2018-01-08'; i=i+1;
%R(i).M=3.4; R(i).lat=53.328; R(i).lon=6.652; R(i).dep=3.0; R(i).dGM=-1.86; R(i).year=2019; R(i).name='Westerwijtwerd 2019-05-22'; i=i+1;
%R(i).M=3.2; R(i).lat=53.309; R(i).lon=6.751; R(i).dep=3.0; R(i).dGM=-1.39; R(i).year=2021; R(i).name='Garrelsweer 2021-11-16'; i=i+1;
Yls=2018;

% Get the population information and more.
POP=S.MAP.POP(:);
Nx=length(S.MAP.lonG);
Ny=length(S.MAP.latG);
latG=repmat(S.MAP.latG',1,Nx); latG=latG(:);
lonG=repmat(S.MAP.lonG,Ny,1); lonG=lonG(:);

% Loop over each event.
for i=1:length(R)
    
    % Get distances.
    R(i).Re=Geoid_Distance(R(i).lat,R(i).lon,latG,lonG,'elliptical')*6371*pi()/180;
    
    % Sort ascending.
    [~,I]=sort(R(i).Re);
    R(i).I=I;
end

% Plot.
figure(510); clf;
semilogx(R(1).Re(R(1).I),log10(cumsum(POP(R(1).I))),'-','DisplayName',R(1).name); hold on;
for i=2:length(R)
    semilogx(R(i).Re(R(i).I),log10(cumsum(POP(R(i).I))),'-','DisplayName',R(i).name);
end
xlabel('Epicentral Distance (km)'); ylabel('log_{10} Cumulative Population');
legend('Location','southeast');
grid on;
