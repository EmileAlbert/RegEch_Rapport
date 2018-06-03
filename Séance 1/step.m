h = 0.01;
s = tf('s');
z = tf('z', h);

Hc = 1 / (s + 1)

% Euler � gauche
sg = (z - 1)/h;
Hg = 1 / (sg + 1)

% Euler � droite
sd = (z-1)/(h*z);
Hd = 1 / (sd + 1)

% Bilin�aire
Hb = c2d(Hc, h, 'tustin') 

% ZOH
Hzoh = c2d(Hc, h)

figure;
hold on;
step(Hc);
step(Hg);
step(Hd);
step(Hb);
step(Hzoh);
legend('Syst�me continu', 'Euler � gauche', 'Euler � droite', 'Bilat�rale', 'ZOH');
title("R�ponse indicielle avec h=0.01");
hold off;

figure;
pzmap(Hc, Hg, Hd, Hb, Hzoh);
grid on;