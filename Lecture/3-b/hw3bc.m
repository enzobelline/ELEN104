close all;
clear;
clc;

%% Visualizing Flux
x = linspace(-5, 5, 30);
y = linspace(-5, 5, 30);
[X, Y] = meshgrid(x, y);

Ax  = 9*X.*Y + 3.*(Y.^2); %xcomp
dAx = 9.*X + 6.*Y; %dA/dx

Ay  = 30.*cos(X);      %ycomp
dAy = -30.*sin(X);    %dB/dy

figure
hold on
curlZ = dAy - dAx;   %calculate the magnitude
pcolor( X ,Y, curlZ);
hold on
quiver( X, Y, Ax, Ay , 2,'k');
shading flat
title('Visualizing Curl for A')
ylabel('y, m')
xlabel('x, m')
xlim([-5,5])
ylim([-5,5])
legend('\nablaxA', 'A')
hold off


