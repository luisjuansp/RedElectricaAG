function res = isegment(p, m1, m2, varargin)

% isegment(p, m1, m2, B=2) = segment_{m1,m2}(p)
%
% Segment of bits m1+1 through m2 of integer p

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
    B = varargin{1};
  else
    B = 2;
  end

  delta = m2 - m1;
  res = ilow(ihighh(p,m1,B),delta,B);
