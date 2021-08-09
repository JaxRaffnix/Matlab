% Gegebene Werte
% Widerstände in Ohm
R1 = 50;
R2 = 150;
R3 = 80;
R4 = 100;
R5 = 30;
Ri1 = 0.8;
Ri2 = 0.8;

% Spannungen in Volt
U1 = 10;
U2 = 1.5;

% Widerstandsmatrix
R = [Ri1+R1+R4 -R4 -R1 0; -R4 R3+R4+R5 -R3 0; -R1 -R3 R1+R2+R3 -R2; 0 0 -R2 Ri2+R2]

% Spannungsvektor
U = [U1; 0; 0; -U2]