%% Redes de sort
% Intento probar la coevoluci�n de redes de sort a la Hilis
% NO FUNCIONA


%%

redes = population('i',4*ones(1,10));
redes = random(redes,10);
listas = population('i',4);
listas = random(listas,10);

%%
for ciclos=1:20
   red = get(redes,r);
   lista =  get(listas,r);
   for i=1:10
      for j=1:10
         [fi(i),fj(j)] = evaluarRed(red(:,i),lista(:,j));
      end
   end
   redes = set(redes,'r',fi);
   listas = set(listas,'fitness',fj);
   redes =  tournament(redes);
   listas = tournament(listas);
   redes = crossover(redes);
   listas = crossover(listas);
   redes = mutation(redes);
   listas = mutation(listas);
end

for i=1:get(redes,'n');
   evaluarRed(red);
end