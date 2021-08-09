% Messungen einlesen, nach 2200.Wert kappen
% U_mess = 0.5 * U_R_Last

messungA = Kanal_1(1:2200) * 2;     
messungB = Kanal_2(1:2200) * 2;     
x = linspace(0,2200,2200);

% Auswertung

messungA_max = max(messungA(:));
messungA_max_index = find(messungA >= messungA_max);

messungB_max = max(messungB(:));
messungB_max_index = find(messungB >= messungB_max);

messungB_t1 = messungB(1);

messungA_t1 = messungA(1);
messungA_gleich_messungB_t1 = find(messungA >= messungB_t1);
messungA_gleich_messungB_t1 = messungA_gleich_messungB_t1(1);

% Diagramme erstellen
tiledlayout(2,1)

nexttile
plot(x,messungA) 
axis([0 2200 0 1.5])
yA=yline(messungA_max,"k",sprintf("U_{max} = %.3f V", messungA_max));
yA.LabelVerticalAlignment = "top";
yA.LabelHorizontalAlignment = "center";
yA.Color = [0.8500 0.3250 0.0980]
title('a) Spannungsverlauf mit Speicherkondensator')
xlabel("Zeit t [s]")
ylabel("Spannung U [V]")
grid on, grid minor

nexttile
plot(x,messungB)
axis([0 2200 0 1.5])
yB=yline(messungB_max,"k",sprintf("U_{max} = %.3f V", messungB_max));
yB.LabelVerticalAlignment = "top";
yB.LabelHorizontalAlignment = "center";
yB.Color = [0.8500 0.3250 0.0980];
title('b) Spannungsverlauf ohne Speicherkondensator')
xlabel("Zeit t [s]")
ylabel("Spannung U [V]")
grid on, grid minor