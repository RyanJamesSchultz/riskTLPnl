clear;

% Load in the data structure: S.
load('TLP_nl_3000.mat');

% Predefine some variables.
Nv=length(S.dVAR.b);

% Plot all perturbation data.
figure(4); clf;
subplot(2,5,1); histogram(S.dVAR.dZ, round(sqrt(Nv)) );
xlabel('Depth Perturbation, dZ (km)'); ylabel('Count');
subplot(2,5,2); histogram(S.dVAR.b, round(sqrt(Nv)) );
xlabel('b-value distribution, b (-)'); ylabel('Count');
subplot(2,5,3); histogram(S.dVAR.dM, round(sqrt(Nv)) );
xlabel('Magnitude Perturbation, dM (M_L)'); ylabel('Count');
set(gca, 'YScale', 'log');
subplot(2,5,4); histogram(S.dVAR.dGM, round(sqrt(Nv)) );
xlabel('GMPE Perturbation, dGM (-)'); ylabel('Count');
subplot(2,5,6); histogram(S.dVAR.dN1, round(sqrt(Nv)) );
xlabel('Nuisance Fxn Perturbation, dN1 (-)'); ylabel('Count');
subplot(2,5,7); histogram(S.dVAR.dN2, round(sqrt(Nv)) );
xlabel('Nuisance Fxn Perturbation, dN2 (-)'); ylabel('Count');
subplot(2,5,8); histogram(S.dVAR.Po, round(sqrt(Nv)) );
xlabel('Damage Fxn Initial Damage State, \Psi_o (-)'); ylabel('Count');
subplot(2,5,9); histogram(S.dVAR.dLPR, round(sqrt(Nv)) );
xlabel('LPR Vulnerability Fxn Perturbation, dLPRP (-)'); ylabel('Count');
subplot(2,5,5); histogram(S.dVAR.dSA, round(sqrt(Nv)) );
xlabel('Site Amp Perturbation, dSA (-)'); ylabel('Count');
subplot(2,5,10); histogram(S.dVAR.dPOP, round(sqrt(Nv)) );
xlabel('Population Perturbation Factor, dPOP (-)'); ylabel('Count');
