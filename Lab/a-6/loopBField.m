function [Bx,Bz] = loopBField(X,Z,a,z0,i)

% loopBField
% ks
% 2020
%
% calculates the magnetic flux density due to a circular loop of radius a
% centered on z = z0 on the z axis.  The loop normal is in the z direction.
% field points are calculated on the grid of points on the xz plane
% supplied in the arrays X and Z.  The loop carries current i.
%
% example usage:
%     a = 0.1;
%     z0 = 0.1;
%     i = 1;
%     x = linspace(-1,1,201)*l;
%     z = linspace(-1,1,201)*l;
%     [X,Z] = meshgrid(x,z);
%     [Bx_,Bz_] = loopBField(X,Z,a,z0,i); 

mu0 = 4*pi*1e-7;
P = abs(X);

% precalculate elliptic integrals
alp = 2*sqrt(a*P./((a+P).^2+(Z-z0).^2));
[K,E] = ellipke(alp.^2);

% calculate x field component
Bx = mu0*i*(Z-z0)./(2*pi*P).*1./sqrt((a+P.^2)+Z.^2).*(-K+(a^2+P.^2+(Z-z0).^2)./((a-P).^2+(Z-z0).^2).*E);
Bx(X<0) = -Bx(X<0);

% calculate z field component
Bz = mu0*i./(2*pi).*1./sqrt((a+P.^2)+Z.^2).*(K+( a^2- P.^2 - (Z-z0).^2)./((a-P).^2+(Z-z0).^2).*E);

% NaN out points too close to the loop
tol = 0.1;
Ra = sqrt((X-a).^2+(Z-z0).^2);
mask = (Ra<=tol);
Bx(mask) = NaN;
Bz(mask) = NaN;
Rb = sqrt((X+a).^2+(Z-z0).^2);
mask = (Rb<=tol);
Bx(mask) = NaN;
Bz(mask) = NaN;
end
