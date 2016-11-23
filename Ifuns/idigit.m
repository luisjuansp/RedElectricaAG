function res = idigit(p, m, varargin)

% idigit(p, m, B=2) 
% 
% Digit m of base B of integer p. Digits are numbered
% from least significant to most significant starting
% at 1.
 
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
  
  if length(varargin)>=1
    B = varargin{1};
  else
    B = 2;
  end
  
  res = ilow(ihighh(p, m-1, B), 1, B);

