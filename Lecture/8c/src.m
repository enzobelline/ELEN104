close all
clear
clc
%% 6a
x = linspace(0,20);
z = linspace(0,12);
[X, Z] = meshgrid(x,z);
k  = 2*pi;

R = sqrt((X - 2).^2 + (Z - 5).^2);
r = 29;
f = exp(-1j*k.*R)./R;
magF = abs(f);

figure 
pcolor(X, Z, magF);
caxis([0,1])
xlabel('x/\lambda')
ylabel('y/\lambda')
shading interp 
colorbar
%% 6c
R1 = sqrt((X - 2).^2 + (Z + 2).^2);
f1 = exp(-1j*k.*R1)./R1;
magF = abs(f-f1);

figure 
pcolor(X,Z,magF);
caxis([0,1])
xlabel('x/\lambda')
ylabel('y/\lambda')
shading interp 
colorbar