

%% Datos caso 1

% hijo del nodo i-1
%       0 1 2 3 4 5 6
hijo = [0 5 2 7 3 4 6];

% Producci�n del nodo i-1
%       0 1 2 3 4 5 6
prod = [0 10 5 3 4 9 8];

hijo = breakLoops(hijo);

% Coordenadas del nodo i-1
%     0   1   2   3   4    5    6
C = [0 0;3 2;6 2;6 0;3 -2;6 -2;9 -2];

N = length(hijo);


costoRed("init", prod, N, C);
[costo envia] = costoRed(hijo);

% Costo por arista
display(costo)
fprintf('El costo total es: %f\n',sum(costo))

graficaRed(hijo, C, envia);

%graficaRed(hijo, C, zeros(7));