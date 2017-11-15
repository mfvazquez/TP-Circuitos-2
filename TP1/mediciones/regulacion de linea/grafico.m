close all
clear

fID = fopen('datos.csv');
data = textscan(fID, '%f;%f');
fclose(fID);
Vi = data{1};
Vo = data{2};

inicio = 19; % LIMITE SUPERIOR DEL MODO REG DE TENSION

p= polyfit(Vi(inicio:end),Vo(inicio:end),1);

Vin = 16:0.1:30;
Vout = p(1) * Vin + p(2);

20*log10(p(1))

figure
plot(Vi(inicio:end),Vo(inicio:end), 'bo');
hold on
plot(Vin, Vout, 'r');
grid
xlabel('Tensión de entrada [V]');
ylabel('Tensión de salida [V]');





figure
plot(Vi,Vo, 'k', 'Linewidth',5);
grid
xlabel('Tensión de entrada [V]');
ylabel('Tensión de salida [V]');
print('reg_linea','-dpng')