function bes = beschleunigung(spiel, farbe)

%%Farbe pr�fen und zuweisen
    if strcmp (farbe, 'rot')
        me = spiel.rot;
        enemy = spiel.blau;
    else
        me = spiel.blau;
        enemy = spiel.rot;
    end
    
   bes= -me.ges;
end