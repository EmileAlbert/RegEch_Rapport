s = tf('s');
%z = tf('z', 0.1); 

H2 = 1/(s+1)^2;
H3 = 1/(s+1)^3;
H4 = 1/(s+1)^4;
H5 = 1/(s+1)^5;

Hd22 = c2d(H2, 0.01)
Hd23 = c2d(H2, 0.001)
Hd24 = c2d(H2, 0.0001)

Hd32 = c2d(H3, 0.01)
Hd33 = c2d(H3, 0.001)
Hd34 = c2d(H3, 0.0001)

Hd42 = c2d(H4, 0.01)
Hd43 = c2d(H4, 0.001)
Hd44 = c2d(H4, 0.0001)

Hd52 = c2d(H5, 0.01)
Hd53 = c2d(H5, 0.001)
Hd54 = c2d(H5, 0.0001)

hold on
pzmap(Hd22);
pzmap(Hd32);
pzmap(Hd42);

% legend('sampling time = 0.1','sampling time = 0.01')
