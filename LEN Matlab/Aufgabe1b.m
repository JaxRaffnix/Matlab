A = [1 2 3; 4 5 6; 7 8 9];
b = [10; 20; 80];

x = CramerscheRegel(A,b)

function x = CramerscheRegel(A, b)
%Funktion CramerscheRegel
%Autor              :   Jan Hoegen
%Erstellungsdatum   :   2020-11-22
%Beschreibung       :   Löst ein lineares Gleichungssystem A*x=b mithilfe der Cramerschen Regel.
%Input              :   Matrix A (Dimension NxN);
%                       Vektor b (Dimension Nx1);
%Output             :   Vektor x (Dimension Nx1); Lösung des linearen Gleichungssystems A·x=b

    %Initalisierung der Startwerte
    [AnzahlZeilenA, AnzahlSpaltenA] = size(A);

    [AnzahlZeilenb, AnzahlSpaltenb] = size(b);
    
    %Prüfen, ob Bedingunen erfüllt sind
    if AnzahlZeilenA == AnzahlSpaltenA & AnzahlZeilenb == AnzahlZeilenA

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