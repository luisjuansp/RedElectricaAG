%% Problemas de vendedor viajero

% En este script vamos a mostrar el uso del vgGA para resolver problemas de
% vendedor viajero (TSP).

% Creamos un problema. Generamos las coordenadas en forma aleatoria, y
% calculamos una matriz de distancias que se carga en la funcion fcnTSP.
nCiudades = 20;
coordenadas = rand(nCiudades,2);
distancias = tableTSP(coordenadas);
fcnTSP(distancias);
clf
subplot(2,1,1)
plotTSP(0:nCiudades-1,coordenadas,'x',2)
title('Distribuci�n de ciudades para problema TSP')
xlabel('x')
ylabel('y')

%% Poblaci�n inicial
% Con esta poblaci�n vamos resolver el problema con varios operadores
% especiales de cruce para permutaciones

n = 400;                  % tama�o de la poblaci�n
generaciones = 200;       % n�mero de generaciones a correr 

p0 = population('i',ones(1,nCiudades),0,0.8,nCiudades);
pi = 1/3;

% No desplegar cromosomas ni fenotipos
p0 = setDisplay(p0,{'phenos',0}); 

% Hacer minimizaci�n
p0 = min(p0);

p0 = randomPerm(p0,n);                      

%% TSP con PMX
% Primero, resolvemos el problema utilizando el operador de cruce PMX.
p = evaluate(p0,@fcnTSP);
best = get(p,'best');
e = 0;
b = best.fitness;
for i=1:generaciones
   p = tournament(p);
   p = permCrossover(p,@pmx);
   p = inversion(p,pi);
   p = evaluate(p,@fcnTSP);
   best = get(p,'best');
   e(i+1) = get(p,'evals');
   b(i+1) = best.fitness;
   subplot(2,1,2)
   plot(e,b,'.-')
   %axis([0 e(i+1)+100 0 ceil(logB(2^N,B))])
   xlabel('Evaluaciones de la funci�n objetivo')
   ylabel('Mejor encontrado')
   title(sprintf('PMX (n=%d)',n))
   subplot(2,1,1)
   plotTSP(best.r,coordenadas,'b',2);
   title(sprintf('mejor=%f encontrado en %d evals, despu�s de %d evals ',best.fitness,best.evals,e(i+1)))
   fprintf('%s -> %f\n',sprintf('%d ',best.r),best.fitness)
   pause(0.01)
end

%% TSP con OX
p = evaluate(p0,@fcnTSP);
best = get(p,'best');
e = 0;
b = best.fitness;
for i=1:generaciones
   p = tournament(p);
   p = permCrossover(p,@ox);
   p = inversion(p,pi);
   p = evaluate(p,@fcnTSP);
   best = get(p,'best');
   e(i+1) = get(p,'evals');
   b(i+1) = best.fitness;
   subplot(2,1,2)
   plot(e,b,'.-')
   %axis([0 e(i+1)+100 0 ceil(logB(2^N,B))])
   xlabel('Evaluaciones de la funci�n objetivo')
   ylabel('Mejor encontrado')
   title(sprintf('OX (n=%d)',n))
   subplot(2,1,1)
   plotTSP(best.r,coordenadas,'b',2);
   title(sprintf('mejor=%f encontrado en %d evals, despu�s de %d evals ',best.fitness,best.evals,e(i+1)))
   fprintf('%s -> %f\n',sprintf('%d ',best.r),best.fitness)
   pause(0.01)
end

%% TSP con CX
p = evaluate(p0,@fcnTSP);
best = get(p,'best');
e = 0;
b = best.fitness;
for i=1:generaciones
   p = tournament(p);
   p = permCrossover(p,@cx);
   p = inversion(p,pi);
   p = evaluate(p,@fcnTSP);
   best = get(p,'best');
   e(i+1) = get(p,'evals');
   b(i+1) = best.fitness;
   subplot(2,1,2)
   plot(e,b,'.-')
   %axis([0 e(i+1)+100 0 ceil(logB(2^N,B))])
   xlabel('Evaluaciones de la funci�n objetivo')
   ylabel('Mejor encontrado')
   title(sprintf('CX (n=%d)',n))
   subplot(2,1,1)
   plotTSP(best.r,coordenadas,'b',2);
   title(sprintf('mejor=%f encontrado en %d evals, despu�s de %d evals ',best.fitness,best.evals,e(i+1)))
   fprintf('%s -> %f\n',sprintf('%d ',best.r),best.fitness)
   pause(0.01)
