%% Reloj de Mutaci�n en el vgGA
%
% En este script se demostrar�n las ecuaciones del reloj de mutaci�n en el
% vgGA.

%% Mutaci�n sin reloj
% Primero, la densidad de probabilidad para el n�mero de bits entre mutaciones
% para la mutaci�n usual en un AG simple, te�rica y experimentalmente.

pm = 0.01;
noMutaciones = 30000;
reloj = 0;
xUsual = [];
bins = 10;
i = noMutaciones;
while i >= 0
   if rand<=pm
      i = i - 1;
      xUsual = [xUsual reloj];
      reloj = 0;
   end
   reloj = reloj + 1;
end
ancho = (max(xUsual)-min(xUsual))/bins;
x = 1:1:max(xUsual);
nUsual = histc(xUsual,x);
nUsual = nUsual/sum(nUsual);
% Distribuci�n geom�trica
p = pm;
xn = 1:max(xUsual);
g = (1-p).^(xn-1)*p;
plot(x,nUsual,'r',xn,g,'b')
legend('experimental','te�rica')
title(sprintf('Densidad de probabilidad de bits a siguiente mutaci�n (pm=%5.3f)',pm))
xlabel('bits a siguiente mutaci�n')
ylabel('probabilidad')

%% Reloj de mutaci�n para AGS con distribuci�n geom�trica
% Ahora, obtenemos la densidad de probabilidad que se obtiene con el reloj
% de mutaci�n de un AG simple
xUnif = rand(1,noMutaciones);
xGeom = ceil( log10(1-xUnif)/log10(1-pm) );
nGeom = histc(xGeom,x);
nGeom = nGeom/sum(nGeom);
plot(x,nGeom,'r',xn,g,'b')
legend('experimental geom�trica','te�rica')
title(sprintf('Densidad de probabilidad de bits a siguiente mutaci�n (pm=%5.3f)',pm))
xlabel('bits a siguiente mutaci�n')
ylabel('probabilidad')

%% Reloj de mutaci�n para AGS con distribuci�n exponencial
% Ahora, obtenemos la densidad de probabilidad que se obtiene con el reloj
% de mutaci�n de un AG simple
xUnif = rand(1,noMutaciones);
xGeom = ceil((1/pm)*log(1./(1-xUnif)));
nGeom = histc(xGeom,x);
nGeom = nGeom/sum(nGeom);
plot(x,nGeom,'r',xn,g,'b')
legend('experimental exponencial','te�rica')
title(sprintf('Densidad de probabilidad de bits a siguiente mutaci�n (pm=%5.3f)',pm))
xlabel('bits a siguiente mutaci�n')
ylabel('probabilidad')


%% Reloj de mutaci�n del vgGA con enteros
xUnif = rand(1,noMutaciones);
phi = (1/pm)*log(1./(1-xUnif)); 
delta = 2;  % ancho de mutaci�n
mEntTrad = traditional(logB(delta) + phi);
nEntTrad = histc(mEntTrad,x);
nEntTrad = nEntTrad/sum(nEntTrad);
plot(x,nEntTrad,'r',xn,g,'b')
legend('experimental enteros tradicional exponecial','te�rica')
title(sprintf('Densidad de probabilidad de bits a siguiente mutaci�n (pm=%5.3f)',pm))
xlabel('bits a siguiente mutaci�n')
ylabel('probabilidad')

