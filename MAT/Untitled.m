%% main
syms FA  % define symbol

% define constants
k = 0.23;
v0 = 10;
FA0 = 1;

expr = (1./(-k.*FA./v0)); % define the given expression
q(FA) = int(expr,FA,FA0,FA); % obtain integral as a function of FA

FA_span = 1:-0.0001:0.0000001; % define span of FA

value = 100 - double(q(FA_span)); % evaluate the final value


%% plot
plot (FA_span, value)
title('100 - quad(I,F_A_0,F_A) vs F_A')
xlabel('F_A')
ylabel('100 - quad(I,F_A_0,F_A)')
grid on