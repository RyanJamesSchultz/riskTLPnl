clear;

% Load in the data structures: M & S.
load('TLPmap_nl_dLx.mat');
load('TLP_nl.mat');

% Plot the histogram of the combination map.
figure(11); clf;
v=M.N.Mcomb(:); v(isnan(v))=[];
histogram(v,round(sqrt(length(v)))); hold on;
plot(mean(v)*[1 1],ylim,'-k');
plot(median(v)*[1 1],ylim,'--k');
plot(prctile(v,10)*[1 1],ylim,':k');
plot(prctile(v,90)*[1 1],ylim,':k');
xlabel('Red-Light Magnitude (M_L)'); ylabel('Counts');
