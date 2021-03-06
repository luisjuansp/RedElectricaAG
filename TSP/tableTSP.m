function distance = tableTSP(coordinates)

% distance = tablaTSP(coordinates)
%
% Calculates the distance matrix for cities with given coordinates.
%
% See also: invTSP, fcnTSP, plotTSP

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

[nCities,nx] = size(coordinates);
if nx ~= 2,
   error('coordinates must be a (nCities) x 2 matrix')
end
distance = zeros(nCities);
for i=1:nCities
   for j=i: nCities
      distance(i,j) = ...
         sqrt( (coordinates(i,1)-coordinates(j,1))^2 + ...
         (coordinates(i,2)-coordinates(j,2))^2);
      distance(j,i) = distance(i,j);
   end
end 

