close all
clear

fID = fopen('datos.csv');
data = textscan(fID, '%f;%f');
fclose(fID);
Vi = data{1};
Vo = data{2};


figure
plot(Vi,Vo, 'k', 'Linewidth',5);
grid
xlabel('Tensión de entrada [V]');
ylabel('Tensión de salida [V]');
print('reg_linea','-dpng')