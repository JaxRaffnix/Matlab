T_C=78
U_R=0.7;
U_ges=3.3;

% R(T) des NTC bestimmen
T_K=T_C+273.15
R_25=10000;

R_NTC=R_25*exp(-14.6337+4791.842./T_K-115334./T_K^2-3730535./T_K^3)

% Aufgabe 2.3
P_NTC=0.015;

R=U_ges*sqrt(R_NTC/P_NTC)-R_NTC

% Aufgabe 2.4.1
R_R=U_R/((U_ges - U_R)/R_NTC)

% Augabe 2.4.2
R_R3=U_R/((U_ges-2*U_R)/R_NTC)