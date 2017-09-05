>> tomoInvVSP 
Permette di sperimentare la tomografia travel time per le geometrie VSP. Puoi duplicare gli esempi del testo ed esplorare le variazioni sul tema.
Prova la chiamata:
[estDamp, estReg] = tomoInvVSP(30, 20, 20, 20, 1, 'LAP', [10,5], [14,9], 0.01);
---------------
>> ServizioVSP
Fornisce le matrici della tomografia per geometrie VSP.
Prova la chiamata:
[G,RegDx,RegDy,RegD2x,RegD2y,RegLap] = ServizioVSP(30, 20, 20, 20);
---------------
>> modello
Fornisce il modello di lentezza degli esperimenti di tomografia
Prova la chiamata:
m = modello(20, 20, [10,5], [14,9], 0.2);
e sperimenta queste forme di visualizzazione

imagesc(m)

imagesc(m);colorbar

imagesc(m);colorbar;colormap(gray);

imagesc(m);colorbar;colormap(1-gray);

a=min(min(m));
b=max(max(m));
imagesc(m,[a,b]);colorbar; colormap(gray)
imagesc(m,[a,b]);colorbar; colormap(1-gray)
----------------

