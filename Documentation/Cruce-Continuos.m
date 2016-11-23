
%% C�mo funciona las correcciones de cruce
% Para probar las correcciones de cruce vamos a cruzar dos n�meros reales R1 
% y R2 en [0,1) para todos los valores posibles.
R1 = 0.8; 
R2 = 0.5; 
B = 2;
N = 5;
kExpT = B.^[1:1:N]/B^N;    % distribuci�n exponencial d�gitos tradicionales
kExpG = B.^[1:0.1:N]/B^N;  % distribuci�n uniforme d�gitos generalizados
kUnif = 0:0.002:1;         % distribuci�n uniforme d�gitos continuos

%% Distribuci�n exponencial d�gitos tradicionales
clear ExpT1 ExpT2
for i=1:length(kExpT)
   [ExpT1(i) ExpT2(i)] = crossAt(R1,R2,kExpT(i));
end
plot([0 1],[R1 R1],'or',[0 1],[R2 R2],'or',kExpT,ExpT1,'ob',kExpT,ExpT2,'ob')
xlabel('k (valor de cruce)')
ylabel('hijos')
legend('pap�s')
title('Cruce con d�gitos tradicionales, distribuci�n exponencial')
grid on

%% distribuci�n uniforme d�gitos generalizados

clear ExpT1 ExpT2 ExpG1 ExpG2
for i=1:length(kExpT)
   [ExpT1(i) ExpT2(i)] = crossAt(R1,R2,kExpT(i));
end
for i=1:length(kExpG)
   [ExpG1(i) ExpG2(i)] = crossAt(R1,R2,kExpG(i));
end

plot([0 1],[R1 R1],'or',[0 1],[R2 R2],'or',...
     kExpT,ExpT1,'ob',kExpT,ExpT2,'ob',...
     kExpG,ExpG1,'+g',kExpG,ExpG2,'+g')
axis([0 1 0 1.4])
legend('pap�s')
xlabel('k')
ylabel('hijos')
xlabel('k (valor de cruce)')
ylabel('hijos')
title('Cruce con d�gitos generalizados, distribuci�n uniforme')
grid on

%% distribuci�n uniforme d�gitos cont�nuos

clear ExpT1 ExpT2 ExpG1 ExpG2 Unif1 Unif2
for i=1:length(kExpT)
   [ExpT1(i) ExpT2(i)] = crossAt(R1,R2,kExpT(i));
end
for i=1:length(kExpG)
   [ExpG1(i) ExpG2(i)] = crossAt(R1,R2,kExpG(i));
end
for i=1:length(kUnif)
   [Unif1(i) Unif2(i)] = crossAt(R1,R2,kUnif(i));
end

plot([0 1],[R1 R1],'or',[0 1],[R2 R2],'or',...
     kExpT,ExpT1,'ob',kExpT,ExpT2,'ob',...
     kExpG,ExpG1,'+g',kExpG,ExpG2,'+g',...
     kUnif,Unif1,'-k',kUnif,Unif2,'-k')
legend('pap�s')
xlabel('k (valor de cruce)')
ylabel('hijos')
title('Cruce con d�gitos continuos, distribuci�n uniforme')
grid on


%% distribuci�n uniforme d�gitos cont�nuos, correcci�n gamma

clear ExpT1 ExpT2 ExpG1 ExpG2 Unif1 Unif2 UnifC1 UnifC2
for i=1:length(kExpT)
   [ExpT1(i) ExpT2(i)] = crossAt(R1,R2,kExpT(i));
end
for i=1:length(kExpG)
   [ExpG1(i) ExpG2(i)] = crossAt(R1,R2,kExpG(i));
end
for i=1:length(kUnif)
   [Unif1(i) Unif2(i)] = crossAt(R1,R2,kUnif(i));
end
for i=1:length(kUnif)
   [UnifC1(i) UnifC2(i)] = crossAtc(R1,R2,kUnif(i),1);
end

plot([0 1],[R1 R1],'or',[0 1],[R2 R2],'or',...
     kExpT,ExpT1,'ob',kExpT,ExpT2,'ob',...
     kExpG,ExpG1,'+g',kExpG,ExpG2,'+g',...
     kUnif,Unif1,'--k',kUnif,Unif2,'--k',...
     kUnif,UnifC1,'-k',kUnif,UnifC2,'-r')
xlabel('k (valor de cruce)')
ylabel('hijos')
legend('pap�s')
title('Cruce con d�gitos continuos y correcci�n gamma,distribuci�n uniforme')
grid on
  
