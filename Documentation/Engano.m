%% Enga�o

% En este script se prueban las conclusiones de Goldberg respecto a
% problemas enga�osos con bits contactenados e intercalados. 
% N�tese que estamos usando selecci�n de torneo porque es necesaria
% alguna forma de escalamiento en estos problemas.

%% Par�metros para todas las corridas

k = 5;  % n�mero de bits por enga�o
m = 10; % n�mero de problemas enga�osos

concatenados = @(x) sum(deceptive(x,k));      % fcn obj para concatenados
intercalados = @(x) sum(interDeceptive(x,m)); % fcn obj para intercalados 

Nc = k*ones(1,m);  % bits por segmento para problemas concatenados
Ni = m*ones(1,k);  % bits por segmento para problemas intercalados
n = 400;           % tama�o de poblaci�n
generaciones = 60; % generaciones que correr� el AG
corridas = 30;     % n�mero de corridas para curva de mejor encontrado

ejeY = [m*(2*(k-2)) m*(2*k-1)+2]; % l�mites del eje y para gr�ficas


%% Problemas concatenados, una corrida

p = population('integer',Nc);
p = random(p,n);
p = evaluate(p,concatenados);
best = get(p,'best');
e = 0;
b = best.fitness;
for i=1:generaciones
   p = tournament(p);
   p = crossover(p);
   p = mutation(p);
   p = evaluate(p,concatenados);
   best = get(p,'best');
   e(i+1) = get(p,'evals');
   b(i+1) = best.fitness;
   plot(e,b,'.-')
   ylim(ejeY)
   xlabel('Evaluaciones de la funci�n objetivo')
   ylabel('Mejor encontrado')
   title(sprintf('%d problemas enga�osos concatenados de %d bits',m,k))
   pause(0.01)
end
best

%% Problemas intercalados, una corrida

p = population('integer',Ni);
p = random(p,n);
p = evaluate(p,intercalados);
best = get(p,'best');
e = 0;
b = best.fitness;
for i=1:generaciones
   p = tournament(p);
   p = crossover(p);
   p = mutation(p);
   p = evaluate(p,intercalados);
   best = get(p,'best');
   e(i+1) = get(p,'evals');
   b(i+1) = best.fitness;
   plot(e,b,'.-')
   ylim(ejeY)
   xlabel('Evaluaciones de la funci�n objetivo')
   ylabel('Mejor encontrado')
   title(sprintf('%d problemas enga�osos intercalados de %d bits',m,k))
   pause(0.01)
end
best

%% Curva del mejor encontrado para problemas concatenados
% Para generar la curva del mejor encontrado, corremos m�ltiples veces
% el AG simple.

E = [];    
Be = [];
p = population('integer',Nc);
for j=1:corridas
   p = init(p);
   p = random(p,n);
   p = evaluate(p,concatenados);
   best = get(p,'best');
   e = get(p,'evals');
   b = best.fitness;
   for i=1:generaciones
      p = tournament(p);
      p = crossover(p);
      p = mutation(p);
      p = evaluate(p,concatenados);
      best = get(p,'best');
      e(i+1) = get(p,'evals');
      b(i+1) = best.fitness;
   end
   E = [E e'];
   Be = [Be b'];
   x = max(E,[],2);
   prom = mean(Be,2);
   fig1 = std(Be,[],2);
   plot(x,prom+fig1,x,prom,'.-',x,prom-fig1,e,b,':k')
   ylim(ejeY)
   xlabel('Evaluaciones de la funci�n objetivo')
   ylabel('Mejor encontrado')
   title(sprintf('%d problemas enga�osos concatenados de %d bits, %d corridas',m,k,j))
   legend('\mu + \sigma','\mu','\mu - \sigma',sprintf('corrida %d',j),4)
   pause(0.01)
end
plot(x,prom+fig1,x,prom,'.-',x,prom-fig1)
ylim(ejeY)
xlabel('Evaluaciones de la funci�n objetivo')
ylabel('Mejor encontrado')
title(sprintf('%d problemas enga�osos concatenados de %d bits, %d corridas',m,k,j))
legend('\mu + \sigma','\mu','\mu - \sigma',4)

%% Curva del mejor encontrado para problemas intercalados
% Para generar la curva del mejor encontrado, corremos m�ltiples veces
% el AG simple.

E = [];    
Be = [];
p = population('integer',Ni);
for j=1:corridas
   p = init(p);
   p = random(p,n);
   p = evaluate(p,intercalados);
   best = get(p,'best');
   e = get(p,'evals');
   b = best.fitness;
   for i=1:generaciones
      p = tournament(p);
      p = crossover(p);
      p = mutation(p);
      p = evaluate(p,intercalados);
      best = get(p,'best');
      e(i+1) = get(p,'evals');
      b(i+1) = best.fitness;
   end
   E = [E e'];
   Be = [Be b'];
   x = max(E,[],2);
   prom = mean(Be,2);
   fig1 = std(Be,[],2);
   plot(x,prom+fig1,x,prom,'.-',x,prom-fig1,e,b,':k')
   ylim(ejeY)
   xlabel('Evaluaciones de la funci�n objetivo')
   ylabel('Mejor encontrado')
   title(sprintf('%d problemas enga�osos intercalados de %d bits, %d corridas',m,k,j))
   legend('\mu + \sigma','\mu','\mu - \sigma',sprintf('corrida %d',j),4)
   pause(0.01)
end
plot(x,prom+fig1,x,prom,'.-',x,prom-fig1)
ylim(ejeY)
xlabel('Evaluaciones de la funci�n objetivo')
ylabel('Mejor encontrado')
   title(sprintf('%d problemas enga�osos intercalados de %d bits, %d corridas',m,k,j))
legend('\mu + \sigma','\mu','\mu - \sigma',4)
