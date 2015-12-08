%% Hinweise

% 1. Bitte in spaceballs.m die Initialisierung komplett auskommentieren
% 2. In spaceballs.m "spiel.zeitraffer_checkbox_anfangswert" auf true setzen

%% 1.) Statistik �ber beliebige Zufallswerte   &   Voreinstellungen

% A.) Bitte hier die eigene Farbe angeben:
meineFarbe = 'blau';

% B.) Bitte hier die Anzahl der gew�nschten Durchg�nge angeben:
Durchgaenge =5;

% C.) Zuerst Teil 1 �ber Strg+Enter (bzw. cmd+Enter) ausf�hren
%    nach get�tigten �nderungen je nach Pr�ferenz Teil 2 oder Teil 3 �ber Strg+Enter (bzw. cmd+Enter) ausf�hren

clc
stats(Durchgaenge, meineFarbe, 2);


%% 2.) Statistik �ber alle in 1. genutzten Zufallswerte
%      [z.b zur �berpr�fung nach Ver�nderung in beschleunigung.m]

clc
stats([], [], 1);


%% 3.) Statistik �ber alle problematischen Seeds aus 1.)
%      [explizite Betrachtung der Seeds, bei denen verloren oder unent. gespielt wurde]

clc
stats([], [], 0);