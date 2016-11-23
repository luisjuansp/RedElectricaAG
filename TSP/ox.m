function [h1, h2] = ox(p1, p2, varargin)

% [h1,h2] = ox(p1, p2)
% [h1,h2] = ox(p1, p2, crosspoint1, crosspoint2)
%
% Implements Order Crossover (OX) of permutations 
% p1 and p2. Crossover points are generated randomly 
% if not given. crosspoint1 must be less than 
% crosspoint2.
%
% See also:  cx, erx, pmx

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

if length(varargin) >= 2
  % if given, accept crosspoints
  c1 = varargin{1};
  c2 = varargin{2};
else
  % if not given, generate crosspoints
  c1 = floor(rand*(length(p1)-1))+1;
  c2 = floor(rand*(length(p2)-1));
  if c2 >= c1
    c2 = c2 + 1;
  else
    tmp = c1;
    c1 = c2;
    c2 = tmp;
  end
end

if c2 <= c1
  error('crossover points are incorrect')
end

n = length(p1);
h1 = p2;
h2 = p1;
seg1 = p2(c1+1:c2);
seg2 = p1(c1+1:c2);

j = c2 + 1;
k1 = c2 + 1;
k2 = c2 + 1;
while j~=c1+1
  while length(find(seg1==p1(k1))) > 0
    k1 = k1 + 1;
    if k1 > n
      k1 = 1;
    end
  end
  h1(j) = p1(k1); 
  k1 = k1 + 1;
  if k1 > n
    k1 = 1;
  end
  while length(find(seg2==p2(k2))) > 0
    k2 = k2 + 1;
    if k2 > n
      k2 = 1;
    end
  end
  h2(j) = p2(k2); 
  k2 = k2 + 1;
  if k2 > n
    k2 = 1;
  end
  j = j + 1;
  if j > n
    j = 1;
  end
end

