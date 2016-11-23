%% Funci�n objetivo para el problema de red el�ctrica
%
% �ste es un peque�o script que muestra c�mo se podr�an hacer los c�lculos
% para evaluar la funci�n objetivo para el problema de la red el�ctrica.
%
% M.Valenzuela
%
% Los nodos se numeran a partir de 0, donde 0 es la subestaci�n.
%
% El arreglo hijo contiene el hijo del nodo i-1. En este arreglo el
% hijo se numera a partir de 0, donde 0 indica que no tiene  
% indica que no tiene hijos (todos los nodos, excepto la subestaci�n, 
% deben tener un hijo) 1 se refiere a la subestaci�n (nodo 0). Por ejemplo, 
% en el caso 1, hijo(1)=0 es el hijo de la subestaci�n (nodo 0) que no 
% tiene hijo, hijo(2)=5 indica que el hijo del nodo 1 es 4, etc.
%
% El arreglo prod contiene la producci�n del nodo i-1.
%
% Cada rengl�n del arreglo C contiene las coordenadas del nodo i-1.
%
% N es el n�mero de nodos contando a la subestaci�n.

%% Datos caso 1

% hijo del nodo i-1
%       0 1 2 3 4 5 6
hijo = [0 5 4 6 1 5 6];

% Producci�n del nodo i-1
%       0 1 2 3 4 5 6
prod = [0 10 5 3 4 9 8];

% Coordenadas del nodo i-1
%     0   1   2   3   4    5    6
C = [0 0;3 2;6 2;6 0;3 -2;6 -2;9 -2];

N = length(hijo);

%% Datos caso 2

% hijo del nodo i-1
hijo = [0 3 7 3 4 7 9 6 1 7 10];

% Producci�n del nodo i-1
prod = [0 3 3 3 10 4 5 5 14 12 2];

% Coordenadas del  nodo i-1
C = [0 1.5; 1 0; 2 0; 3 0; 5 0; 3 1.5; 2 2; 4 2; 1 3; 3 3; 5 3];

N = length(hijo);

%% Datos caso 3

% hijo del nodo i-1
%       0  1  2  3  4  5  6  7  8  9 10 11 12 13 14
hijo = [0 14  7  3  4  7  9  6 15  7 10  8  8  1  1];

% Producci�n del nodo i-1
prod = [0 3 3 3 10 4 5 5 14 12 2 5 8 10 13];

% Coordenadas del nodo i-1
C = [0 1.5; 1 0; 2 0; 3 0; 5 0; 3 1.5; 2 2; 4 2; 1 3; 3 3; 5 3; 5 1;5 2;0 0;0 3];

N = length(hijo);

%% Gr�fica de la red con producci�n

delta = 0.1; % deplazamiento de las etiquetas
plot(C(1,1),C(1,2),'sr',C(2:end,1),C(2:end,2),'ob')
xlim([min(C(:,1))-0.5 max(C(:,1)+0.5)]);
ylim([min(C(:,2))-0.5 max(C(:,2)+0.5)]);
hold on
for p=2:N
   h = hijo(p);
   %fprintf('p=%d h=%d\n',p,h)
   text(C(p,1)+delta,C(p,2)+delta,sprintf('%d:%d',p-1,prod(p)))
   plot([C(p,1) C(h,1)],[C(p,2) C(h,2)],'-b')
   %pause
end
text(C(1,1)+delta,C(1,2)+delta,'0')
hold off
title('Red electrica (nodo:produccion)')
xlabel('x')
ylabel('y')


%% Conversi�n de padre a matriz de incidencias

A = zeros(N);
for i=1:N
   if hijo(i)~=0
      A(i,hijo(i)) = 1;
   end
end
% Matriz de inicidencias
display(A)

%% Conversi�n de A a padre (s�lo para mostrar que es posible)

hijo = zeros(1,size(A,1));
for i=2:size(A,1)
   h = find(A(i,:)==1);
   if isempty(h)
      hijo(i) = 0;
   else
      hijo(i) = h;
   end
end
display(hijo)

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
display(envia)


%% Mismo que anterior, pero usando operaciones sobre conjuntos

% No usar, es muy lento
pad = hijo;
envia = zeros(size(pad));
U = 1:N;
while 1
   hojas = setdiff(U,pad);
   if isequal(hojas,1)
      break
   end
   U = setdiff(U,hojas);
   envia(hojas) = envia(hojas) + prod(hojas);
   for i=1:length(hojas)
      envia(pad(hojas(i))) = envia(pad(hojas(i))) + envia(hojas(i));
   end
   pad(hojas) = 0;
end
display(envia)

%% Gr�fica de red con producci�n y cantidad que se env�a

delta = 0.1; % desplazamiento de las etiquetas
plot(C(1,1),C(1,2),'sr',C(2:end,1),C(2:end,2),'ob')
xlim([min(C(:,1))-0.5 max(C(:,1)+0.5)]);
ylim([min(C(:,2))-0.5 max(C(:,2)+0.5)]);
hold on
for p=2:N
   h = hijo(p);
   text(C(p,1)+delta,C(p,2)+delta,sprintf('%d:%d/%d',p-1,prod(p),envia(p)))
   plot([C(p,1) C(h,1)],[C(p,2) C(h,2)],'-b')
end
text(C(1,1)+delta,C(1,2)+delta,'0')
hold off
title('Red electrica (nodo:produccion/envia)')
xlabel('x')
ylabel('y')

%% C�lculo de costos

% Funci�n de costo unitario para caso 1 (debe cambiarse para los casos 2 y 3)
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
display(D)

costo = zeros(1,N);
for i=2:N
   costo(i) = costoUnitario(envia(i))*D(i,hijo(i));
end

% Costo por arista
display(costo)
fprintf('El costo total es: %f\n',sum(costo))


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
display(D)

costo = costoUnitario(envia).*[0;diag(D(2:N,hijo(2:N)))]';

% Costo por arista
display(costo)
fprintf('El costo total es: %f\n',sum(costo))


%% Prueba de velocidad
%
% Estas pruebas demuestran que para los casos 2 y 3 la forma vectorial 
% de calcular los costos es m�s r�pida.

nPruebas = 50000;
tini = tic;
for j=1:nPruebas
   for i=2:N
      costo(i) = costoUnitario(envia(i))*D(i,hijo(i));
   end
end
tf1 = toc(tini);

tini = tic;
for j=1:nPruebas
   costo = costoUnitario(envia).*[0;diag(D(2:N,hijo(2:N)))]';
end
tf2 = toc(tini);

fprintf('Tiempo no vectorial = %6.2fs\n',tf1)
fprintf('Tiempo vectorial    = %6.2fs\n',tf2)

% Conclusi�n:
% Parece que 


