s = tf('s'); % Dérivateur pure (iréalisable en pratique)
z = tf('z', 0.1); 

Hc = 1/(s+1);
H3 = 1/(s+1)^3;

Hd = c2d(Hc, 0.1); % c2d continous to discrete
Hd = c2d(H3, 0.1);

%pzmap(Hd);

sg = (z-1)/0.1
Hg = 1/(sg+1)

% step(Hg)

