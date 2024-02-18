%Kurt Williams
%%
%Modeling a simple permanent magnet 

x = linspace(-0.02,0.02,100); 
z = linspace(-0.02,0.02,100);

[X, Z] = meshgrid(x,z);

C = 350/(5.8*10^6);

%converting the cartesian coordinates to spherical coordinates
r = sqrt(X.^2 + Z.^2);   
theta = atan2(X,Z);     
phi = atan2(Z,X);      

r(r <=0.003) = NaN;


B_r = (C*2.*cos(theta))./(r.^3); 
B_th = (C.*sin(theta)./r.^3); 
B_x = (B_r).*sin(theta) + (B_th).*cos(theta); 
B_z = (B_r).*cos(theta) - (B_th).*sin(theta);  

figure(1)
%plotting and formatting
quiver(x, z, B_x, B_z, 6,'r');
hold on
xlim([-0.02,0.02])
ylim([-0.02,0.02])

figure(2)
%plotting and formatting
magB = sqrt((B_x).^2 + (B_z).^2) ;
pcolor (x, z ,magB)
hold on
axis equal
xlim([-0.02,0.02])
ylim([-0.02,0.02])
shading interp
xticks([-0.02, 0, 0.02])
yticks([-0.02, 0, 0.02])
xlabel('x, m')
ylabel('z, m')
title('|B|')

figure(3)
%plotting and formatting
magBx = abs(B_x);
pcolor(x, z, magBx)
hold on
axis equal
xlim([-0.02,0.02])
ylim([-0.02,0.02])
shading interp
xticks([-0.02, 0, 0.02])
yticks([-0.02, 0, 0.02])
xlabel('x, m')
ylabel('z, m')
title('|Bx|')

figure(4)
%plotting and formatting
magBz = abs(B_z);
pcolor(x, z, magBz)
hold on
axis equal
xlim([-0.02,0.02])
ylim([-0.02,0.02])
shading interp
xticks([-0.02, 0, 0.02])
yticks([-0.02, 0, 0.02])
xlabel('x, m')
ylabel('z, m')
title('|Bz|')
%%

x = linspace(-1,1,100)*0.02; 
z = 0.007;
C = 350/(5.8*10^6);


for i = 1: length(x)

    theta = atan2(x,z);
    r = sqrt(x.^2 + z.^2);

    B_r = 2*C.*cos(theta)./r.^3;
    B_th = C*sin(theta)./r.^3;  
    B_x = (B_r).*sin(theta) + (B_th).*cos(theta);  
    B_z = ((B_r).*cos(theta) - (B_th).*sin(theta));   

end   

figure(5)

plot(x, B_z)

grid on

%%
z = 0.03;
PH = zeros(1, 101);
dph= zeros(1, 100);

for v = [1, 2, 5, 10]
    t = linspace(-0.04, 0.04, 101);
    C = 350/(5.8*10^6);
    A = 0.001^2;
   
    for i = 1: length(t)
        
        x = v*t(i);
        theta = atan2(x,z);
        r = sqrt(x.^2 + z.^2);
        
        B_r = 2*C.*cos(theta)./r.^3;
        B_th = C*sin(theta)./r.^3; 
        
        PH(i) = 1e4*(B_r.*cos(theta)-(B_th).*sin(theta))*A;
        
        if i ~= 1
           dph(i-1) =(PH(i) - PH(i-1))/(t(i)-t(i-1)); 
        end
    end     
        
    tnew = t(1:(length(t)-1));
    figure(6)
    plot(t, PH)
    xlabel('t, s')
    ylabel('\psi, T\bulletm^2')
    legend('V = 1 (m/s)','V = 2 (m/s)','V = 5 (m/s)', 'V = 10 (m/s)')
   
    hold on 

    figure(7)
    plot(tnew, dph)
    xlabel('t, s')
    ylabel('V_E_M_F(t),V')
 
    legend('V = 1 (m/s)','V = 2 (m/s)','V = 5 (m/s)', 'V = 10 (m/s)')
    
    hold on 
    

    
end    


%%
%Part 3
t = linspace(-0.04, 0.04, 301);
Vmph = linspace(0, 20, 300);
d = 0.662;
Vms = Vmph * 0.44704;
f = Vms/pi/d;
V = f*2*pi*0.1;
x = [];
for v = V
    x = [x; t*v];
end

z= 0.03;
r = sqrt(x.^2 + z.^2);
theta = atan2(x, z);
C = 350/(5.8*10^6);
A = 0.001^2;

B_r = (C./r.^3).*(2.*cos(theta)); 
B_theta = (C./r.^3).*(sin(theta)); 
B_rx = B_r.*cos(theta); 
B_thetaz = -1*B_theta.*sin(theta);
B_z = B_rx + B_thetaz;

Psi = B_z.*A.*10^4;

max_dpsi = [];

for v = 1:numel(V)
    dpsiv = [];
    for i=1:(numel(Psi(1, :))-1)
        dpsiv = [dpsiv, (Psi(v, i+1) - Psi(v, i))/(t(i+1) - t(i))]; 
    end
    max_dpsi = [max_dpsi, max(dpsiv)]; 
end
figure(6)
hold on
%graphing and formatting
plot(Vmph, max_dpsi);
yline(2.1, '--k');
legend('v^{max}_{emf}', '2.1 V');
xlabel('velocity, mph');
ylabel('v^{max}_{emf}, V');
ylim([0,12])
xlim([0,20])
xticks([0, 5, 10, 15, 20])
yticks([0, 2, 4, 6, 8, 10, 12])
