clear;

% Continuous
% On synthétise le régulateur en fonction du système continu 
% ENSUITE on discrétise le régulateur 
h = 0.01;

H = tf([7 7],[3 1 0]);
[Zc, Pc, kc] = zpkdata(H, 'v');

R = zpk(Pc(2), Zc, 1/kc);

K = (5/3)^(-1);

R = K*R; 
Bo = R*H;

Bf = Bo /(1 + Bo);
Bf = minreal(Bf);

%hold on 
%step(Bf)
%grid
%line([0 20], [0.95 0.95]) 
%ginput(1)

Rd = c2d(R, h) 
%pzmap(Rd)

% Discrete 
% On discrétise le système 
% ENSUITE on synthétise le régulateur en fonction du système discret
Hd = c2d(H,h);
[Zd, Pd, kd] = zpkdata(Hd, 'v');
Rd2 = zpk(Pc(2), Zc, 1/kc);
minreal(Rd2)

% Calcul de K pour avoir pdf = e^(sh) = e^((-3/5)*h)