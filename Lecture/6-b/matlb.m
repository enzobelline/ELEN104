close all
clear
clc
%% 2.c
%user defined coefficients and linearly spaced vectors
z = linspace(-1,1,100);
l = 1;
% different ratios
an = [1, 0.2, 0.1, 0.02, 0.01];
v  = [-0.5 0; -0.5 1; 0.5 1; 0.5 0];
f  = [1, 2, 3, 4];

% plot the figures
for a = an  % plotting each ratio
    H = 0*z;        % plotting each point 
    H = ((z + l/2)./sqrt(a^2 + (z + l/2).^2) - (z - l/2)./sqrt(a^2 + (z - l/2).^2));
    figure(1)
    plot(z , H/2)
    hold on
end
xlabel('z/l')
ylabel('H_z/(N_i/l)')
xlim([-1 1])
ylim([0 1])
patch('Faces', f, 'Vertices', v, 'FaceColor', 'blue', 'facealpha', 0.05)
legend('a/l = 1','a/l = 0.2','a/l = 0.1','a/l = 0.02','a/l = 0.01')
hold off

