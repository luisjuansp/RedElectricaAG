%% Datos caso 1

% hijo del nodo i-1
%       0 1 2 3 4 5 6
hijo = [3 3 1 1 1 3];

% Producci�n del nodo i-1
%       0 1 2 3 4 5 6
prod = [0 10 5 3 4 9 8];

hijo = breakLoops(hijo);

% Coordenadas del nodo i-1
%     0   1   2   3   4    5    6
C = [0 0;3 2;6 2;6 0;3 -2;6 -2;9 -2];

costoRed("init", prod, N, C);

N = length(prod);

p = population('integer', [ones(1, N - 1)], 0.1, 0.9, [N]);
p = random(p,4);
p = evaluate(p, @costoRed)
p = tournament(p);
p = crossover(p);
p = mutation(p);

%[costo envia] = costoRed(hijo);
%
%% Costo por arista
%display(costo)
%fprintf('El costo total es: %f\n',sum(costo))
%
%hijo = [0 hijo+1];
%
%graficaRed(hijo, C, envia);

%graficaRed(hijo, C, zeros(7));