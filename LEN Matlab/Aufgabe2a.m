% Gegebene Werte initialisieren

load('dataset_Aufgabenpaket2.mat');

% R in Ohm

R3 = 80;

% Momentanleistung in Watt

P = (UR3_timevar.^2)./R3;

% Grafiken erstellen

figure("Name","Aufagbe 2a");

nexttile 

p1 = plot(t_timevar, UR3_timevar, "b");
title("Spannungsverlauf über R3");
xlabel("Zeit in ms");
ylabel("Spannung in Volt");
p1.LineWidth = 2;

nexttile

p2 = plot(t_timevar, P, "r");
title("Momentanleistung über R3");
xlabel("Zeit in ms");
ylabel("Momentanleistung in Watt");
p2.LineWidth = 2;