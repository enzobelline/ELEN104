Nz = 101;
Nt = 1001;
zmax = 5; 
tmax = 10;
z = linspace(0, zmax, Nz); %(0, 5, 101)
t = linspace(0, tmax, Nt); %(0,10,1001)
f = 20 ; % a frequency
omega = 2.*pi.*f ; % calculate omega
k = 20
%cycle through each time step
for t_ = t
    %update function f at this time step
    f = cos((omega.*t)-(k.*z));
    figure(1)
    cla()
    plot(z,f)
    xlim([min(z),max(z)])
    ylim([-1,1])
    xlabel('z')
    ylabel('f(z,t)')
    drawnow()
end    
