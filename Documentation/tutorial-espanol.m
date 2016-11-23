%% Tutorial del vgGA
%
% El *vgGA* est� programado orientado a objetos. El vgGA est� basado en la 
% clase |population| definida en el directorio |@population/|. En MATLAB
% todos los m�todos de una clase deben colocarse en un directorio que 
% empiece con el caracter @ (arroba) y que tenga el mismo nombre de la 
% clase. 
%
% El constructor de la clase debe ser una funci�n con el mismo nombre de 
% la clase, y que regrese una instancia de la clase que se contruya con la 
% funci�n |class|. La forma en que se despliega una instancia de una clase 
% queda determinada por el m�todo |display| que el usuario debe definir.
%
% MATLAB no permite accesar los campos de un objeto fuera de los m�todos 
% de ese objeto. Es usual contruir m�todos espec�ficos para obtener y 
% modificar campos de una clase. La clase |population| tiene los 
% m�todos |get| y |set| para este fin; sin embargo, est�n % limitados a 
% los campos que se requirieron para pruebas, y no son muy generales. 
%
% En MATLAB, a menos que se declaren globales, todas las variables son 
% locales a las funciones que las utilizan. Los m�todos de una clase son 
% simplemente funciones que deben recibir la instancia de la clase sobre 
% la que van a trabajar, y deben regresarla para su asignaci�n si es que 
% deben modificar la instancia. 

%% Creaci�n de una poblaci�n vac�a
% Para crear un objeto |p| de la clase population se utiliza el
% constructor de la clase. Por ejemplo, para crear una poblaci�n de 
% enteros, con dos segmentos (uno de 6 d�gitos binarios, otro de 3 d�gitos 
% base 5), con probabilidades de mutaci�n de 0.4 y 0.2, y probablidad de 
% cruce 0.9, se utiliza la siguiente instrucci�n:
p = population('integer',[6 3],[0.4 0.2],0.9,[2 5])

%% Individuos aleatorios
% Para crear 10 individuos aleatorios se utiliza el m�todo |random| como
% se muestra a continuaci�n.
%
% Para cada individuo se lista su genotipo, fenotipo, y evaluaci�n.  Los
% individuos tiene evaluaciones de |NaN| (_Not a Number_) porque todav�a 
% no han sido evaluados.

p = random(p,10)


%% Evaluaci�n
% La poblaci�n se eval�a con el m�todo |evaluate| que recibe la funci�n 
% objetivo como par�metro.
%
% El m�todo |display| despliega informaci�n general de la poblaci�n: 
% aptitud promedio, desviaci�n est�ndar de la aptitud de la apitud. 
% Tambi�n se despliega cu�ntas evaluaciones se han realizado, en cu�l 
% evaluaci�n se encontr� el |mejor encontrado|, y el mejor encontrado. En 
% este ejemplo la poblaci�n se eval�a con la funci�n |x2y2| que es una 
% funci�n que recide en el directorio ra�z |vgGA/|, y que regresa la suma 
% de los cuadrados de los segmentos. El m�todo |evaluate| espera una 
% funci�n que reciba un vector que corresponde al fenotipo (campo |r|) de 
% cada individuo, y regresa su evaluaci�n.
p = evaluate(p,@x2y2)

%% Selecci�n
% Para realizar selecci�n de rueda de ruleta sobre la poblaci�n se aplica 
% el m�todo |roulette| (hay otros m�todos de selecci�n implementados en el
% vgGA).
%
% Los m�todos |sus| y |tournament| implementan selecc��n universal
% estoc�stica y selecci�n de torneo, respectivamente.
%
% N�tese que la mayor�a de los individuos tienen una evaluaci�n de |NaN|
% porque no han sido evaluados.
p = roulette(p)

%% Cruce y mutaci�n
% Cruce y mutaci�n se realizan con los m�todos |crossover| y |mutation|:
p = crossover(p)
p = mutation(p)

%% Algoritmo gen�tico
% Con los m�todos |population|, |random|, |evaluate|, |roulette|, 
% |crossover|, y |mutation| es posible crear un algoritmo gen�tico que 
% corra por un n�mero de generaciones y que regrese el individuo _mejor 
% encontrado_ contra el n�mero de evaluaciones de la generaci�n.  El 
% m�todo |runGA| hace lo anterior. En las siguientes instrucciones se 
% corre la poblaci�n |p| por 50 generaciones y se grafica el mejor 
% encontrado contra el n�mero de evalauciones de la funci�n objetivo:
[p,B] = runGA(p,@x2y2,50);
plot(B(:,1),B(:,2))

%% Curva del mejor encontrado
% Para obtener la |curva del mejor encontrado| existe la funci�n |plotGA| 
% en el directorio ra�z |vgGA|. Esta funci�n crea una poblaci�n y llama 
% repetidamente a |runGA| para luego graficar el promedio, m�s y menos la  
% desviaci�n est�ndar, del mejor encontrado de una serie de corridas de un 
% algoritmo gen�tico.  Con la siguiente instrucci�n se corre el algoritmo 
% gen�tico de este tutorial 20 veces por 50 generaciones.
plotGA(20,50,10,@x2y2,'random',...
   'integer',[6 3],[0.4 0.2],0.9,[2 5]);





