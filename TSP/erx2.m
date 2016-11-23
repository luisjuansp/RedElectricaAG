function [h1, h2] = erx2(p1, p2)

% [h1, h2] = erx2(p1, p2)
%
% Call erx two times to produce two offspring, h1 and h2, from two parents,
% p1 and p2.
%
% See also:  erx

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

h1 = erx(p1,p2);
h2 = erx(p2,p1);
