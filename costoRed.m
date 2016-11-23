function [costo envia] = costoRed(hijo, varargin)

persistent prod N C

if (length(varargin) != 0)

  prod = varargin{1};
  N = varargin{2};
  C = varargin{3};
  return
  
endif

pasthijo = hijo;

hijo = breakLoops(hijo);

hijo = [0 hijo+1];

graficaRed(hijo, C, zeros(7));

%% Conversi�n de padre a matriz de incidencias

A = zeros(N);
for i=1:N
   if hijo(i)~=0
      A(i,hijo(i)) = 1;
   end
end


%% C�lculo de corriente en cada arista del �rbol

Aux = A;
envia = zeros(size(hijo));    % potencia que env�a cada nodo a su padre
while 1
   hojas = find(sum(Aux,1)==0);  % si el nodo ra�z es hoja,
   if isequal(hojas,1)           % salir
      break
   end
   envia(hojas) = envia(hojas) + prod(hojas);  
   for i=1:length(hojas)
      envia(hijo(hojas(i))) = envia(hijo(hojas(i))) + envia(hojas(i));
      Aux(hojas(i),:) = zeros(size(hijo));
   end
   Aux(1,hojas) = 1;
   %display(A);
end


%% C�lculo de costos (en forma vectorial)
%
% Esto corre m�s r�pido porque utiliza operaciones matriciales

% Funci�n de costo unitario para caso 1 (debe cambiarse para el caso 2 y 3)
costoUnitario = @(capacidad)  2 + capacidad.^0.6;

% La matriz de distancias contiene la distancia del nodo i-1 al nodo j-i
D = zeros(N);
for i=1:N
   for j=i+1:N
      D(i,j) = norm(C(i,:)-C(j,:));
      D(j,i) = D(i,j);
   end
end
% Matriz de distancias
%display(D)

costo = costoUnitario(envia).*[0;diag(D(2:N,hijo(2:N)))]';
costo = sum(costo);