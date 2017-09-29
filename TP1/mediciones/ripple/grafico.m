close all
clear

fID = fopen('datos.csv');
data = textscan(fID, '%f;%f;%f');
fclose(fID);
Vi = data{1};
Vo = data{2};
f = data{3};

db = 20*log10(Vo./Vi);

figure
semilogx(f,db, 'k', 'Linewidth',5);
grid
xlabel('Frecuencia [kHz]');
ylabel('Vo/Vi [dB]');

print('ripple','-dpng')