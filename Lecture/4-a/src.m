% d4-a 
clc;
clear all;
close all;
%% 
n  = [1,2,3];
qn = [80, -30, 1 ];
xn = [0.1, 0.55, -0.7 ];
yn = [ 0.4, .8, - 0.6];
e = 8.8542 *10^-12;

x = linspace(-1 , 1 , 50);
y = x;

[X, Y] = meshgrid(x, y); %2-D Coordinates

%1
r1 = sqrt((X - xn(1)).^2 + (Y - yn(1)).^2);
r1 (r1<= 0.06)  = NaN;

Er1 = (qn(1)./(4.*pi.*(abs(r1.^2).*e)));
Ex1 = Er1.*(X - xn(1))./r1;
Ey1 = Er1.*(Y - yn(1))./r1;

%2
r2 = sqrt((X - xn(2)).^2 + (Y - yn(2)).^2);
r2(r2<= 0.03)  = NaN;

Er2 = (qn(2)./(4.*pi.*(abs(r2.^2).*e)));
Ex2 = Er2.*(X - xn(2))./r2;
Ey2 = Er2.*(Y - yn(2))./r2;

%3
r3 = sqrt((X - xn(3)).^2 + (Y-yn(3)).^2);
r3(r3<=0.05) = NaN;

Er3 = (qn(3)./(4.*pi.*(abs(r3.^2).*e)));
Ex3 = Er3.*(X - xn(3))./r3;
Ey3 = Er3.*(Y - yn(3))./r3;
%Electric Field Cartesian Components
ExTot = Ex1 + Ex2 + Ex3;
EyTot = Ey1 + Ey2 + Ey3;
%Magnitude
mag1 = abs(Ex1.^2 + Ey1.^2);
mag2 = abs(Ex2.^2 + Ey2.^2);
mag3 = abs(Ex3.^2 + Ey3.^2);
totalMag = mag1 + mag2 + mag3;

figure
hold on
pcolor(X,Y, totalMag);
a = quiver(X,Y,ExTot,EyTot,'k');
shading interp 
xlim( [-1 1])
ylim( [-1 1])

xticks (-1: 0.5 :1)
yticks (-1: 0.5 :1)

title('Total Field Produced by Point Charges')
legend('|E|' , 'E')