end

%% TSP con ERX
p = evaluate(p0,@fcnTSP);
best = get(p,'best');
e = 0;
b = best.fitness;
for i=1:generaciones
   p = tournament(p);
   p = permCrossover(p,@erx2);
   p = inversion(p,pi);
   p = evaluate(p,@fcnTSP);
   best = get(p,'best');
   e(i+1) = get(p,'evals');
   b(i+1) = best.fitness;
   subplot(2,1,2)
   plot(e,b,'.-')
   %axis([0 e(i+1)+100 0 ceil(logB(2^N,B))])
   xlabel('Evaluaciones de la funci�n objetivo')
   ylabel('Mejor encontrado')
   title(sprintf('ERX (n=%d)',n))
   subplot(2,1,1)
   plotTSP(best.r,coordenadas,'b',2);
   title(sprintf('mejor=%f encontrado en %d evals, despu�s de %d evals ',best.fitness,best.evals,e(i+1)))
   fprintf('%s -> %f\n',sprintf('%d ',best.r),best.fitness)
   pause(0.01)
end

%% TSP usando codificaci�n directa de Ord�nez
p = population('i',ones(1,nCiudades-1),0.1,0.9,2:nCiudades);
p = setDisplay(p,{'phenos',0}); 
p = min(p);
p = random(p,n);

p = evaluate(p,@fcnOrdonez);
best = get(p,'best');
e = 0;
b = best.fitness;
for i=1:generaciones
   p = tournament(p,4);
   p = crossover(p);
   p = mutation(p);
   p = evaluate(p,@fcnOrdonez);
   best = get(p,'best');
   e(i+1) = get(p,'evals');
   b(i+1) = best.fitness;
   subplot(2,1,2)
   plot(e,b,'.-')
   %axis([0 e(i+1)+100 0 ceil(logB(2^N,B))])
   xlabel('Evaluaciones de la funci�n objetivo')
   ylabel('Mejor encontrado')
   title(sprintf('Ord�nez directa (n=%d)',n))
   subplot(2,1,1)
   plotTSP(ordonez(best.r),coordenadas,'b',2);
   title(sprintf('mejor=%f encontrado en %d evals, despu�s de %d evals ',best.fitness,best.evals,e(i+1)))
   fprintf('%s -> %f\n',sprintf('%d ',ordonez(best.r)),best.fitness)
   pause(0.01)
end

%% TSP usando codificaci�n binaria de Ord�nez

bits = ceil(log2((1:nCiudades-1)+1));
p = population('i',bits,0.25./bits,0.9);
p = min(p);
p = random(p,n);
p = evaluate(p,@fcnOrdonez);
best = get(p,'best');
e = 0;
b = best.fitness;
for i=1:generaciones
   p = tournament(p,4);
   p = crossover(p);
   p = mutation(p);
   p = evaluate(p,@fcnOrdonez);
   best = get(p,'best');
   e(i+1) = get(p,'evals');
   b(i+1) = best.fitness;
   subplot(2,1,2)
   plot(e,b,'.-')
   %axis([0 e(i+1)+100 0 ceil(logB(2^N,B))])
   xlabel('Evaluaciones de la funci�n objetivo')
   ylabel('Mejor encontrado')
   title(sprintf('Ord�nez binaria (n=%d)',n))
   subplot(2,1,1)
   plotTSP(ordonez(best.r),coordenadas,'b',2);
   title(sprintf('mejor=%f encontrado en %d evals, despu�s de %d evals ',best.fitness,best.evals,e(i+1)))
   fprintf('%s -> %f\n',sprintf('%d ',ordonez(best.r)),best.fitness)
   pause(0.01)
end

