clear;

% Input variables.
m=0:0.01:7.0;
R=5;
dep=3;
vs30=225;
dE=0;
Msa=3.5;
T=10.^(-2:0.1:1)';
gm_v=10.^(-4.0:0.2:2.0);
gm_a=0.00:0.01:1.00;
N=100;
GREY=[0.85,0.85,0.85];

% Compute GM vs M.
pgv=GMPE(R,m,dep,vs30,dE,-1,'bg21'); % cm/s.
pga=PGV2PGA(pgv)/980.665; % g.

% Compute AvgSA vs M.
for i=1:length(pga)
    Mi=max(m(i),Msa);
    %Mi=m(i);
    if(m(i)<=5.4)
        pgai=pga(i);
    else
        pgai=max(pga);
    end
    
    psa=PGA2PSA(pgai,Mi,R,vs30,T);
    SAavg(i)=AvgSA(T,psa,0.2,'NL');
end
Pm=VULNfxn_fatality(SAavg,0)*0.95;
Pu=VULNfxn_fatality(SAavg,+2)*0.95;
Pd=VULNfxn_fatality(SAavg,-2)*0.95;

% Plot.
figure(56); clf;

% Nuisance vs PGV.
subplot(231);
semilogx(gm_v,NUISfxn(gm_v,[0 0],2),'-b'); hold on;
for i=1:N
    semilogx(gm_v,NUISfxn(gm_v,normrnd(0,1,[1 2]),2),'-','Color',GREY);
end
semilogx(gm_v,NUISfxn(gm_v,[0 0],3),'-r');
for i=1:N
    semilogx(gm_v,NUISfxn(gm_v,normrnd(0,1,[1 2]),3),'-','Color',GREY);
end
semilogx(gm_v,NUISfxn(gm_v,[0 0],4),'-y');
for i=1:N
    semilogx(gm_v,NUISfxn(gm_v,normrnd(0,1,[1 2]),4),'-','Color',GREY);
end
xlabel('PGV (m/s)'); ylabel('Nuisance Risk, Probability of Felt Ground Motion');
ylim([0 1]); xlim(10.^[-4 1]);

% Damage vs PGV.
subplot(232);
semilogx(gm_v,FRAGfxn_cosmetic(gm_v*1000,0,1),'-k'); hold on;
for i=1:N
    semilogx(gm_v,FRAGfxn_cosmetic(gm_v*1000,abs(normrnd(0.0,0.15,[1 1])),1),'-','Color',GREY);
end
semilogx(gm_v,FRAGfxn_cosmetic(gm_v*1000,0,2),'-k'); hold on;
for i=1:N
    semilogx(gm_v,FRAGfxn_cosmetic(gm_v*1000,abs(normrnd(0.0,0.15,[1 1])),2),'-','Color',GREY);
end
xlabel('PGV (m/s)'); ylabel('Damage Risk, Probability of Cosmetic Damage');
xlim(10.^[-3 0]);
ylim([0 1]);

% LPR vs PGA.
subplot(233);
plot(gm_a,VULNfxn_fatality(gm_a,0)*0.95,'-k'); hold on;
for i=1:N
    plot(gm_a,VULNfxn_fatality(gm_a,normrnd(0,1,[1 1]))*0.95,'-','Color',GREY);
end
xlabel('Average Spectral Acceleration (g)'); ylabel('Personal Risk, Probability of Loss of Life');
ylim([0 1]);

% Nuisance vs ML.
subplot(234);
semilogy(m,NUISfxn(pgv/100,[0 0],2),'-b'); hold on;
for i=1:N
    semilogy(m,NUISfxn(pgv/100,normrnd(0,1,[1 2]),2),'-','Color',GREY);
end
semilogy(m,NUISfxn(pgv/100,[0 0],3),'-r');
for i=1:N
    semilogy(m,NUISfxn(pgv/100,normrnd(0,1,[1 2]),3),'-','Color',GREY);
end
semilogy(m,NUISfxn(pgv/100,[0 0],4),'-y');
for i=1:N
    semilogy(m,NUISfxn(pgv/100,normrnd(0,1,[1 2]),4),'-','Color',GREY);
end
xlabel('Magnitude (M_L)'); ylabel('Nuisance Risk, Probability of Felt Ground Motion');
ylim([1e-2 1e0]); xlim([2.0 5.0]);

% Damage vs ML.
subplot(235);
semilogy(m,FRAGfxn_cosmetic(pgv*10,0,1),'-k'); hold on;
for i=1:N
    semilogx(m,FRAGfxn_cosmetic(pgv*10,abs(normrnd(0.0,0.15,[1 1])),1),'-','Color',GREY);
end
semilogy(m,FRAGfxn_cosmetic(pgv*10,0,2),'-k');
for i=1:N
    semilogx(m,FRAGfxn_cosmetic(pgv*10,abs(normrnd(0.0,0.15,[1 1])),2),'-','Color',GREY);
end
xlabel('Magnitude (M_L)'); ylabel('Damage Risk, Probability of Cosmetic Damage');
ylim([1e-4 1e0]); xlim([2.0 5.0]);

% LPR vs ML.
subplot(236);
semilogy(m,VULNfxn_fatality(SAavg,0)*0.95,'-k'); hold on;
for i=1:N
    plot(m,VULNfxn_fatality(SAavg,normrnd(0,1,[1 1]))*0.95,'-','Color',GREY);
end
xlabel('Magnitude (M_L)'); ylabel('Personal Risk, Probability of Loss of Life');
ylim([1e-7 1e0]); xlim([2.0 5.0]);




