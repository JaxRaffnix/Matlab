%Gegebene Werte initialisieren

k = 1000;        %Umrechnungsfaktor

% R in Ohm
R = [270.7 -120 -150 0; -120 400 -240 0; -150 -240 690 -300; 0 0 -300 300.7];

R3 = 80;

% U in V
U = [12; 0; 0; -2.5];

% IR3 berechnen

IM = CramerscheRegel(R, U);

IR3 = IM(3,:)-IM(2,:);

IR3 = IR3.*k;     % in mA

IR3 = round(IR3, 2);

fprintf("Durch den Widerstand R3 fließt ein Strom von %g mA.\n", IR3);

IR3 = IR3./k;      %in A

% Spannung R3 mit 2 Nachkommastellen berechnen

UR3 = R3 .* IR3;
UR3 = round(UR3, 2);

fprintf("Über dem Widerstand R3 fällt eine Spannung von %g V ab.\n", UR3);

function x = CramerscheRegel(A, b)
%Funktion CramerscheRegel
%Autor              :   Jan Hoegen
%Erstellungsdatum   :   22.11.1999
%Beschreibung       :   Löst ein lineares Gleichungssystem A*x=b mithilfe der Cramerschen Regel.
%Input              :   Matrix A (Dimension NxN);
%                       Vektor b (Dimension Nx1);
%Output             :   Vektor x (Dimension Nx1); Lösung des linearen Gleichungssystems A·x=b

    %Initalisierung der Startwerte
    [AnzahlZeilenA, AnzahlSpaltenA] = size(A);

    [AnzahlZeilenb, AnzahlSpaltenb] = size(b);
    
    %Prüfen, ob Bedingunen erfüllt sind
    if AnzahlZeilenA == AnzahlSpaltenA && AnzahlZeilenb == AnzahlZeilenA

        Deter_A = det(A);
    
        %Für jede vorhandene Zeile die Camersche Regel anwenden durch ersetzen einer Spalte von A durch x. Dann Determinante bestimmen 
        for i = 1:AnzahlZeilenb
            
            Ai = A;
            Ai(:,i) = b;

            xi(i,:) = det(Ai)/det(A);
            
            x = [xi];

        end

    else

        error('Eingabe A ist keine quadratische Gleichung oder b hat nicht die gleiche Länge wie A')
        
    end
end