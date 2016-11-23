function f = fcnOrdonez(chromosome)

% f = fcnOrdonez(chromosome)
% Evaluates a chromosome that represents a permutation using Ord��ez idea.
% The chromosome is decodes using function ordonez, and evaluated using
% fcnTSP.
%
% See also: fcnTSP, ordonez

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

permutation = ordonez(chromosome);
f = fcnTSP(permutation);

