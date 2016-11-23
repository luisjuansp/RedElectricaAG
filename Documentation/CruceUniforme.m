%% Script para probar cruce uniforme
% Para correr este script es necesario encender la bandera CROSSOVER_TEST
% dentro del m�todo uniformCrossover (recuerde apagarla despu�s)

% Se crea una poblaci�n con 3 segmentos de 10 d�gitos y bases 2, 3, y 4
p = population('i',[10 10 10],0,1,[2 3 4]);
p = random(p,10);
p = fill(p);
for i=1:2:10
   p = set(p,'r',[2 3 4].^10-1,i);
end
% despliego la poblaci�n
display(p)

%% Realizar el cruce


uniformCrossover(p,0.7)