function integralFass = fassregel(x, y, intervallbreite)
%Funktion fassregel
% Autor             :   Jan Hoegen
% Erstelldatum      :   2020-11-28
% Beschreibung      :   Integriert eine Funktion durch Unterteilung in Intervalle aus jeweils 3 Abtastwerten.
% Input:            :   Zeilenvektor x (1xN); Abtastpunkte;
%                   :   Zeilenvektor y (1xN); Abtastwerte;
%                   :   intervallbreite (geradzahliger Skalar) in Samples;
% Output            :   integralFass (Skalar); Integralwert

[x_AnzahlZeilen, x_AnzahlSpalten] = size(x);

[y_AnzahlZeilen, y_AnzahlSpalten] = size(y);

% Überprüfen ob Länge x gleich Länge y
if x_AnzahlSpalten ~= y_AnzahlSpalten

    error('x und y haben nicht die gleiche Länge')

elseif y_AnzahlZeilen ~= 1 || x_AnzahlZeilen ~= 1

    error('x oder y ist kein Zeilenvektor')

elseif intervallbreite < 2 || rem(intervallbreite, 2) ~= 0

    error('intervallbreite ist kein geradzahliger Wert größer gleich 2.')
    
end

% Integral initialisieren

integralFass = 0;

% weitere Parameter

c = mod(x_AnzahlSpalten, intervallbreite);

d = x_AnzahlSpalten - c;

e = d/intervallbreite;

% Fassregel
%e = floor(x_AnzahlSpalten/intervallbreite)

for i = 1:e

    a = x(i);
    b = x(i + intervallbreite);
    m = x(a+abs(a-b)/2);

    s_a = y(i);
    s_b = y(i + intervallbreite);
    s_m = y(s_a+abs(a-b)/2);

    S = (b - a) / 6 * (s_a + 4 * s_m + s_b);

    integralFass = integralFass + S;

end

% Rechteckregel für alle Samples, die nicht von Fassregel erfasst werden

if b ~= x(1,end)
    
    a = x(1, end-1);
    b = x(1, end);
    m = x(floor(a+abs(a-b)/2));
    y_m = y(m);

    rechteck = y_m *abs(a-b);

    integralFass = integralFass + rechteck;

end