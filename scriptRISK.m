clear;

% Define input parameters.
Nv=10;
Nt=3000;
rand_flag='random';

% Load in data, to continue iterations.
load('blanks/TLP_nl.mat','S');
%load('TLP_temp.mat','S');

% Iteratively add impact curves.
while(length(S.dVAR.dM)<Nt)
    
    % Prompt for percent done.
    100*length(S.dVAR.dM)/Nt
    
    % Create a perturbed data structure.
    S=perturbVAR(S,Nv,rand_flag);
    
    % Compute risk curves for each spatial pixel and perturbed value.
    tic; S=runRISK(S,rand_flag); toc;
    
    % Save data structure.
    save('TLP_temp.mat','S');
end






