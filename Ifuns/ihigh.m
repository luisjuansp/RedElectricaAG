function res = ihigh(p, m, varargin)

% ihigh(p, m, B=2) = H_m(p)
%
% High part of integer p above digit m of base B.
 
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

  res = p - mod(p,B.^m);
