function res = square(x,varargin)

% x2(x, k=1)
%
% k(1)*x(1)^2 + k(2)*x(2)^2 + ....
%
% Funcion de prueba para AGA 

%************************************************************
%*                                                          *
%*   vgGA: The Virtual Gene Genetic Algorithm               *
%*                                                          *
%*   Copyright (c) All Rights Reserved                      *
%*   Manuel Valenzuela-Rend�n                               *
%*   valenzuela@itesm.mx                                    *
%*   http://homepages.mty.itesm.mx/valenzuela               *
%*                                                          *
%*   Tecnol�gico de Monterrey, Campus Monterrey             *
%*   Monterrey, N.L., Mexico                                *
%*                                                          *
%************************************************************


if length(varargin) >= 1
   bits = varargin{1};
   xmax = 2.^bits-1;
   x = x./xmax;
end

if length(varargin) >= 2 
   k = varargin{2};
else
   k = 1;
end
if length(k)~=length(x)
   k = 1;
end

res = sum(k.*(x.^2));
