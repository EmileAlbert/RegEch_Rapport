clear;

% Continuous
% On synth�tise le r�gulateur en fonction du syst�me continu 
% ENSUITE on discr�tise le r�gulateur 
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
% On discr�tise le syst�me 
% ENSUITE on synth�tise le r�gulateur en fonction du syst�me discret
Hd = c2d(H,h);
[Zd, Pd, kd] = zpkdata(Hd, 'v');
Rd2 = zpk(Pc(2), Zc, 1/kc);
minreal(Rd2)

% Calcul de K pour avoir pdf = e^(sh) = e^((-3/5)*h)