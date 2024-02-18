function [Bx,By] = lineBField(X,Y,x0,y0,i)

% lineBField
% ks
% 2020
%
% calculates the magnetic flux density due to a z-directed infinite line of
% current i intersecting the xy plane at x0, y0.  Fields are calculated
% over the array of points in the xy plane described by the arrays X, Y
%
% example usage:
%     x0 = 0.5;
%     y0 = 0.5;
%     i = 1;
%     x = linspace(-1,1,201)*l;
%     Y = linspace(-1,1,201)*l;
%     [X,Y] = meshgrid(x,y);
%     [Bx_,By_] = lingBField(X,Y,x0,y0,i); 

mu0 = 4*pi*1e-7;
P = sqrt((X-x0).^2+(Y-y0).^2);
T = atan2(Y-y0,X-x0);

Bphi = i./(2*pi*P);
Bphi(P<0.05) = NaN;
Bx = -Bphi.*sin(T);
By = Bphi.*cos(T);

end