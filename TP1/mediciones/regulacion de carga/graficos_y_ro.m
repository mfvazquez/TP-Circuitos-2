close all
clear

fID = fopen('datos.csv');
data = textscan(fID, '%f;%f');
fclose(fID);
Vo = data{1};
Io = data{2};

fin_t = 95; % LIMITE SUPERIOR DEL MODO REG DE TENSION

p_tension = polyfit(Io(1:fin_t),Vo(1:fin_t),1);

I_fit_t = 0:0.1:215;
V_fit_t = p_tension(1) * I_fit_t + p_tension(2);

figure
plot(Io(1:fin_t),Vo(1:fin_t), 'bo');
hold on
plot(I_fit_t, V_fit_t, 'r');
legend('medicion',sprintf('ajuste, ro = %0.1f Ohm',p_tension(1)*-1e3));
xlabel('Corriente [mA]');
ylabel('Tension [V]');
print('reg_carga_tension','-dpng')

inicio_c = 99;
p_corriente = polyfit(Io(inicio_c:end),Vo(inicio_c:end),1);

I_fit = 230:0.1:238;
V_fit = p_corriente(1) * I_fit + p_corriente(2);

figure
plot(Io(inicio_c:end),Vo(inicio_c:end), 'bo');
hold on
plot(I_fit, V_fit, 'r');
legend('medicion',sprintf('ajuste, ro = %0.1f Ohm',p_corriente(1)*-1e3));
xlabel('Corriente [mA]');
ylabel('Tension [V]');
print('reg_carga_corriente','-dpng')

figure
plot(Io,Vo, 'k', 'Linewidth',5);
grid
xlabel('Corriente [mA]');
ylabel('Tension [V]');
print('reg_carga','-dpng')



figure
plot(Io,Vo, 'bo');
hold on
plot(I_fit_t, V_fit_t, 'r');
hold on
plot(I_fit, V_fit, 'g');
legend('medicion',sprintf('ajuste, ro = %0.1f Ohm',p_tension(1)*-1e3), sprintf('ajuste, ro = %0.1f Ohm',p_corriente(1)*-1e3),'Location','SouthWest' );
xlabel('Corriente [mA]');
ylabel('Tension [V]');
print('reg_carga_ajustes','-dpng')

