% Statistikprogramm 

%ANLEITUNG

% 1. bitte in spaceballs.m die Initialisierung komplett auskommentieren

% 2. bitte hier die eigene Farbe angeben:

meineFarbe = 'blau';

% 3. bitte hier die Anzahl der gew�nschten Durchg�nge angeben:

Durchgaenge = 3;

% 4. zuerst Teil 1 �ber Strg+Enter (bzw. cmd+Enter) ausf�hren
%    nach get�tigten �nderungen je nach Pr�ferenz Nr 2 oder Nr 3 �ber Strg+Enter (bzw. cmd+Enter) ausf�hren



%%1.) Statistik �ber beliebige Zufallswerte
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