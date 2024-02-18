close all
clear 
clc 
%% problem 1b
z = linspace(0.001,10,101);
e = 8.8542*10^-12;
ps = 10;
a = 5;

Ez = (ps/(2*e))*(1-(z./sqrt(a.^2 + z.^2)));
magEz = abs(Ez);

figure(1)
loglog(z,Ez)

%% problem 1c
z = linspace(0.00001,100,1100);
z1 = linspace(1,100,1100);
Ez = (ps/(2*e))*(1-(z./sqrt(a.^2+z.^2)));
Ep = (ps*pi*a^2)./(4*e*pi*z1.^2);

figure(1)
hold on
loglog(z,Ez,'black')
loglog(z,Ep,'g')
legend('Magnitude of Ez','Infinitive Plate Line','Point Charge Line')
xlim([0.01, 100])
ylim([10^9, 10^12])
hold off    

%% problem 3
n = [1,2,3];
x = linspace(-1,1,40);
y = linspace(-1,1,40);
e = 8.8542*10^-12;

[X,Y] = meshgrid(x,y);

r1 = sqrt((X + 0.125).^2 + Y.^2);
Er1 = (1./(4*pi*(abs(r1.^2).*e)));
Ex1 = Er1.*(X +0.125);
Ey1 = Er1.*(Y);
V1 = (1./(4*pi*(abs(r1).*e)));
mE1 = abs(Ex1.^2 + Ey1.^2);

r2 = sqrt((X-0.125).^2 + (Y.^2));
Er2 = (1./(4.*pi.*(abs(r2.^2).*e)));
Ex2 = Er2.*(X-0.125);
Ey2 = Er2.*(Y);
V2  = (1./(4*pi*abs(r2)*e));
mE2 = abs(Ex2.^2 + Ey2.^2);

figure
contour(X,Y,V1+V2)
hold on 
title('q2 = q1')
xticks(-1:0.5:1)
yticks(-1:0.5:1)
legend('Magnitude of E','E')

figure
contour(X,Y,V1+V2*4)
hold on 
title('q2 = 4q1')
xticks(-1:0.5:1)
yticks(-1:0.5:1)
legend('Magnitude of E','E')

figure
contour(X,Y,V1-V2)
hold on 
title('-q2 = q1')
xticks(-1:0.5:1)
yticks(-1:0.5:1)
legend('Magnitude of E','E')

figure
contour(X,Y,V1-4*V2)
hold on 
title('q2 = -4q1')
xticks(-1:0.5:1)
yticks(-1:0.5:1)
legend('Magnitude of E','E')