function graficaRed(hijo, C, envia)

N = length(hijo);

delta = 0.1; % desplazamiento de las etiquetas
plot(C(1,1),C(1,2),'sr',C(2:end,1),C(2:end,2),'ob')
xlim([min(C(:,1))-0.5 max(C(:,1)+0.5)]);
ylim([min(C(:,2))-0.5 max(C(:,2)+0.5)]);
hold on
for p=2:N
   h = hijo(p);
   text(C(p,1)+delta,C(p,2)+delta,sprintf('%d:%d/%d',p-1,prod(p),envia(p)))
   plot([C(p,1) C(h,1)],[C(p,2) C(h,2)],'-b')
end
text(C(1,1)+delta,C(1,2)+delta,'0')
hold off
title('Red electrica (nodo:produccion/envia)')
xlabel('x')
ylabel('y')