%% Datos caso 1

% hijo del nodo i-1
%       0 1 2 3 4 5 6
%hijo = [3 3 1 1 1 3];

% Producci�n del nodo i-1
%       0 1 2 3 4 5 6
%prod = [0 10 5 3 4 9 8];
%
%% Coordenadas del nodo i-1
%%     0   1   2   3   4    5    6
%C = [0 0;3 2;6 2;6 0;3 -2;6 -2;9 -2];

% Producci�n del nodo i-1
prod = [0 3 3 3 10 4 5 5 14 12 2];

% Coordenadas del  nodo i-1
C = [0 1.5; 1 0; 2 0; 3 0; 5 0; 3 1.5; 2 2; 4 2; 1 3; 3 3; 5 3];

%% Producci�n del nodo i-1
%prod = [0 3 3 3 10 4 5 5 14 12 2 5 8 10 13];
%
%% Coordenadas del nodo i-1
%C = [0 1.5; 1 0; 2 0; 3 0; 5 0; 3 1.5; 2 2; 4 2; 1 3; 3 3; 5 3; 5 1;5 2;0 0;0 3];


N = length(prod);

costoRed("init", prod, N, C);

p = population('integer', [ones(1, N - 1)], 0.1, 0.9, [N]);
p = random(p,50);
%p = evaluate(p, @costoRed);
%p = tournament(p);
%p = crossover(p);
%p = mutation(p);

p = runGA(p, @costoRed, 100);

%[costo envia] = costoRed(hijo);
%
%% Costo por arista
%display(costo)
%fprintf('El costo total es: %f\n',sum(costo))
%

besthijo = get(p,'best').r;

hijo = [0 breakLoops(besthijo)+1];


[costo envia] = costoRed(besthijo);


graficaRed(hijo, C, envia);